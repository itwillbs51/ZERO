package com.itwillbs.zero.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.itwillbs.zero.vo.ResponseTokenVO;
import com.itwillbs.zero.vo.ResponseUserInfoVO;

@Service
public class BankApiClient {

	// classpath:/config/appdata.properties 파일 내의 속성값 자동 주입
	// 주의! @Value 어노테이션 선언 시 패키지명 : org.springframework.beans.factory.annotation
	@Value("${base_url}")
	private String baseUrl;
	
	@Value("${client_id}")
	private String clientId;
	
	@Value("${client_secret}")
	private String clientSecret;
	
	private RestTemplate restTemplate;	// @Autowired 어노테이션 사용 불가(스프링에서 관리하는 Bean 객체가 아님)
	
	// 로그 출력을 위한 변수 선언 => getLogger() 메서드 파라미터로 로그 처리할 현재 클래스 지정
	private static final Logger logger = LoggerFactory.getLogger(BankApiClient.class);
	
	// 2.1.2. 토큰발급 API - 사용자 토큰발급 API (3-legged)
	public ResponseTokenVO requestToken(Map<String, String> authResponse) {
		
		String url = baseUrl + "/oauth/2.0/token";
		
		// 1. 헤더, 바디 생성
		HttpHeaders httpHeaders = new HttpHeaders();
		
		// 2. 헤더에 정보 추가
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		
		// 3. 요청에 필요한 파라미터 설정
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		
		parameters.add("code", authResponse.get("code")); // 응답데이터 활용
		parameters.add("client_id", clientId); // @Value 어노테이션으로 포함한 속성값
		parameters.add("client_secret", clientSecret); // @Value 어노테이션으로 포함한 속성값
		parameters.add("redirect_uri", "http://localhost:8089/zero/callback"); // 기존 콜백 URL 그대로 활용
		parameters.add("grant_type", "authorization_code"); // 고정값
		logger.info("□□□□□□ parameters : " + parameters.toString());
		
		// 4. 요청에 사용될 헤더와 파라미터 정보를 갖는 HttpEntity 객체 생성
		// => 제네릭타입으로 요청 파라미터 타입 지정
		HttpEntity<MultiValueMap<String, String>> httpEntity = 
				new HttpEntity<MultiValueMap<String,String>>(parameters, httpHeaders);
		
		// 5. REST 방식 요청을 수행하기 위해서는 RestTemplate 객체 생성
		restTemplate = new RestTemplate();
		
		// 6. RestTemplate 객체의 exchange() 메서드 호출
		ResponseEntity<ResponseTokenVO> responseEntity =
				restTemplate.exchange(url, HttpMethod.POST, httpEntity, ResponseTokenVO.class);
		
		// 7. 응답받은 ResponseEntity
		logger.info("□□□□□□ ResponseEntity.getBody() : " + responseEntity.getBody());
		logger.info("□□□□□□ ResponseEntity.getStatusCode() : " + responseEntity.getStatusCode());
		
		// 8. 응답 데이터 리턴
		// => ResponseEntity 객체의 제네릭타입인 ResponseTokenVO 타입 객체는
		//    ResponseEntity 객체의 getBody() 메서드로 리턴받을 수 있다! 
		return responseEntity.getBody();
	}

	// 2.2. 사용자/계좌 관리 
	// - 2.2.1. 사용자정보조회 API - GET
	public ResponseUserInfoVO requestUserInfo(String access_token, String user_seq_no) {
		
		String url = baseUrl + "/oauth/2.0/user/me";
		
		// 1. 헤더 생성
		HttpHeaders httpHeaders = new HttpHeaders();
		
		// 2. 헤더에 정보 추가
		httpHeaders.add("Authorization", "Bearer" + access_token);
		
		// 3. 요청에 필요한 파라미터 설정
		UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(url).queryParam("user_seq_no", user_seq_no).build();
		
		// 4. 요청에 사용될 헤더와 파라미터를 갖는 HttpEntity 객체 생성
		HttpEntity<String> httpEntity = new HttpEntity<String>(httpHeaders);
		
		// 5. Rest 방식 요청을 위해 RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		// 6. RestTemplate 객체의 exchage() 메서드 호출 -> HTTP 요청 수행
		ResponseEntity<ResponseUserInfoVO> responseEntity = restTemplate.exchange(uriComponents.toString(), HttpMethod.GET, httpEntity, ResponseUserInfoVO.class);
		
		logger.info("□□□□□□ 사용자정보조회 ResponseEntity.getBody() : " + responseEntity.getBody());
		
		return responseEntity.getBody();
	}

}
