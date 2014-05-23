// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.web;

import com.fiftyhertz.pns.domain.ClassDetails;
import com.fiftyhertz.pns.domain.MethodDetail;
import com.fiftyhertz.pns.web.MethodDetailController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect MethodDetailController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByClassId", "form" }, method = RequestMethod.GET)
    public String MethodDetailController.findMethodDetailsByClassIdForm(Model uiModel) {
        uiModel.addAttribute("classdetailses", ClassDetails.findAllClassDetailses());
        return "methoddetails/findMethodDetailsByClassId";
    }
    
    @RequestMapping(params = "find=ByClassId", method = RequestMethod.GET)
    public String MethodDetailController.findMethodDetailsByClassId(@RequestParam("classId") ClassDetails classId, Model uiModel) {
        uiModel.addAttribute("methoddetails", MethodDetail.findMethodDetailsByClassId(classId).getResultList());
        return "methoddetails/list";
    }
    
    @RequestMapping(params = { "find=ById", "form" }, method = RequestMethod.GET)
    public String MethodDetailController.findMethodDetailsByIdForm(Model uiModel) {
        return "methoddetails/findMethodDetailsById";
    }
    
    @RequestMapping(params = "find=ById", method = RequestMethod.GET)
    public String MethodDetailController.findMethodDetailsById(@RequestParam("id") Long id, Model uiModel) {
        uiModel.addAttribute("methoddetails", MethodDetail.findMethodDetailsById(id).getResultList());
        return "methoddetails/list";
    }
    
}