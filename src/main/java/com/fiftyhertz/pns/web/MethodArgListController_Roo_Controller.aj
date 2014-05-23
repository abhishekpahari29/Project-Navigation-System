// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.web;

import com.fiftyhertz.pns.domain.MethodArgList;
import com.fiftyhertz.pns.domain.MethodDetail;
import com.fiftyhertz.pns.web.MethodArgListController;
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

privileged aspect MethodArgListController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MethodArgListController.create(@Valid MethodArgList methodArgList, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, methodArgList);
            return "methodarglists/create";
        }
        uiModel.asMap().clear();
        methodArgList.persist();
        return "redirect:/methodarglists/" + encodeUrlPathSegment(methodArgList.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MethodArgListController.createForm(Model uiModel) {
        populateEditForm(uiModel, new MethodArgList());
        return "methodarglists/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MethodArgListController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("methodarglist", MethodArgList.findMethodArgList(id));
        uiModel.addAttribute("itemId", id);
        return "methodarglists/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MethodArgListController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("methodarglists", MethodArgList.findMethodArgListEntries(firstResult, sizeNo));
            float nrOfPages = (float) MethodArgList.countMethodArgLists() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("methodarglists", MethodArgList.findAllMethodArgLists());
        }
        return "methodarglists/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MethodArgListController.update(@Valid MethodArgList methodArgList, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, methodArgList);
            return "methodarglists/update";
        }
        uiModel.asMap().clear();
        methodArgList.merge();
        return "redirect:/methodarglists/" + encodeUrlPathSegment(methodArgList.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MethodArgListController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, MethodArgList.findMethodArgList(id));
        return "methodarglists/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MethodArgListController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MethodArgList methodArgList = MethodArgList.findMethodArgList(id);
        methodArgList.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/methodarglists";
    }
    
    void MethodArgListController.populateEditForm(Model uiModel, MethodArgList methodArgList) {
        uiModel.addAttribute("methodArgList", methodArgList);
        uiModel.addAttribute("methoddetails", MethodDetail.findAllMethodDetails());
    }
    
    String MethodArgListController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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