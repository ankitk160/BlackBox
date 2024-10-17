package com.blackbox.service;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service("apiService")
@CacheConfig(cacheNames = "apiCache")
public class ApiService {

	RestTemplate restTemplate = new RestTemplate();

	HttpHeaders headers = new HttpHeaders();

	// index page urls here

	@Cacheable(key = "'indexPageData'")
	public String getIndexPageData() {
		return restTemplate.getForObject(indexUrl, String.class);
	}

	@Cacheable(key = "'chartData'")
	public String getChartData() {
		return restTemplate.getForObject(chartUrl, String.class);
	}

	// Campaign urls here

	@Cacheable(key = "'allCampaign'")
	public String getAllCampaignData() {
		return restTemplate.getForObject(campaignUrl, String.class);
	}

	public String getCampaignDataById(int id) {
		String finalUrl = campaignDataByIdUrl + id;
		return restTemplate.getForObject(finalUrl, String.class);
	}

	public String saveCampaignData(String jsonCampaignData) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request = new HttpEntity<>(jsonCampaignData, headers);
		return restTemplate.postForObject(saveCampUrl, request, String.class);
	}

	public Boolean updateCampaignData(String jsonCampaignData) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request = new HttpEntity<>(jsonCampaignData, headers);
		return restTemplate.postForObject(updateCampaignUrl, request, Boolean.class);
	}

	// Offer urls here

	@Cacheable(key = "'allOffer'")
	public String getAllOfferData() {
		return restTemplate.getForObject(offerUrl, String.class);
	}

	public String getOfferById(int id) {
		String finalUrl = offerByIdUrl + id;
		return restTemplate.getForObject(finalUrl, String.class);
	}

	public String saveOfferData(String jsonOfferData) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request = new HttpEntity<>(jsonOfferData, headers);
		return restTemplate.postForObject(saveOfferUrl, request, String.class);
	}

	public Boolean updateOfferData(String jsonOfferData) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request = new HttpEntity<>(jsonOfferData, headers);
		return restTemplate.postForObject(updateOfferUrl, request, Boolean.class);
	}

	// Territory urls here

	@Cacheable(key = "'allTerritory'")
	public String getAllTerritoryData() {
		return restTemplate.getForObject(territoryUrl, String.class);
	}

	public String getOprByTerrId(int id) {
		String finalUrl = oprByTerrIdUrl + id;
		return restTemplate.getForObject(finalUrl, String.class);
	}

	// Partner urls here

	@Cacheable(key = "'allPartner'")
	public String getAllPartnerData() {
		return restTemplate.getForObject(partnerUrl, String.class);
	}

	// Switching urls here

	@Cacheable(key = "'allSwitching'")
	public String getAllSwitchingData() {
		return restTemplate.getForObject(switchingUrl, String.class);
	}

	public String saveSwitchingData(String jsonSwitchingData) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request = new HttpEntity<>(jsonSwitchingData, headers);
		return restTemplate.postForObject(saveSwitchingUrl, request, String.class);
	}

	public Boolean updateSwitchingData(String jsonSwitchData) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request = new HttpEntity<>(jsonSwitchData, headers);
		return restTemplate.postForObject(updateSwitchData, request, Boolean.class);
	}

	// Agency urls here

	@Cacheable(key = "'allAgency'")
	public String getAllAgencyData() {
		return restTemplate.getForObject(agencyUrl, String.class);
	}

	// Smart link urls here

	public String getAllLinkData() {
		return restTemplate.getForObject(smartLinkUrl, String.class);
	}

	public String saveSmartLink(String jsonLinkData) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request = new HttpEntity<>(jsonLinkData, headers);
		return restTemplate.postForObject(saveSmartLinkUrl, request, String.class);
	}

	public Boolean updateSmartLink(String jsonLinkData) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> request = new HttpEntity<>(jsonLinkData, headers);
		return restTemplate.postForObject(updateSmartLinkUrl, request, Boolean.class);
	}

	// Report url here

	@Cacheable(value = "apiCache", key = "#from + ':' + #to")
	public String getAffProReportData(String from, String to) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		String jsonDates = String.format("{\"from\":\"%s\",\"to\":\"%s\"}", from, to);
		HttpEntity<String> request = new HttpEntity<>(jsonDates, headers);
		return restTemplate.postForObject(reportUrl, request, String.class);
	}

	// Hardcoded msisdn url here

	@Cacheable(key = "'allMsisdn'")
	public String getHardMsisdn() {
		return restTemplate.getForObject(hardMsisdnUrl, String.class);
	}

	// Billing report urls here

	@Cacheable(key = "'todayBill'")
	public String getTodayBillData() {
		return restTemplate.getForObject(billRepUrl, String.class);
	}

	public String getServInfoByOprId(int id) {
		String finalUrl = getServInfoByOprIdUrl + id;
		return restTemplate.getForObject(finalUrl, String.class);
	}

	public String getBillingReportData(String from, String to, String serviceid) {
		headers.setContentType(MediaType.APPLICATION_JSON);
		String finalUrl = String.format("%s?from=%s&to=%s&serviceid=%s", getBillRepDataUrl, from, to, serviceid);
		HttpEntity<String> request = new HttpEntity<>(headers);
		return restTemplate.postForObject(finalUrl, request, String.class);
	}

}
