<?php
/**
 * Created by RoyeeCai.
 * User: RoyeeCai
 * Date: 2021-03-18
 * Time: 13:09
 */

namespace app\common\tool;



use think\facade\Log;

class JzylbInterfaceTest{

    /**
     * @var  php操作oci类
     * 用于操作oracle数据库
     */

    private  $conn = null;
    private  $stmt = null;
    private static $instance;
    private $message=null;
    public static $username="ambase";
    public static $password="ambase";
    public static $connstr="10.87.230.223/orcl";
    public static $charset="UTF8";

    /**
     * 建立数据库连接
     * @return null|resource
     */

    public function __construct()
    {

        $this->connect();
    }

    /**
     * @return 获取受影响行数
     */
    public function getAffectRows(){
        return oci_num_rows($this->stmt);
    }

    /**
     * 获取报错提示信息
     * @return
     */
    public function getMessage(){
        return $this->message;
    }

    public function connect(){
        //$tmp_config = $this->configs;
        $this->conn = oci_connect(self::$username,self::$password,self::$connstr,self::$charset);
        if(!$this->conn){
            $this->message = oci_error();
        }
        return $this->conn;
    }

    /**
     * 获取数据库对象
     * @return PhpOci
     */
    public static function getInstance($config=[]){
        if(!empty($config))
        {
            self::$username=$config['username'];
            self::$password=$config['password'];
            self::$connstr=$config['connstr'];
            self::$charset=$config['charset'];
        }
        if(self::$instance == false) {
            self::$instance =new self;
        }
        return self::$instance;
    }


    function create_table($sql)
    {
        $this->stmt = oci_parse($this->conn, $sql);
        oci_execute($this->stmt);
        return true;
    }

    function drop_table($sql)
    {
        $this->stmt = oci_parse($this->conn, $sql);
        oci_execute($this->stmt);
        //echo $this->conn . " dropped table\n\n";
        return true;
    }

    function insert_data($sql)
    {
        $this->stmt = oci_parse($this->conn, $sql);
        oci_execute($this->stmt, OCI_DEFAULT);
    }


    function commit()
    {
        oci_commit($this->conn);
    }

    function rollback()
    {
        oci_rollback($this->conn);
    }

    function execSql($sql)
    {
        $this->stmt = oci_parse($this->conn, $sql);
        oci_execute($this->stmt);
        return true;
    }

    /**
     * 获取数据库数据
     * 返回二维数组。。。
     * @param $sql
     * @return array
     */
    public function findAll($sql)
    {
        $data =[];
        $this->stmt = oci_parse($this->conn, $sql);
        oci_execute($this->stmt, OCI_DEFAULT);
        while(($row = oci_fetch_assoc($this->stmt)) != false) {
            $data[] = $row;
        }
        return $data;
    }

    /***
     * 查询一条数据 返回一维数组
     * @param $sql
     * @return array|mixed
     */
    public function findOne($sql)
    {
        $data =[];
        $this->stmt = oci_parse($this->conn, $sql);
        oci_execute($this->stmt, OCI_DEFAULT);
        while(($row = oci_fetch_assoc($this->stmt)) != false) {
            $data[] = $row;
        }
        if(!empty($data))
        {
            $data = $data[0];
        }

        return $data;
    }

    /***
     * 查询一条数据 返回第一行第一列
     * @param $sql
     * @return string
     */
    public function findOneField($sql)
    {
        $data =[];
        $this->stmt = oci_parse($this->conn, $sql);
        oci_execute($this->stmt, OCI_DEFAULT);
        while(($row = oci_fetch_assoc($this->stmt)) != false) {
            $data[] = $row;
        }
        if(!empty($data))
        {
            $data = $data[0];
        }
        foreach ($data as $k=>$v)
        {
            //只提取第一个值；
            return $v;
        }
        return "";
    }

