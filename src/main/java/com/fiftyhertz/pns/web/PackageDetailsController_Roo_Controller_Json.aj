// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.web;

import com.fiftyhertz.pns.domain.PackageDetails;
import com.fiftyhertz.pns.domain.Project;
import com.fiftyhertz.pns.web.PackageDetailsController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect PackageDetailsController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PackageDetailsController.showJson(@PathVariable("id") Long id) {
        PackageDetails packageDetails = PackageDetails.findPackageDetails(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (packageDetails == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(packageDetails.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PackageDetailsController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<PackageDetails> result = PackageDetails.findAllPackageDetailses();
        return new ResponseEntity<String>(PackageDetails.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PackageDetailsController.createFromJson(@RequestBody String json) {
        PackageDetails packageDetails = PackageDetails.fromJsonToPackageDetails(json);
        packageDetails.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PackageDetailsController.createFromJsonArray(@RequestBody String json) {
        for (PackageDetails packageDetails: PackageDetails.fromJsonArrayToPackageDetailses(json)) {
            packageDetails.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PackageDetailsController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        PackageDetails packageDetails = PackageDetails.fromJsonToPackageDetails(json);
        if (packageDetails.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> PackageDetailsController.deleteFromJson(@PathVariable("id") Long id) {
        PackageDetails packageDetails = PackageDetails.findPackageDetails(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (packageDetails == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        packageDetails.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByProjectId", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PackageDetailsController.jsonFindPackageDetailsesByProjectId(@RequestParam("projectId") Project projectId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(PackageDetails.toJsonArray(PackageDetails.findPackageDetailsesByProjectId(projectId).getResultList()), headers, HttpStatus.OK);
    }
    
}
