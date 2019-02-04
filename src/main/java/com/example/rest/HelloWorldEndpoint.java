package com.example.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;

@Path("/hello")
public class HelloWorldEndpoint {
  
  @POST
  @Produces("application/json")
  @Consumes("application/json")
  public Response doPost(String body) {
    return Response.ok(body).build();
  }
  
}