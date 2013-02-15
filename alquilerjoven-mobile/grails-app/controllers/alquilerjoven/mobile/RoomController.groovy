package alquilerjoven.mobile

import org.apache.solr.client.solrj.SolrQuery
import org.apache.solr.client.solrj.impl.CommonsHttpSolrServer
import org.apache.solr.client.solrj.response.QueryResponse
import org.apache.solr.common.params.SolrParams
import org.apache.solr.common.util.NamedList
import org.grails.solr.SearchResults

class RoomController {

    def index() { }
	def search = {
		
		CommonsHttpSolrServer server = new CommonsHttpSolrServer(grailsApplication.config.solr.serverURL);
		
		
		//server.setSoTimeout(1000);  // socket read timeout
		server.setSoTimeout(40000);  // socket read timeout
		//server.setConnectionTimeout(100);
		//server.setConnectionTimeout(20000);
		server.setDefaultMaxConnectionsPerHost(700);
		server.setMaxTotalConnections(700);
		
		server.setFollowRedirects(false);  // defaults to false
		// allowCompression defaults to false.
		// Server side must support gzip or deflate for this to have any effect.
		server.setAllowCompression(true);
		server.setMaxRetries(1); // defaults to 0.  > 1 not recommended.
		
		
		
		List fq = []
		def query = new SolrQuery("${params.q}")
		
		def rowsToReturn=params?.rows;
		if(!rowsToReturn){
			rowsToReturn='20';
		}
		
		
		String sort=params?.sort;
		if(sort){
		if(sort.equalsIgnoreCase("publish_date"))
			sort="publishDate";
		else if(sort.equalsIgnoreCase("preu") || sort.equalsIgnoreCase("preu_maxim") )
			sort="price";
		else if(sort.equalsIgnoreCase("zona"))
			sort="neighborhood_field";
		else if(sort.equalsIgnoreCase("publish_date"))
			sort="publishDate";
		else if(sort.equalsIgnoreCase("metres2"))
			sort="meters";
		else if(sort.equalsIgnoreCase("num_dorms"))
			sort="dorms";
		else if(sort.equalsIgnoreCase("neighborhood"))
			sort="neighborhood_field";
		}else{
		sort="publishDate"
		}
		String order=params?.order;
		if(order){
		if ((!order.equalsIgnoreCase("ASC")) &&
			(!order.equalsIgnoreCase("DESC"))) {
			throw new IllegalArgumentException(
					"Cannot sort, reason: dont understand the order '" + order +
					"'.");
		}
		}else{
		order="DESC"
		
		}
		
		String  municipality_i=params?.municipality_i;
		def page=params?.page;
		int offset;
		if(page){
			offset=(page-1)*rowsToReturn;
		}else{
		 offset=0;
		}
		
		
		
		if(params?.queryType){
			
			query.setQueryType("dismax");
			query.setQuery(params.q.replace('-', ' '));
			
		} else{
			if(params?.queryType.equals("dismax")){
				
				query.setQueryType("dismax");
				query.setQuery(params.q.replaceAll('-', ' '));
				
			}else if (params?.queryType.equals("standard")){
				query.setQueryType("standard");
				query.setQuery(params.q.replaceAll('-', ' '));
				
				
			}else if (params.queryType.equals("geo")){
				query.setQueryType("geo");
				query.setQuery(params.q.replaceAll('-', ' '));
				
				
			}
		}
		
		NamedList<String> params1=new NamedList<String>();
  
		
		params1.add("start", offset);
		params1.add("rows", rowsToReturn);
		params1.add("hl", "true");
		params1.add("hl.fl", "description,neighborhood,title,municipality");
		params1.add("version", "2.2");
		
		params1.add("facet.field", "municipality_i");
		params1.add("facet.field", "type");
		params1.add("facet.field", "internet");
		params1.add("facet.field", "terrace");
		params1.add("facet.field", "heating");
		params1.add("facet.field", "air_conditioning");
		params1.add("facet.field", "smoker");
		params1.add("facet.field", "pets");
		params1.add("facet.field", "rental");
		
		params1.add("facet.field", "{!ex=foo}neighborhood_field");
		
		params1.add("facet.mincount", "1");
		params1.add("f.neighborhood_field.facet.sort", "index");
	  
	   
	  
	   
	
		
		
		
	   query.add(SolrParams.toSolrParams(params1));
	   query.setFacet(true);
	   query.setShowDebugInfo(true);
	 
		  
		   
		
		
		QueryResponse resp=server.query( query);
		SearchResults result=new  SearchResults()
		result.queryResponse=resp;
		result.resultList=resp.results;
  
		[result:result, q:params.q, fq: fq, solrQueryUrl: query.toString()]
		
		
	  }
	def show(Long id) {
		def countryInstance = Country.get(id)
		if (!countryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
			redirect(action: "list")
			return
		}

		[countryInstance: countryInstance]
	}
}
