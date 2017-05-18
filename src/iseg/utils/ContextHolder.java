package iseg.utils;

import javax.servlet.ServletContext;

public class ContextHolder {
    private static volatile ServletContext bayeux;

    public static void setBayeux(ServletContext bayeux)
    {
    	ContextHolder.bayeux = bayeux;
    }

    public static ServletContext getBayeux()
    {
        return bayeux;
    }
}
