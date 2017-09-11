
	NSString *jsondata = @"[{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 현대 아이오닉 하이브리드\", \"link\":\"http://m.carisyou.com/media/gallery/N/52997\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 현대 아이오닉 일렉트릭\", \"link\":\"http://m.carisyou.com/media/gallery/N/53000\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 재규어 XF\", \"link\":\"http://m.carisyou.com/media/gallery/N/53049\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 BMW i3\", \"link\":\"http://m.carisyou.com/media/gallery/N/53073\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2018 기아 뉴 카니발(YP)\", \"link\":\"http://m.carisyou.com/media/gallery/N/53201\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 현대 그랜저(IG)\", \"link\":\"http://m.carisyou.com/media/gallery/N/53020\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 현대 뉴 아반떼(AD)\", \"link\":\"http://m.carisyou.com/media/gallery/N/53104\"},{\"date\":\"2017-04-12\", \"subject\":\"[카유갤러리] 2017 BMW 5시리즈\", \"link\":\"http://m.carisyou.com/media/gallery/P/52875\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 기아 뉴 모닝(JA)\", \"link\":\"http://m.carisyou.com/media/gallery/N/53038\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2018 현대 싼타페 더 프라임\", \"link\":\"http://m.carisyou.com/media/gallery/N/53026\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 BMW 5시리즈\", \"link\":\"http://m.carisyou.com/media/gallery/N/52715\"},{\"date\":\"2017-04-12\", \"subject\":\"[카유갤러리] 2017 BMW 7시리즈\", \"link\":\"http://m.carisyou.com/media/gallery/P/52955\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 BMW 7시리즈\", \"link\":\"http://m.carisyou.com/media/gallery/N/53082\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 시트로엥 그랜드 C4 피카소\", \"link\":\"http://m.carisyou.com/media/gallery/N/53236\"},{\"date\":\"2017-04-12\", \"subject\":\"[카유갤러리] 2017 혼다 파일럿\", \"link\":\"http://m.carisyou.com/media/gallery/P/52914\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 혼다 파일럿\", \"link\":\"http://m.carisyou.com/media/gallery/N/52914\"},{\"date\":\"2017-04-12\", \"subject\":\"[갤러리] 2017 인피니티 Q50\", \"link\":\"http://m.carisyou.com/media/gallery/N/52975\"},{\"date\":\"2017-04-12\", \"subject\":\"[카유갤러리] 2017 인피니티 Q50\", \"link\":\"http://m.carisyou.com/media/gallery/P/52975\"},{\"date\":\"2017-04-10\", \"subject\":\"[갤러리] 2018 기아 뉴 K5(JF)\", \"link\":\"http://m.carisyou.com/media/gallery/N/53235\"},{\"date\":\"2017-04-10\", \"subject\":\"[자동차정보] 2017 시트로엥 그랜드 C4 피카소\", \"link\":\"http://m.carisyou.com/car/5442\"},{\"date\":\"2017-04-10\", \"subject\":\"[자동차정보] 2018 기아 뉴 K5(JF)\", \"link\":\"http://m.carisyou.com/car/5502\"},{\"date\":\"2017-04-06\", \"subject\":\"[월간TOP10] 2017년 03월 국산차 국산차 등록 순위 TOP10\", \"link\":\"http://m.carisyou.com/theme/top10/53\"},{\"date\":\"2017-04-06\", \"subject\":\"[월간TOP10] 2017년 03월 수입차 수입차 등록 순위 TOP10\", \"link\":\"http://m.carisyou.com/theme/top10/52\"},{\"date\":\"2017-04-06\", \"subject\":\"[갤러리] 2017 벤츠 E클래스\", \"link\":\"http://m.carisyou.com/media/gallery/N/53217\"},{\"date\":\"2017-04-06\", \"subject\":\"[자동차정보] 2017 벤츠 E클래스\", \"link\":\"http://m.carisyou.com/car/5193\"},{\"date\":\"2017-04-06\", \"subject\":\"[갤러리] 2018 기아 뉴 모하비\", \"link\":\"http://m.carisyou.com/media/gallery/N/53214\"},{\"date\":\"2017-04-06\", \"subject\":\"[자동차정보] 2018 기아 뉴 모하비\", \"link\":\"http://m.carisyou.com/car/5501\"},{\"date\":\"2017-04-05\", \"subject\":\"[갤러리] 2017 토요타 프리우스 프라임\", \"link\":\"http://m.carisyou.com/media/gallery/N/53210\"},{\"date\":\"2017-04-05\", \"subject\":\"[자동차정보] 2017 토요타 프리우스 프라임\", \"link\":\"http://m.carisyou.com/car/5500\"}]";
	SBJsonParser *json = [SBJsonParser new];
	NSArray *arr = [json objectWithString:jsondata];

	NSMutableArray *timelineData = [NSMutableArray array];
	NSMutableArray *gData = [NSMutableArray array];
	NSString *prevDate = @"";
	for (int i = 0, z = [arr count]; i < z; i++) {
		NSMutableDictionary *sdata = [arr objectAtIndex:i];
		NSMutableDictionary *dic0 = [NSMutableDictionary dictionary];
		NSString *date = [sdata objectForKey:@"date"];
		if (![prevDate isEqualToString:date]) {
			if ([gData count] > 1) {
				[timelineData addObject:[[NSMutableArray alloc] initWithArray:gData copyItems:YES]];
				[gData removeAllObjects];
			}
			[dic0 setObject:@"date" forKey:date];
			[gData addObject:dic0];
			prevDate = date;
		}
		NSMutableDictionary *cData = [NSMutableDictionary dictionary];
		[cData setObject:@"subject" forKey:[sdata objectForKey:@"subject"]];
		[cData setObject:@"link" forKey:[sdata objectForKey:@"link"]];
		[gData addObject:cData];
	}
	if ([gData count] > 1) {
		[timelineData addObject:gData];
	}
	NSLog(@"Test Result : %@", timelineData);




