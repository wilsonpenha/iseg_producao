package iseg.app.persistence;

import java.util.AbstractList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

/**
 * This is a list backed by a JPA Query, but only loading the results of the
 * query one page at a time. It loads one page *ahead* for each fetch miss,
 * so if you are iterating through query results backwards you will get poor
 * performance.
 */
public class LazyList<E> extends AbstractList<E> {
  
    /** backing query */
    Query query;
    
    /** cache of loaded items */
    Map<Integer, E> loaded;

    /** total number of results expected */
    long numResults;
    
    /** number of results to fetch on cache miss */
    int pageSize;
    
    /** default constructor */
    public LazyList() {
        loaded = new HashMap<Integer, E>();
    }
    
    /**
     * Create a LazyList backed by the given query, using pageSize results
     * per page, and expecting numResults from the query.
     */
    public LazyList(Query query, int pageSize, long numResults) {
        this();
        this.query = query;
        this.pageSize = pageSize;
        this.numResults = numResults;
    }
    
    /**
     * Fetch an item, loading it from the query results if it hasn't already 
     * been.
     */
     @SuppressWarnings("unchecked")
	public E get(int i) {
         if (!loaded.containsKey(i)) {
             List<?>results = query.setFirstResult(i).setMaxResults(pageSize).getResultList();
             for (int j = 0; j < results.size(); j++) {
                  loaded.put(i + j, (E)results.get(j));
             }
         }
         return loaded.get(i);
     }

     /**
      * Return the total number of items in the list. This is done by
      * using an equivalent COUNT query for the backed query.
      */
     public int size() {
         return (int) numResults;
     }
     
     /** update the number of results expected in this list */
     public void setNumResults(long numResults) {
         this.numResults = numResults;
     }
}