package org.grails.solr

import org.apache.solr.client.solrj.response.QueryResponse


class SearchResults {
  QueryResponse queryResponse 
  def resultList = []  
  
  def facet(domain, field) {
    def fieldName = domain?.solrFieldName(field)   
    facet(fieldName)
  }
  
  def facet(fieldName) {
    (fieldName) ? queryResponse.getFacetField(fieldName) : null
  }
  
  def getTotal() {
    queryResponse.results.getNumFound()
  }
}