    /**
     * 自动插入数据库语句 拼凑sql
     * @param $data
     * @param $table
     * @return bool
     */
    public function autoInsert($data,$table) {
//		insert into 表名 (字段1,字段2,字段N) values ('值1','值2','值N')
//		$data = array(
//			'字段1'=>'值1',
//			'字段2'=>'值2',
//			'字段3'=>'值3',
//		);
        //拼凑insert表名
        $sql = "insert into ".$table." ";

        //拼凑字段列表部分
        $fields = array_keys($data);//取得所有键
        $fields = array_map(function($v){return $v;}, $fields);//使用反引号包裹字段名
        $fields_str = implode(', ', $fields);//使用逗号连接起来即可
        $sql .= '(' . $fields_str . ')';

        //拼凑值列表部分
        $values = array_map(function($v) {return "'".$v."'";}, $data);//获得所有的值，将值增加引号包裹
        $values_str = implode(', ', $values);//再使用逗号连接
        $sql .= ' values (' . $values_str . ')';
        //var_dump($sql);exit;
        Log::write($sql);
        //执行该insert语句
        try{
            $this->stmt = oci_parse($this->conn, $sql);
            oci_execute($this->stmt, OCI_DEFAULT);
            $this->commit();
            return true;
        }catch(\Exception $e){
            $this->message=$e->getMessage();
            $this->rollback();
            return false;
        }
        //echo $this->conn . " inserted hallo\n\n";

    }


    /**
     * @param $table   要更新的表
     * @param $data    要更新的数据['fields'=>'value',...]
     * @param $id      根据什么字段更新  如 id,rowid   字段要包含在$data中
     * @return string  返回执行成功
     */
    public function autoUpdate($table,$data,$id='id'){
        $str = "";
        $pk_value = '';
        if(!empty($data)){
            if(isset($data[$id])){
                $pk_value = $data[$id];
                unset($data[$id]);
            }
            foreach($data as $k=>$v){
                $str .= "$k="."'".$v."'".",";
            }
            $str = substr($str,0,-1);
        }
        $sql="update {$table} set ".$str." where {$id}='".$pk_value."'";
        //执行该insert语句
        try{
            $this->stmt = oci_parse($this->conn, $sql);
            oci_execute($this->stmt, OCI_DEFAULT);
            $this->commit();
            return true;
        }catch(\Exception $e){
            $this->rollback();
            return false;
        }
    }

    // 调用存储过程函数

    /**
     * @
     * @param $procName 调用存储过程名称
     * @param array $params 输入参数
     * @param array $bindParams 绑定输出参数
     * @return array  code =1 表示成功  其他表示失败
     */
    public function callProcedure($procName,$params=[],$bindParams=[]){
        $result = [
            'code'=>0, //0 表示失败 1 表示成功
            'message'=>'失败',
            'output'=>[]
        ];
        if($procName == ""){return $result;}
        try{
            $sql = "BEGIN ".$procName."(";
            if(!empty($params))
            {
                foreach ($params as $k=>$v)
                {
                    //拼凑 入参
                    $sql.="{$k}=>'{$v}',";
                }
            }
            if(!empty($bindParams))
            {
                foreach ($bindParams as $v)
                {
                    //$$v['key'] = "";
                    $sql .= "{$v['value']}=>:".$v['value'].",";
                }
            }
            $sql = substr($sql,0,strlen($sql)-1)."); END;";
            //var_dump($sql);//exit;
            $this->stmt = OCIParse($this->conn, $sql);//执行绑定
            if(!empty($bindParams))
            {
                foreach ($bindParams as $v)
                {
                    $_key='ex_'.$v['key']; //定义输出参数变量 为了避免变量冲突 增加变量前缀
                    $$_key = '';
                    OCIBindByName($this->stmt, ":".$v['value'], $$_key ,$v['length']);
                }
            }
            OCIExecute($this->stmt); //结果执行
            if(!empty($bindParams))
            {
                foreach ($bindParams as $v)
                {
                    //获取输出参数结果
                    $_key='ex_'.$v['key'];
                    $result['output'][$v['key']]=$$_key;
                }
            }
            $result['code']=1;
            $result['message']="成功了！";
        }catch(\Exception $ex){
            $result['message'] = "失败了！".$ex->getMessage();
            $result['code'] = 0;
        }
        return $result;
    }

    //释放连接
    public function __destruct(){
        oci_free_statement($this->stmt);
        oci_close($this->conn);
    }

}