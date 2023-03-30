using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace DevManager.lib
{
    public class WinService
    {

        //监测服务是否启动
        public static bool ServicesExists(string serviceName)
        {
            bool isbn = false;
            //获取所有服务
            ServiceController[] services = ServiceController.GetServices();
            try
            {
                foreach (ServiceController service in services)
                {
                    if (service.ServiceName.ToUpper() == serviceName.ToUpper())
                    {
                        isbn = true;
                        break;
                    }
                }
                return isbn;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        //启动服务
        public  static bool ServiceStar(string serviceName)
        {
            bool isbn = false;

            try
            {
                if (ServicesExists(serviceName))
                {
                    ServiceController star_service = new ServiceController(serviceName);
                    if (star_service.Status != ServiceControllerStatus.Running &&
                    star_service.Status != ServiceControllerStatus.StartPending)
                    {
                        star_service.Start();

                        for (int i = 0; i < 60; i++)
                        {
                            star_service.Refresh();
                            System.Threading.Thread.Sleep(1000);
                            if (star_service.Status == ServiceControllerStatus.Running)
                            {
                                isbn = true;
                                break;
                            }
                            if (i == 59)
                            {
                                isbn = false;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return isbn;
        }

        //停止服务
        public static bool ServiceStop(string serviceName)
        {
            bool isbn = false;

            try
            {
                if (ServicesExists(serviceName))
                {
                    ServiceController star_service = new ServiceController(serviceName);
                    if (star_service.Status == ServiceControllerStatus.Running)
                    {
                        star_service.Stop();

                        for (int i = 0; i < 60; i++)
                        {
                            star_service.Refresh();
                            System.Threading.Thread.Sleep(1000);
                            if (star_service.Status == ServiceControllerStatus.Stopped)
                            {
                                isbn = true;
                                break;
                            }
                            if (i == 59)
                            {
                                isbn = false;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return isbn;
        }
    }
}
