// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.web;

import com.fiftyhertz.pns.domain.ClassDetails;
import com.fiftyhertz.pns.domain.PackageDetails;
import com.fiftyhertz.pns.web.ClassDetailsController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ClassDetailsController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByPackageId", "form" }, method = RequestMethod.GET)
    public String ClassDetailsController.findClassDetailsesByPackageIdForm(Model uiModel) {
        uiModel.addAttribute("packagedetailses", PackageDetails.findAllPackageDetailses());
        return "classdetailses/findClassDetailsesByPackageId";
    }
    
    @RequestMapping(params = "find=ByPackageId", method = RequestMethod.GET)
    public String ClassDetailsController.findClassDetailsesByPackageId(@RequestParam("packageId") PackageDetails packageId, Model uiModel) {
        uiModel.addAttribute("classdetailses", ClassDetails.findClassDetailsesByPackageId(packageId).getResultList());
        return "classdetailses/list";
    }
    
}
