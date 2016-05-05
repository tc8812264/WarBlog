package fileuitl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class FileUtil {
	public HashMap<String,FileItem> getFormItem(HttpServletRequest request) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		HashMap<String, FileItem> map = new HashMap<String, FileItem>();

		try {
			List<FileItem> list = upload.parseRequest( request );
			for (int i = 0; i < list.size(); i++) {
				FileItem item = list.get(i);
				String key = item.getFieldName();
				map.put(key, item);
			}
		}catch (org.apache.commons.fileupload.FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		}
		return map;
	}
	public String writeFileToServer(FileItem item, String path) {
		try{
			InputStream input = item.getInputStream();
			String oldname = item.getName();
			String uuidName = UUID.randomUUID().toString();
			uuidName = uuidName+""+oldname.substring(oldname.lastIndexOf("."));
			
			File file = new File(path+"\\"+uuidName);

				FileOutputStream fos = new FileOutputStream(file);

			byte[] b = new byte[1024*10];
			while (true) {
				int num = input.read(b);
				if (num == -1) {
					break;
				}
				fos.write(b, 0, num);
			}
			fos.close();
			return uuidName;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
