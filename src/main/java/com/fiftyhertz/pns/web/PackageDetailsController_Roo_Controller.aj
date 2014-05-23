// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.web;

import com.fiftyhertz.pns.domain.PackageDetails;
import com.fiftyhertz.pns.domain.Project;
import com.fiftyhertz.pns.web.PackageDetailsController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PackageDetailsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PackageDetailsController.create(@Valid PackageDetails packageDetails, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, packageDetails);
            return "packagedetailses/create";
        }
        uiModel.asMap().clear();
        packageDetails.persist();
        return "redirect:/packagedetailses/" + encodeUrlPathSegment(packageDetails.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PackageDetailsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PackageDetails());
        return "packagedetailses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PackageDetailsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("packagedetails", PackageDetails.findPackageDetails(id));
        uiModel.addAttribute("itemId", id);
        return "packagedetailses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PackageDetailsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("packagedetailses", PackageDetails.findPackageDetailsEntries(firstResult, sizeNo));
            float nrOfPages = (float) PackageDetails.countPackageDetailses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("packagedetailses", PackageDetails.findAllPackageDetailses());
        }
        return "packagedetailses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PackageDetailsController.update(@Valid PackageDetails packageDetails, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, packageDetails);
            return "packagedetailses/update";
        }
        uiModel.asMap().clear();
        packageDetails.merge();
        return "redirect:/packagedetailses/" + encodeUrlPathSegment(packageDetails.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PackageDetailsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, PackageDetails.findPackageDetails(id));
        return "packagedetailses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PackageDetailsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PackageDetails packageDetails = PackageDetails.findPackageDetails(id);
        packageDetails.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/packagedetailses";
    }
    
    void PackageDetailsController.populateEditForm(Model uiModel, PackageDetails packageDetails) {
        uiModel.addAttribute("packageDetails", packageDetails);
        uiModel.addAttribute("projects", Project.findAllProjects());
    }
    
    String PackageDetailsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}