// js 호출하는 부분
	- (void)searchData {
		[mapView stringByEvaluatingJavaScriptFromString:@"exeSearch();"];
		[actView startAnimating];
	}



// JS 호출하는 부분
	- (BOOL)webView:(UIWebView *)a_webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
		NSString* path = [request.URL relativePath];
		NSRange rangeFound = [path rangeOfString:@"jscall|@|"];
		if (rangeFound.location != NSNotFound && rangeFound.length > 0) {
			NSArray *arrData = [path componentsSeparatedByString:@"|@|"];
			NSLog(@"jsCall Path : %@", path);
			if ([arrData count] > 1) {
				NSString *strFuncName = arrData[1];

				// 로그인 오류
				if ([strFuncName isEqualToString:@"LoginError"]) {
					[self showAlert:[NSString stringWithFormat:@"로그인 오류\n\n%@", arrData[3]]];
					[self.mm_drawerController setCenterViewController:[CLMMainViewController new] withCloseAnimation:YES completion:nil];
				}

				// 로그인 세션 종료
				else if ([strFuncName isEqualToString:@"LoginCheck"]) {
					[self showAlert:@"세션시간이 만료되었습니다.\n다시 인증을 하시기 바랍니다"];
					[[CLMSessionManager sharedManager] setLogout];
					[self.mm_drawerController setCenterViewController:[CLMMainViewController new] withCloseAnimation:YES completion:nil];
				}

				// 공개설정이 안된 차량을 공개차량에서 조회시
				else if ([strFuncName isEqualToString:@"Private"]) {
					[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
					[self showAlert:@"조회하신 차량은 정보공개가 되어 있지 않습니다.\n\n해당 차량 소유주에게 연락하여 정보공개를 요청하시기 바랍니다."];
					[self.mm_drawerController setCenterViewController:[CLMMainViewController new] withCloseAnimation:YES completion:nil];
				}

				// 타이틀 변경
				else if ([strFuncName isEqualToString:@"changeTitle"]) {
					self.viewTitle.text = arrData[2];
				}

				// 알림창 메시지 띄우기
				else if ([strFuncName isEqualToString:@"nativeAlert"]) {
					[self showAlert:arrData[2]];
				}

				// 인증절차 재시작
				else if ([strFuncName isEqualToString:@"ReCert"]) {
					[SAMKeychain deletePasswordForService:SERVICE account:@"mycarNo"];
					[SAMKeychain deletePasswordForService:SERVICE account:@"EasyLogin"];
					[self.mm_drawerController setCenterViewController:[CLMCarNoInputViewController new] withCloseAnimation:YES completion:nil];
				}

				// 공개 동의 차량 조회 인증 성공
				else if ([strFuncName isEqualToString:@"PublicCar"]) {
					[[CLMSessionManager sharedManager] setOtherParam:@{@"vhmno":arrData[2],
																		@"vhrno":arrData[3],
																		@"vin":arrData[4],
																		@"scope":arrData[5],
																		@"rcept":arrData[6],
																		@"mpnum":arrData[7],
																		@"crtfc":arrData[8],
																		@"pgflag":arrData[9],
																		@"pgdate":arrData[10]}];
					if ([[CLMSessionManager sharedManager].otherParam[@"pgflag"] isEqualToString:@"Y"]) {
						[[CLMSessionManager sharedManager] changeMenuMain:CLMMenuSectionBaseInfo Sub:0];
						[self loadWebPage:[[CLMSessionManager sharedManager] getWebParameter]];
					}
					else {
						// 결제후 보여줄 정보를 설정하는 프로세스가 필요하다.
						NSDictionary *pgParam = @{@"vhmno":arrData[2], @"vhrno":arrData[3], @"pay":@"02", @"rcept":arrData[6], @"scope":arrData[5]};
						[CLMSessionManager sharedManager].pgParam = pgParam;
	//					[self showAlert:@"결제가 되지 않은 차량입니다. 정보를 조회하시려면 일정 수수료를 지급해야 합니다."];
						[self.mm_drawerController setCenterViewController:[CLMPgViewController new] withCloseAnimation:YES completion:nil];
					}
				}

				// 공개 미동의 차량 조회 인증 성공
				else if ([strFuncName isEqualToString:@"NormalCar"]) {
					NSString *certCheck = [CLMSessionManager sharedManager].certState > 0 ? @"1" : @"0";
					[[CLMSessionManager sharedManager] certNormalCar];
					[CLMSessionManager sharedManager].isSeparateWeb = YES;
					[CLMSessionManager sharedManager].separateWebParam = @{@"IS_INFO":@"0",
																			@"URI":@"Board/generalCar_check.asp",
																			@"KEY":@"VHRNO,CERT_CHECK",
																			@"CERT_CHECK":certCheck,
																			@"VHRNO":arrData[2]};
					[[CLMSessionManager sharedManager] setViewTitleWithString:@"공개 미동의 차량조회"];
					[self loadWebPage:[[CLMSessionManager sharedManager] getWebParameter]];
				}

				// 타인 미동의 차량 결제 안되어 있을 경우
				else if ([strFuncName isEqualToString:@"NormalNotPg"]) {
					NSDictionary *pgParam = @{@"vhrno":arrData[2], @"vhmno":arrData[3], @"pay":@"03", @"rcept":@"", @"scope":@""};
					[CLMSessionManager sharedManager].pgParam = pgParam;
					[self.mm_drawerController setCenterViewController:[CLMPgViewController new] withCloseAnimation:YES completion:nil];
				}

				// 공인인증서 호출
				else if ([strFuncName isEqualToString:@"Unisign"]) {
					[CLMSessionManager sharedManager].certParam = @{@"mode":arrData[2], @"vhrno":arrData[3], @"scope":arrData[4]};
					[self.mm_drawerController setCenterViewController:[CLMCertIntroViewController new] withCloseAnimation:YES completion:nil];
				}

				// 인증절차 완료
				else if ([strFuncName isEqualToString:@"PhoneCert"]) {
					// 인증 성공 여부 판단(성공이면)
					if ([arrData[2] isEqualToString:@"0"]) {
						NSMutableArray *carDatas = [NSMutableArray array];
						for (int i = 3; i < [arrData count]; i++) {
							NSArray *carRaws = [arrData[i] componentsSeparatedByString:@":"];
							NSDictionary *carData = @{@"vhrno":carRaws[0],// 차량등록번호
													@"vhmno":carRaws[1],  // 차량관리번호
													@"vin":carRaws[2],    // 차대번호
													@"cnm":carRaws[3],    // 차명
													@"scr":carRaws[4],    // 폐차여부
													@"pgflag":carRaws[5], // 결제여부(Y/N)
													@"pgdate":carRaws[6]};// 결제일시(yyyyMMddHHmmss)
							[carDatas addObject:carData];
						}
						[CLMSessionManager sharedManager].onesParams = carDatas;
						if ([CLMSessionManager sharedManager].mainMenuIndex == 103 && [carDatas[0][@"scr"] isEqualToString:@"03"]) {
							[self showAlert:@"말소차량은 공개설정을 하실 수가 없습니다"];
							[self.mm_drawerController setCenterViewController:[CLMMainViewController new] withCloseAnimation:YES completion:nil];
						}
						else {
							if ([carDatas[0][@"pgflag"] isEqualToString:@"Y"]) {
								[self loadWebPage:[[CLMSessionManager sharedManager] getWebParameter]];
							}
							else {
								// 결제후 보여줄 정보를 설정하는 프로세스가 필요하다.
								NSDictionary *pgParam = @{@"vhmno":carDatas[0][@"vhmno"], @"vhrno":carDatas[0][@"vhrno"], @"pay":@"01", @"rcept":@"", @"scope":@""};
								[CLMSessionManager sharedManager].pgParam = pgParam;
	//							[self showAlert:@"결제가 되지 않은 차량입니다. 정보를 조회하시려면 일정 수수료를 지급해야 합니다."];
								[self.mm_drawerController setCenterViewController:[CLMPgViewController new] withCloseAnimation:YES completion:nil];
							}
						}
					}
					else {
						[self showAlert:arrData[3]];
						[self.mm_drawerController setCenterViewController:[CLMMainViewController new] withCloseAnimation:YES completion:nil];
					}
				}

				// 간편 로그인 설정저장
				else if ([strFuncName isEqualToString:@"EasySave"]) {
					if ([arrData[2] isEqualToString:@"-1"]) {
						// 설정 저장 실패
						[self showAlert:arrData[3]];
					}
					// 설정 저장 성공
					else if ([arrData[2] isEqualToString:@"0"]) {
						// 설정 저장 성공
						[SAMKeychain setPassword:[CLMSessionManager sharedManager].onesParams[[CLMSessionManager sharedManager].paramIndex][@"vhrno"] forService:SERVICE account:@"mycarNo"];
						[SAMKeychain setPassword:@"Y" forService:SERVICE account:@"EasyLogin"];
						[self showAlert:arrData[3]];
					}
					// 간편로그인 설정 삭제
					else if ([arrData[2] isEqualToString:@"1"]) {
						[self deleteEasyLogin];
					}
					[self.mm_drawerController setCenterViewController:[CLMMainViewController new] withCloseAnimation:YES completion:nil];
				}
				else if ([strFuncName isEqualToString:@"ChangeNormalCar"]) {
					self.viewTitle.text = @"미동의 차량 조회";
					// 미동의 차량 조회 메뉴로 세팅
					[[CLMSessionManager sharedManager] changeMenuMain:CLMMenuSectionOtherCar Sub:2];
				}
			}
			return NO;
		}
		return YES;
	}
