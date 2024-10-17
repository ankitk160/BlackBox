package com.blackbox.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blackbox.model.CustomAuthenticationToken;
import com.blackbox.service.ApiService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PageServingController {

	@Autowired
	private ApiService apiService;

	ObjectMapper objectMapper = new ObjectMapper();

	public String getUserName() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomAuthenticationToken token = (CustomAuthenticationToken) authentication.getPrincipal();
		return token.getUsername();
	}

	@RequestMapping(value = "/")
	public ModelAndView test() {
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/error500")
	public ModelAndView error500() {
		return new ModelAndView("error500");
	}

	@RequestMapping(value = "/error404")
	public ModelAndView error404() {
		return new ModelAndView("error404");
	}

	@GetMapping("/access-denied")
	public String accessDenied() {
		return "access-denied";
	}

	@RequestMapping(value = "/index-user")
	public ModelAndView indexUser() {
		ModelAndView indexUser = new ModelAndView("index-user");
		indexUser.addObject("username", getUserName());
		return indexUser;
	}

	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView index = new ModelAndView("index");
		String indexData = apiService.getIndexPageData();
		Map<String, Object> indexDataMap = null;
		try {
			indexDataMap = objectMapper.readValue(indexData, new TypeReference<Map<String, Object>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		index.addObject("username", getUserName());
		index.addObject("indexData", indexDataMap);
		return index;
	}

	@RequestMapping(value = "/index-user2")
	public ModelAndView indexUser2() {
		ModelAndView index = new ModelAndView("index-user2");
		String indexData = apiService.getIndexPageData();
		Map<String, Object> indexDataMap = null;
		try {
			indexDataMap = objectMapper.readValue(indexData, new TypeReference<Map<String, Object>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		index.addObject("username", getUserName());
		index.addObject("indexData", indexDataMap);
		return index;
	}

	@RequestMapping(value = "/hardMsisdn")
	public ModelAndView hardMsisdn() throws JsonMappingException, JsonProcessingException {
		ModelAndView hardMsisdn = new ModelAndView("hardMsisdn");
		String allHardMsisdnString = apiService.getHardMsisdn();
		List<Map<String, String>> msisdnList;
		try {
			msisdnList = objectMapper.readValue(allHardMsisdnString, new TypeReference<List<Map<String, String>>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
			msisdnList = Collections.emptyList();
		}
		Map<String, Map<String, String>> groupedData = msisdnList.stream()
				.collect(Collectors.toMap(msisdn -> msisdn.get("operatorid"), msisdn -> {
					Map<String, String> map = new HashMap<>(msisdn);
					map.put("msisdn", msisdn.get("msisdn"));
					return map;
				}, (existing, replacement) -> {
					existing.put("msisdn", existing.get("msisdn") + ", " + replacement.get("msisdn"));
					return existing;
				}));
		List<Map<String, String>> groupedList = new ArrayList<>(groupedData.values());
		hardMsisdn.addObject("groupedMsisdnData", groupedList);
		hardMsisdn.addObject("username", getUserName());
		return hardMsisdn;
	}

	@RequestMapping(value = "/blackboxReport")
	public ModelAndView blackboxReport(HttpServletRequest request)
			throws JsonMappingException, JsonProcessingException {
		ModelAndView blackboxReport = new ModelAndView("blackboxReport");
		String dateRange = request.getParameter("dateRangeInput");
		String from;
		String to;

		if (dateRange == null || dateRange.isEmpty()) {
			LocalDate currentDate = LocalDate.now();
			from = currentDate.format(DateTimeFormatter.ISO_DATE);
			to = currentDate.format(DateTimeFormatter.ISO_DATE);
		} else {
			String[] dates = dateRange.split(" to ");
			from = dates[0];
			to = dates[1];
		}

		String reportData = apiService.getAffProReportData(from, to);

		List<Map<String, Object>> allReportDataList = objectMapper.readValue(reportData,
				new TypeReference<List<Map<String, Object>>>() {
				});

		for (Map<String, Object> reportDataItem : allReportDataList) {
			Integer campaignId = Integer.parseInt((String) reportDataItem.get("campaignId"));
			if (campaignId != null) {
				String campaignDataJson = apiService.getCampaignDataById(campaignId);
				Map<String, Object> campaignData = objectMapper.readValue(campaignDataJson,
						new TypeReference<Map<String, Object>>() {
						});

				String territoryOperatorName = (String) campaignData.get("territory_operator_name");
				if (territoryOperatorName != null && !territoryOperatorName.isEmpty()) {
					String[] territoryOperatorParts = territoryOperatorName.split(" ");
					if (territoryOperatorParts.length >= 2) {
						reportDataItem.put("territoryName", territoryOperatorParts[0]);
						reportDataItem.put("operatorName", territoryOperatorParts[1]);
					}
				}
			}
		}

		blackboxReport.addObject("allReportDataList", allReportDataList);
		blackboxReport.addObject("username", getUserName());
		return blackboxReport;
	}

	@RequestMapping(value = "/viewCampaign")
	public ModelAndView viewCampaign() throws JsonMappingException, JsonProcessingException {
		ModelAndView viewCampaign = new ModelAndView("viewCampaign");

		String allCampaignDataString = apiService.getAllCampaignData();

		List<Map<String, Object>> allCampaignDataList = objectMapper.readValue(allCampaignDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		for (Map<String, Object> campaign : allCampaignDataList) {
			String territoryOperatorName = (String) campaign.get("territory_operator_name");
			if (territoryOperatorName != null && !territoryOperatorName.isEmpty()) {
				String[] words = territoryOperatorName.split(" ");
				if (words.length >= 2) {
					campaign.put("territoryName", words[0]);
					campaign.put("operatorName", words[1]);
				}
			}
		}
		viewCampaign.addObject("allCampaignDataList", allCampaignDataList);
		viewCampaign.addObject("username", getUserName());
		return viewCampaign;
	}

	@RequestMapping(value = "/addCampaign")
	public ModelAndView addCampaign() throws JsonMappingException, JsonProcessingException {
		ModelAndView addCampaign = new ModelAndView("addCampaign");

		String allPartnerDataString = apiService.getAllPartnerData();
		List<Map<String, Object>> allPartnerDataList = objectMapper.readValue(allPartnerDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		String allTerritoryDataString = apiService.getAllTerritoryData();
		List<Map<String, Object>> allTerritoryDataList = objectMapper.readValue(allTerritoryDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		addCampaign.addObject("allPartnerDataList", allPartnerDataList);
		addCampaign.addObject("allTerritoryDataList", allTerritoryDataList);
		addCampaign.addObject("username", getUserName());

		return addCampaign;
	}

	@PostMapping("/saveCampaignData")
	public String saveCampaignData(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String territoryName = request.getParameter("territoryName");
		String operatorName = request.getParameter("operatorName");

		Map<String, String> campaignData = new HashMap<>();
		campaignData.put("servicename", request.getParameter("servicename"));
		campaignData.put("pinLength", request.getParameter("pinLength"));
		campaignData.put("price", request.getParameter("price"));
		campaignData.put("chargingmode", request.getParameter("chargingmode"));
		campaignData.put("partnerName", request.getParameter("partnerName"));
		campaignData.put("lpPageLang", request.getParameter("lpPageLang"));
		campaignData.put("operatorid", request.getParameter("operator"));
		campaignData.put("mailid", request.getParameter("mailid"));
		campaignData.put("unsubKeyword", request.getParameter("unsubKeyword"));
		campaignData.put("unsubSC", request.getParameter("unsubSC"));
		campaignData.put("dailyCap", request.getParameter("dailyCap"));
		campaignData.put("campBid", request.getParameter("campBid"));
		campaignData.put("portalUrl", request.getParameter("portalUrl"));
		campaignData.put("pinGenUrl", request.getParameter("pinGenUrl"));
		campaignData.put("pinValidUrl", request.getParameter("pinValidUrl"));
		campaignData.put("territory_operator_name", territoryName + " " + operatorName);
		campaignData.put("apiDevelopedBy", request.getParameter("apiDevelopedBy"));

		if ("on".equals(request.getParameter("antiFaurdFlag"))) {
			campaignData.put("antiFaurdFlag", "Y");
			campaignData.put("antiFaurdUrl", request.getParameter("antiFaurdUrl"));
		} else {
			campaignData.put("antiFaurdFlag", "N");
			campaignData.put("antiFaurdUrl", "");
		}

		campaignData.put("createdBy", getUserName());
		campaignData.put("bannerUrl", request.getParameter("bannerUrl"));
		campaignData.put("displayServiceName", request.getParameter("displayServiceName"));

		if ("on".equals(request.getParameter("displayPartnerName"))) {
			campaignData.put("displayPartnerName", "Y");
		} else {
			campaignData.put("displayPartnerName", "N");
		}

		String campaignDataJson;
		try {
			campaignDataJson = objectMapper.writeValueAsString(campaignData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "Error converting campaign data to JSON.");
			return "redirect:/viewCampaign";
		}

		String response = apiService.saveCampaignData(campaignDataJson);

		if ("true".equalsIgnoreCase(response)) {
			redirectAttributes.addFlashAttribute("successMessage", "Campaign created successfully");
			return "redirect:/viewCampaign";
		}

		redirectAttributes.addFlashAttribute("errorMessage", "Failed to save campaign data.");
		return "redirect:/viewCampaign";
	}

	@RequestMapping(value = "/editCampaign")
	public ModelAndView editCampaign(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {
		ModelAndView editCampaign = new ModelAndView("editCampaign");

		int campaignId = Integer.parseInt(request.getParameter("campaignId"));

		String campaignString = apiService.getCampaignDataById(campaignId);

		Map<String, Object> campaignData = objectMapper.readValue(campaignString,
				new TypeReference<Map<String, Object>>() {
				});

		String territoryOperatorName = (String) campaignData.get("territory_operator_name");
		if (territoryOperatorName != null) {
			String[] words = territoryOperatorName.split(" ");
			campaignData.put("territoryName", words[0]);
			campaignData.put("operatorName", words[1]);
		}

		editCampaign.addObject("campaign", campaignData);
		editCampaign.addObject("username", getUserName());

		return editCampaign;
	}

	@RequestMapping("/updateCampaignData")
	public String updateCampaignData(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Map<String, String> campaignData = new HashMap<>();

		campaignData.put("id", request.getParameter("id"));
		campaignData.put("pinLength", request.getParameter("pinLength"));
		campaignData.put("lpPageLang", request.getParameter("lpPageLang"));
		campaignData.put("mailid", request.getParameter("mailid"));
		campaignData.put("unsubSC", request.getParameter("unsubSC"));
		campaignData.put("dailyCap", request.getParameter("dailyCap"));
		campaignData.put("campBid", request.getParameter("campBid"));
		campaignData.put("portalUrl", request.getParameter("portalUrl"));
		campaignData.put("pinGenUrl", request.getParameter("pinGenUrl"));
		campaignData.put("pinValidUrl", request.getParameter("pinValidUrl"));

		if ("on".equals(request.getParameter("antiFaurdFlag"))) {
			campaignData.put("antiFaurdFlag", "Y");
			campaignData.put("antiFaurdUrl", request.getParameter("antiFaurdUrl"));
		} else {
			campaignData.put("antiFaurdFlag", "N");
			campaignData.put("antiFaurdUrl", "");
		}

		campaignData.put("editedBy", getUserName());

		campaignData.put("bannerUrl", request.getParameter("bannerUrl"));
		campaignData.put("displayServiceName", request.getParameter("displayServiceName"));

		if ("on".equals(request.getParameter("displayPartnerName"))) {
			campaignData.put("displayPartnerName", "Y");
		} else {
			campaignData.put("displayPartnerName", "N");
		}

		String jsonCampaignData = "";
		try {
			jsonCampaignData = objectMapper.writeValueAsString(campaignData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "Error converting campaign data to JSON.");
			return "redirect:/viewCampaign";
		}

		Boolean response = apiService.updateCampaignData(jsonCampaignData);

		if (Boolean.TRUE.equals(response)) {
			redirectAttributes.addFlashAttribute("successMessage", "Campaign updated successfully");
			return "redirect:/viewCampaign";
		}

		redirectAttributes.addFlashAttribute("errorMessage", "Failed to update campaign data.");
		return "redirect:/viewCampaign";
	}

	@RequestMapping(value = "/viewOffer")
	public ModelAndView viewOffer() throws JsonMappingException, JsonProcessingException {
		ModelAndView viewOffer = new ModelAndView("viewOffer");

		String allOfferDataString = apiService.getAllOfferData();
		String allAgencyDataString = apiService.getAllAgencyData();
		String allCampaignDataString = apiService.getAllCampaignData();

		List<Map<String, Object>> allOfferDataList = objectMapper.readValue(allOfferDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});
		List<Map<String, Object>> allAgencyDataList = objectMapper.readValue(allAgencyDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});
		List<Map<String, Object>> allCampaignDataList = objectMapper.readValue(allCampaignDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		Map<String, String> agencyMap = new HashMap<>();
		Map<String, String> campaignMap = new HashMap<>();

		for (Map<String, Object> agency : allAgencyDataList) {
			agencyMap.put(String.valueOf(agency.get("id")), (String) agency.get("agencyName"));
		}

		for (Map<String, Object> campaign : allCampaignDataList) {
			campaignMap.put(String.valueOf(campaign.get("id")), (String) campaign.get("description"));
		}

		for (Map<String, Object> offer : allOfferDataList) {
			String agencyId = (String) offer.get("agencyData");
			offer.put("agencyData", agencyMap.getOrDefault(agencyId, "Unknown"));

			String campaignId = (String) offer.get("defaultCampaignId");
			offer.put("defaultCampaignId", campaignMap.getOrDefault(campaignId, "Unknown"));
		}

		viewOffer.addObject("allOfferDataList", allOfferDataList);
		viewOffer.addObject("username", getUserName());

		return viewOffer;
	}

	@RequestMapping(value = "/addOffer")
	public ModelAndView addOffer() throws JsonMappingException, JsonProcessingException {
		ModelAndView addOffer = new ModelAndView("addOffer");

		String allTerritoryDataString = apiService.getAllTerritoryData();
		String allAgencyDataString = apiService.getAllAgencyData();

		List<Map<String, Object>> allTerritoryDataList = objectMapper.readValue(allTerritoryDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});
		List<Map<String, Object>> allAgencyDataList = objectMapper.readValue(allAgencyDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		addOffer.addObject("allTerritoryDataList", allTerritoryDataList);
		addOffer.addObject("allAgencyDataList", allAgencyDataList);
		addOffer.addObject("username", getUserName());
		return addOffer;
	}

	@PostMapping("/saveOfferData")
	public String saveOfferData(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Map<String, String> offerData = new HashMap<>();

		offerData.put("offerName", request.getParameter("offerName"));
		offerData.put("defaultCampaignId", request.getParameter("defaultCampaignId"));
		offerData.put("dailyCap", request.getParameter("dailyCap"));
		offerData.put("operatorid", request.getParameter("operatorid"));
		offerData.put("territoryName", request.getParameter("territoryName"));
		offerData.put("operatorName", request.getParameter("operatorName"));
		offerData.put("agencyid", request.getParameter("agencyid"));
		offerData.put("pubBid", request.getParameter("pubBid"));
		offerData.put("optimizePerc", request.getParameter("optimizePerc"));
		offerData.put("FailSaveCmpId", request.getParameter("FailSaveCmpId"));

		if ("on".equalsIgnoreCase(request.getParameter("antifaurdEnable"))) {
			offerData.put("antifaurdEnable", "Y");
		} else {
			offerData.put("antifaurdEnable", "N");
		}

		String jsonOfferData = "";
		try {
			jsonOfferData = objectMapper.writeValueAsString(offerData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "Error converting offer data to JSON.");
			return "redirect:/viewOffer";
		}

		String response = apiService.saveOfferData(jsonOfferData);

		if ("true".equalsIgnoreCase(response)) {
			redirectAttributes.addFlashAttribute("successMessage", "Offer created successfully");
			return "redirect:/viewOffer";
		}
		redirectAttributes.addFlashAttribute("errorMessage", "Failed to save offer data.");
		return "redirect:/viewOffer";
	}

	@RequestMapping(value = "/editOffer")
	public ModelAndView editOffer(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {
		ModelAndView editOffer = new ModelAndView("editOffer");
		int offerId = Integer.parseInt(request.getParameter("offerId"));
		String offerString = apiService.getOfferById(offerId);

		Map<String, String> offerData = objectMapper.readValue(offerString, new TypeReference<Map<String, String>>() {
		});

		String allAgencyDataString = apiService.getAllAgencyData();
		List<Map<String, String>> allAgencyDataList = objectMapper.readValue(allAgencyDataString,
				new TypeReference<List<Map<String, String>>>() {
				});

		for (Map<String, String> agency : allAgencyDataList) {
			if (agency.get("id").equals(offerData.get("agencyData"))) {
				editOffer.addObject("agencyName", agency.get("agencyName"));
				break;
			}
		}

		editOffer.addObject("offer", offerData);
		editOffer.addObject("username", getUserName());

		return editOffer;
	}

	@PostMapping("/updateOfferData")
	public String updateOfferData(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String id = request.getParameter("id");
		String defaultCampaignId = request.getParameter("defaultCampaignId");
		String pubBid = request.getParameter("pubBid");
		String optimizePerc = request.getParameter("optimizePerc");
		String switchingCampFlag = request.getParameter("switchingCampFlag");
		String antifaurdEnable = request.getParameter("antifaurdEnable");

		Map<String, String> offerData = new HashMap<>();
		offerData.put("id", id);
		offerData.put("defaultCampaignId", defaultCampaignId);
		offerData.put("pubBid", pubBid);
		offerData.put("optimizePerc", optimizePerc);
		offerData.put("switchingCampFlag", switchingCampFlag);

		if ("on".equalsIgnoreCase(antifaurdEnable)) {
			offerData.put("antifaurdEnable", "Y");
		} else {
			offerData.put("antifaurdEnable", "N");
		}

		String jsonOfferData = "";
		try {
			jsonOfferData = objectMapper.writeValueAsString(offerData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "Error converting offer data to JSON.");
			return "redirect:/viewOffer";
		}

		Boolean response = apiService.updateOfferData(jsonOfferData);
		if (Boolean.TRUE.equals(response)) {
			redirectAttributes.addFlashAttribute("successMessage", "Offer updated successfully.");
			return "redirect:/viewOffer";
		}

		redirectAttributes.addFlashAttribute("errorMessage", "Failed to update offer data.");
		return "redirect:/viewOffer";
	}

	@RequestMapping(value = "/addSwitching")
	public ModelAndView addSwitching(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {
		ModelAndView addSwitching = new ModelAndView("addSwitching");

		int offerId = Integer.parseInt(request.getParameter("offerId"));

		String offerString = apiService.getOfferById(offerId);
		Map<String, Object> offer = objectMapper.readValue(offerString, new TypeReference<Map<String, Object>>() {
		});
		List<Map<String, Object>> filteredCampaigns = new ArrayList<>();

		String campaignString = apiService.getAllCampaignData();
		List<Map<String, Object>> campaignList = objectMapper.readValue(campaignString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		for (Map<String, Object> campaign : campaignList) {
			if (campaign.get("operatorid").toString().equals(offer.get("operatorid").toString())
					&& !campaign.get("id").toString().equals(offer.get("defaultCampaignId").toString())) {
				filteredCampaigns.add(campaign);
			}
		}

		addSwitching.addObject("offer", offer);
		addSwitching.addObject("filteredCampaigns", filteredCampaigns);
		addSwitching.addObject("username", getUserName());
		return addSwitching;
	}

	@PostMapping("/saveSwitchingData")
	public String saveSwitchingData(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Map<String, String> switchingData = new HashMap<>();
		switchingData.put("offerId", request.getParameter("offerId"));
		switchingData.put("campid1", request.getParameter("campaign1"));
		switchingData.put("campid2", request.getParameter("campaign2"));
		switchingData.put("campid3", request.getParameter("campaign3"));
		switchingData.put("campid4", request.getParameter("campaign4"));
		switchingData.put("operatorid", request.getParameter("operatorid"));

		String jsonSwitchingData = "";
		try {
			jsonSwitchingData = objectMapper.writeValueAsString(switchingData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "Error converting switching data to JSON.");
			return "redirect:/viewOffer";
		}

		String response = apiService.saveSwitchingData(jsonSwitchingData);

		if ("true".equalsIgnoreCase(response)) {
			redirectAttributes.addFlashAttribute("successMessage", "Switching created successfully");
			return "redirect:/viewOffer";
		}

		redirectAttributes.addFlashAttribute("errorMessage", "Failed to save switching data.");
		return "redirect:/viewOffer";
	}

	@RequestMapping(value = "/editSwitching")
	public ModelAndView editSwitching(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {
		ModelAndView editSwitching = new ModelAndView("editSwitching");
		int offerId = Integer.parseInt(request.getParameter("offerId1"));

		String allSwitchingDataString = apiService.getAllSwitchingData();
		String offerString = apiService.getOfferById(offerId);
		String campaignString = apiService.getAllCampaignData();

		List<Map<String, String>> allSwitchingDataList = objectMapper.readValue(allSwitchingDataString,
				new TypeReference<List<Map<String, String>>>() {
				});
		Map<String, String> offer = objectMapper.readValue(offerString, new TypeReference<Map<String, String>>() {
		});
		List<Map<String, String>> filteredCampaigns = new ArrayList<>();
		List<Map<String, String>> campaignList = objectMapper.readValue(campaignString,
				new TypeReference<List<Map<String, String>>>() {
				});

		for (Map<String, String> campaign : campaignList) {
			if (campaign.get("operatorid").equals(offer.get("operatorid"))
					&& !campaign.get("id").equals(offer.get("defaultCampaignId"))) {
				filteredCampaigns.add(campaign);
			}
		}

		Map<String, String> switchingData = new HashMap<>();
		for (Map<String, String> switching : allSwitchingDataList) {
			if (switching.get("offerId") != null && switching.get("offerId").equals(request.getParameter("offerId1"))) {
				switchingData = switching;
				break;
			}
		}

		editSwitching.addObject("switching", switchingData);
		editSwitching.addObject("offer", offer);
		editSwitching.addObject("filteredCampaigns", filteredCampaigns);
		editSwitching.addObject("username", getUserName());
		return editSwitching;
	}

	@PostMapping("/updateSwitchData")
	public String updateSwitchData(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Map<String, String> switchData = new HashMap<>();
		switchData.put("id", request.getParameter("id"));
		switchData.put("campid1", request.getParameter("campid1"));
		switchData.put("campid2", request.getParameter("campid2"));
		switchData.put("campid3", request.getParameter("campid3"));
		switchData.put("campid4", request.getParameter("campid4"));

		String jsonSwitchData = "";
		try {
			jsonSwitchData = objectMapper.writeValueAsString(switchData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "Error converting switching data to JSON.");
			return "redirect:/viewOffer";
		}

		Boolean response = apiService.updateSwitchingData(jsonSwitchData);
		if (Boolean.TRUE.equals(response)) {
			redirectAttributes.addFlashAttribute("successMessage", "Switching updated successfully");
			return "redirect:/viewOffer";
		}

		redirectAttributes.addFlashAttribute("errorMessage", "Failed to update switching data.");
		return "redirect:/viewOffer";
	}

	@RequestMapping(value = "/viewAgency")
	public ModelAndView viewAgency() throws JsonMappingException, JsonProcessingException {
		ModelAndView viewAgency = new ModelAndView("viewAgency");
		String allAgencyDataString = apiService.getAllAgencyData();

		List<Map<String, Object>> allAgencyDataList = objectMapper.readValue(allAgencyDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		viewAgency.addObject("allAgencyDataList", allAgencyDataList);
		viewAgency.addObject("username", getUserName());
		return viewAgency;
	}

	@RequestMapping(value = "/viewLink")
	public ModelAndView viewLink() throws JsonMappingException, JsonProcessingException {
		ModelAndView viewLink = new ModelAndView("viewLink");
		String allLinkDataString = apiService.getAllLinkData();
		String allTerritoryDataString = apiService.getAllTerritoryData();

		List<Map<String, Object>> allLinkDataList = objectMapper.readValue(allLinkDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});
		List<Map<String, Object>> allTerritoryDataList = objectMapper.readValue(allTerritoryDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		Map<Integer, String> territoryMap = new HashMap<>();
		for (Map<String, Object> territory : allTerritoryDataList) {
			territoryMap.put((Integer) territory.get("id"), (String) territory.get("territoryName"));
		}

		String allAgencyDataString = apiService.getAllAgencyData();
		List<Map<String, Object>> allAgencyDataList = objectMapper.readValue(allAgencyDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		Map<String, String> agencyMap = new HashMap<>();
		for (Map<String, Object> agency : allAgencyDataList) {
			agencyMap.put((String) agency.get("id"), (String) agency.get("agencyName"));
		}

		for (Map<String, Object> link : allLinkDataList) {
			link.put("territoryName", territoryMap.getOrDefault(link.get("territoryid"), "Unknown"));
			link.put("agencyName", agencyMap.getOrDefault(link.get("agency"), "Unknown"));

			String allOperatorDataString = apiService.getOprByTerrId((Integer) link.get("territoryid"));
			if (allOperatorDataString != null) {
				List<Map<String, Object>> operatorList = objectMapper.readValue(allOperatorDataString,
						new TypeReference<List<Map<String, Object>>>() {
						});

				// Set operator names if available
				for (int i = 1; i <= 4; i++) {
					String offerOprKey = "offerOpr" + i;
					String operatorNameKey = "operatorName" + i;
					String offerOprValue = (String) link.get(offerOprKey);

					if (offerOprValue != null && !offerOprValue.trim().isEmpty() && i <= operatorList.size()) {
						link.put(operatorNameKey, operatorList.get(i - 1).get("operatorName"));
					}
				}
			}
		}

		viewLink.addObject("allLinkDataList", allLinkDataList);
		viewLink.addObject("username", getUserName());
		return viewLink;
	}

	@RequestMapping(value = "/addLink")
	public ModelAndView addLink() throws JsonMappingException, JsonProcessingException {
		ModelAndView addLink = new ModelAndView("addLink");
		String allTerritoryDataString = apiService.getAllTerritoryData();
		String allAgencyDataString = apiService.getAllAgencyData();

		List<Map<String, Object>> allTerritoryDataList = objectMapper.readValue(allTerritoryDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});
		List<Map<String, Object>> allAgencyDataList = objectMapper.readValue(allAgencyDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		addLink.addObject("allTerritoryDataList", allTerritoryDataList);
		addLink.addObject("allAgencyDataList", allAgencyDataList);
		addLink.addObject("username", getUserName());
		return addLink;
	}

	@PostMapping("/saveSmartLink")
	public String saveSmartLink(HttpServletRequest request, RedirectAttributes redirectAttributes)
			throws JsonMappingException, JsonProcessingException {

		Map<String, String> linkData = new HashMap<>();
		linkData.put("name", request.getParameter("name"));
		linkData.put("territoryid", request.getParameter("territory"));
		linkData.put("offerOpr1", request.getParameter("offerOpr1"));
		linkData.put("offerOpr2", request.getParameter("offerOpr2"));
		linkData.put("offerOpr3", request.getParameter("offerOpr3"));
		linkData.put("offerOpr4", request.getParameter("offerOpr4"));
		linkData.put("opr1", request.getParameter("opr1"));
		linkData.put("opr2", request.getParameter("opr2"));
		linkData.put("opr3", request.getParameter("opr3"));
		linkData.put("opr4", request.getParameter("opr4"));
		linkData.put("lang", request.getParameter("lang"));
		linkData.put("design", "light");
		linkData.put("agency", request.getParameter("agency"));
		String jsonLinkData = objectMapper.writeValueAsString(linkData);
		String response = apiService.saveSmartLink(jsonLinkData);
		try {
			JsonNode responseJson = objectMapper.readTree(response);
			boolean result = responseJson.get("result").asBoolean();
			int id = responseJson.get("id").asInt();

			if (result) {
				String link = "generate landing page url here ?lpId=" + id;
				//String link = "link here";
				redirectAttributes.addFlashAttribute("successMessage",
						"Smart Link created successfully. Your link is here: ");
				redirectAttributes.addFlashAttribute("link", link);
				redirectAttributes.addFlashAttribute("result", "success");
			} else {
				redirectAttributes.addFlashAttribute("errorMessage", "Failed to save smart link data.");
				redirectAttributes.addFlashAttribute("result", "error");
			}
		} catch (JsonProcessingException e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Error parsing response from API.");
			redirectAttributes.addFlashAttribute("result", "error");
		}

		return "redirect:/addLink";
	}

	@RequestMapping(value = "/editLink")
	public ModelAndView editLink(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {
		ModelAndView editLink = new ModelAndView("editLink");
		int linkId = Integer.parseInt(request.getParameter("linkId"));
		String allTerritoryDataString = apiService.getAllTerritoryData();
		String allAgencyDataString = apiService.getAllAgencyData();
		String allLinkDataString = apiService.getAllLinkData();

		List<Map<String, Object>> allTerritoryDataList = objectMapper.readValue(allTerritoryDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});
		List<Map<String, Object>> allAgencyDataList = objectMapper.readValue(allAgencyDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});
		List<Map<String, Object>> allLinkDataList = objectMapper.readValue(allLinkDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		Map<String, Object> linkData = new HashMap<>();

		for (Map<String, Object> link : allLinkDataList) {
			if (linkId == (Integer) link.get("id")) {
				linkData = link;
				break;
			}
		}

		editLink.addObject("allTerritoryDataList", allTerritoryDataList);
		editLink.addObject("allAgencyDataList", allAgencyDataList);
		editLink.addObject("linkData", linkData);
		editLink.addObject("username", getUserName());
		return editLink;
	}

	@PostMapping("/updateSmartLink")
	public String updateSmartLink(HttpServletRequest request, RedirectAttributes redirectAttributes)
			throws JsonMappingException, JsonProcessingException {

		Map<String, String> linkData = new HashMap<>();
		linkData.put("territoryid", request.getParameter("territory"));
		linkData.put("offerOpr1", request.getParameter("offerOpr1"));
		linkData.put("offerOpr2", request.getParameter("offerOpr2"));
		linkData.put("offerOpr3", request.getParameter("offerOpr3"));
		linkData.put("offerOpr4", request.getParameter("offerOpr4"));
		linkData.put("opr1", request.getParameter("opr1"));
		linkData.put("opr2", request.getParameter("opr2"));
		linkData.put("opr3", request.getParameter("opr3"));
		linkData.put("opr4", request.getParameter("opr4"));
		linkData.put("lang", request.getParameter("lang"));
		linkData.put("design", "light");
		linkData.put("agency", request.getParameter("agency"));
		String jsonLinkData = objectMapper.writeValueAsString(linkData);
		Boolean response = apiService.updateSmartLink(jsonLinkData);
		if (Boolean.TRUE.equals(response)) {
			redirectAttributes.addFlashAttribute("successMessage", "Smart link data updated successfully");
			return "redirect:/viewLink";
		}

		redirectAttributes.addFlashAttribute("errorMessage", "Failed to update smart link data.");
		return "redirect:/viewLink";
	}

	@RequestMapping(value = "/billingReport")
	public ModelAndView billingReport(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {
		ModelAndView billingReport = new ModelAndView("billingReport");
		String dateRange = request.getParameter("dateRangeInput");
		String serviceid = request.getParameter("serviceid");

		List<Map<String, Object>> allBillingDataList;
		String from;
		String to = "";

		if (dateRange == null || dateRange.isEmpty()) {
			String billingData = apiService.getTodayBillData();
			allBillingDataList = objectMapper.readValue(billingData, new TypeReference<List<Map<String, Object>>>() {
			});
		} else {
			String[] dates = dateRange.split(" to ");
			if (dates.length == 2) {
				from = dates[0];
				to = dates[1];
			} else {
				from = dates[0];
				to = dates[0];
			}
			String reportData = apiService.getBillingReportData(from, to, serviceid);
			allBillingDataList = objectMapper.readValue(reportData, new TypeReference<List<Map<String, Object>>>() {
			});
		}

		String allTerritoryDataString = apiService.getAllTerritoryData();
		List<Map<String, Object>> allTerritoryDataList = objectMapper.readValue(allTerritoryDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		billingReport.addObject("to", to);
		billingReport.addObject("allTerritoryDataList", allTerritoryDataList);
		billingReport.addObject("allBillingDataList", allBillingDataList);
		billingReport.addObject("username", getUserName());

		return billingReport;
	}

}
