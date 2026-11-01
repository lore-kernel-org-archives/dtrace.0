Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793515122;
	b=DIA8uWr/Arli7oiOSGHizRJzxuptjkV2TzK3YwTbjWGUeKMN1KBS6KQcMfib4HgmuNwM
	 20wZqB8t7AK0J7PY39lbi5YSknAFZeOHnyVVjhT+NPkx20Sg5oHwCz+tcvtTH0UgxM0d6
	 3nOymzZ4i4wkFY2KO3N73A3LPIxGoHh7poY6Ya7I3B5hDL2kCDuSD5PwBiHFAea4RtGrA
	 yx8XfvilSwQwMG0fQ6/NVBd2AeOXHx4erSskqx2EKM6t+V9GOu5SaqKUqhWqL/CNbzLAB
	 nt3H0io4f8nVmLzJah6FDERuJtDCjrMXIBF2lAEZyMqPmXz/uoA/SSb0Ww6655pr6dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515122;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=l9ZKZXLZJHVo3DlxIVlvNONoSfn6WsDCU5+bPXFCuqA=;
	b=lfL7hTWaqjPp0O9fGQplGn3EcLejXl/p0l+CLI9NoLNtamynPPTljXKna06oBF7JPh7h
	 XfErxiaK3xw/zProxUdyhHV2vK8/aCXvKNarljwVBlbLOQThLcQcde1PgUaNvqHUOoKUN
	 Kof9SAad/oT5l2v71q23JwR01h/XGAEt/DM30ORrau3EsPZ/XrKejg8WDmzvehuzEqE1T
	 6mD6+zshaS6yrPm8MZ6Mh/zo2vhwbEddPpB+wQIXPqK3GB0uzDSHj+BNgCS65Lw+WTGDZ
	 ZxxFO+lZIXPiSxLQcGWVmyxqUxNtC2w0hhOrTxdbHynxN6dn3F6fpRYD0C6jNDTRuCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-matrix.ai;
	spf=pass smtp.mailfrom=d-matrix.ai;
	dkim=pass header.d=d-matrix.ai header.i=@d-matrix.ai header.a=rsa-sha256 header.s=selector1 header.b=PMc5mbaB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.121
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022121.outbound.protection.outlook.com [52.101.43.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00737606A32D
	for <dtrace@lists.linux.dev>; Sun,  1 Nov 2026 06:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00737606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=d-matrix.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-matrix.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=d-matrix.ai header.i=@d-matrix.ai header.a=rsa-sha256 header.s=selector1 header.b=PMc5mbaB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxFA3FQYY0OU85ZFw/QGwjjSuxTcS1OshZI1/QQKC8WM1hw5ILNOJfLolZqts5IKgu8RSi2/TyzQr2CeHt3zDkFoAjTJlQY86UWNlZFrHztCYvpNJ7J2YpLdAO2DjF5OGwa/CDut9LL59xfOwY1Do473BGN4JjQMIL3eLKBumP7/0Ku5qPNGyQi361eTMXz2Ck+2VdRqjfpVvgiNgJJBQwXb+q7f2FFBYqI3jt1AXLFCdF1sGxo0lcGxr8mVLtalPleI2a/OZ+UDf6dxv2MrGDVYwb6VcYHIOBRx3SUnyTNFpTIqN/ResOaf21bDDpD60v4DBCbzx1JvW8lpETtoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9ZKZXLZJHVo3DlxIVlvNONoSfn6WsDCU5+bPXFCuqA=;
 b=cuzmBSzeMQfM+D9yeDtH7DE0WEmEDhOCMHeD/6caU24EcQAo5Xz5d7hEp9aJVYWSwnF6peArJGheto6W3EtO8JjwcnrledBGhPMPCLdncw5o49G9gYVyXjFq9aUeDRedLvkpPlIxrRjQL6KmCxrU3OPh/sy8KjgSnIlpNWjJeV3WPSwhWMEHgK85DUhWGX8MZ6ZHurYwHH+gn9o2PCquQVZi++U3vyYzhuXuV9SUV4fIOStT7/jbwzwGK13lk1fbjFp2vaXM4c9AnsudD0yGESjfLr7tYepYm8TY6/Myhd777aUgOoU0Mxetbfmz6VZx8kbEu0KPR3QpG0JmeU4DxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d-matrix.ai; dmarc=pass action=none header.from=d-matrix.ai;
 dkim=pass header.d=d-matrix.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-matrix.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9ZKZXLZJHVo3DlxIVlvNONoSfn6WsDCU5+bPXFCuqA=;
 b=PMc5mbaBUfJMybYtku0zL5trO3YGiROwMqyTsoZw+zq4W65w2u9fRW8US1sPeYTqfTLWIq9vDZ9iCX5B5m8EdDR2WhiXDfRmScl7M6l3mJnQCYVugQmRUodOkA8/nY8OWlKw3VJR9TxTvIq40fXv/JHW1zdI5uU3TktKtTPqe+k=
Received: from DM3PPF78E03B81B.namprd22.prod.outlook.com
 (2603:10b6:f:fc00::e29) by DS3PR22MB568684.namprd22.prod.outlook.com
 (2603:10b6:8:438::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sun, 1 Nov
 2026 06:38:38 +0000
Received: from DM3PPF78E03B81B.namprd22.prod.outlook.com
 ([fe80::952:c55c:8620:e3a8]) by DM3PPF78E03B81B.namprd22.prod.outlook.com
 ([fe80::952:c55c:8620:e3a8%4]) with mapi id 15.21.0569.010; Sun, 1 Nov 2026
 06:38:38 +0000
From: Eslam AlMorshdy <ealmorshdy@d-matrix.ai>
To: Kris Van Hees <kris.van.hees@oracle.com>
CC: "dtrace@lists.linux.dev" <dtrace@lists.linux.dev>
Subject: Re: [PATCH 0/3] Fix strlen() overwriting strtab's read-only data and
 zeros
Thread-Topic: [PATCH 0/3] Fix strlen() overwriting strtab's read-only data and
 zeros
Thread-Index: AQHdXqtyTlSySzGYsE+mSw7fqHuiUrcWzuyAgAGVo4A=
Date: Sun, 1 Nov 2026 06:38:38 +0000
Message-ID: <7E1B2E6F-731D-4776-8509-6655FED92324@d-matrix.ai>
References: <20261018-bug010-strlen-strtab-v1-0-ac5f5bc6f8a0@d-matrix.ai>
 <auUnt_vPhbt120Jb@oracle.com>
In-Reply-To: <auUnt_vPhbt120Jb@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d-matrix.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF78E03B81B:EE_|DS3PR22MB568684:EE_
x-ms-office365-filtering-correlation-id: a55430e2-ff87-474e-efb8-08df37e2c2ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|4143699003|56012099006|261009221227099003|261009223027099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261022075727099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 FWNpym6pjx8RCwkmYGGB9i0M8ZyAZlynSZ4BsgXBng919fthF9TPHrer4/N3A6+1SZVDv0sLf3sW9RsmX36T8zxMqf76qb1s+W1Y/PWkqEzmu46YnwnM+czxkEpsF1LIdnjufZb5mfiNNY9JF9bCY8Z07m5HdZ9QWdZEonHZrMmm5zIojJU1eRxFRfIxM4twiYCp+kc6ByCN8c9ve0muQjFd3BU3wAwdJ9yI2JiyMd2EZk6oWk6crkOYdixaww5/4MuYxbmGAWk9pXfS3MUGtNBAYXIqJqOJ/2rw7/ADo9715rBH8DJxCApy1iYWlSO64fOUH+GK7G5A57wedXpmseRyBHQcjgkQ58J1xPDO8l38BYiV7yJTm9TD9xwNFLn3I76IaUpUaaT63hNCKjTKorozHVMqXzc9OZCVmLCJFP2WsiE6wOWsiHeRf/B5W5zKct1Du+6jblK8g7t+m+LyUDEj83qfEvvgbQa/HppWCToDBlSU+1t7CXX7INQ242IAi27gdNGkKpU6UDFH49qkRVudzjXcFLRn+oexMXEgETWxbLJQjBehW1zh1z1GlasIZuoMfOMJrP7+Pb/juNp6Qlglpe9lHVq5DnX/dY/oKWIQK6RznGms5asPHD0NXwlpWPdfASFRh1ytkTBr+Xq429+lT4Srw1IIzG2I4xb2TtsoyRsSghTUS3veWdi29/6gIVYhECzD5YthWYaiIgk/7I/wfPHq1B/URJErW22B+Ps=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF78E03B81B.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(4143699003)(56012099006)(261009221227099003)(261009223027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVN0NlJtYWJ6aWswbmx4NVZlL3VQWnN0clJzMmZ2NGZGbjBSQnliSnNWL0NZ?=
 =?utf-8?B?VExTelZYNmZVZDhtZzJEN3FQZ2ZqTEsrNFNnUjZyM2JNSGpxNDZ0eEhBODUv?=
 =?utf-8?B?OXdBenpBSmgvRHoxa1JXM1VwcUcwN3lYQXp0UkNQcENLRDk5TVJVRGVNdE93?=
 =?utf-8?B?YzNtOWVqTUpQZ1JMeFhqUmFJeHZldmh0RzlHK3dkZGE0OGo3R1NrTWdTRi9I?=
 =?utf-8?B?M1lsaE05dDJDVmJHRGtVMmF5L2tudlNtcFpXTmhHTTE0SFFRZ3p6QzNXMnZ6?=
 =?utf-8?B?VU1ad25GZE5ibTM2Z0ozNnlVUnl4QkZWTjJVbmVXaE42cFBoeE0vVENtUmZo?=
 =?utf-8?B?VkNPcW8rTnJseURzclJTbGl1eXFXdXFKek1icm1VUWZZaXBmQzZRanYrbmtP?=
 =?utf-8?B?UFpZdGFuaERvNjRFaVUyTk5qVzhpMGFlRGFHeUZpRW51QjZBZGJ0bFYrandB?=
 =?utf-8?B?am12eVdhNm54NkdVQTJoWVJQK240U1E3R3FIT3hwL2tVVU5zZmx3MmlzaFlT?=
 =?utf-8?B?U2paV1hHQVF6UFlPRit2dVdSZVhtU3dvUERuZUg0VHpWelUzeCtTbDMwb2NL?=
 =?utf-8?B?a1MvekZjZVFJSGFybWxCTWNYR2JCL2thNXhGUjFRaWxneDFnZjB4Tm15ZUY1?=
 =?utf-8?B?NUtFZCtZODFDUzVDei9MeXNSZEl0aGFxeWRvbVNLOEZqaFlZRjFkbzF3U201?=
 =?utf-8?B?cXFlYkFqSmhLZFYxQVJPenNMNXZ1ZWhrSE5KMkFacWNGbFhKQXBnZWlZcGFz?=
 =?utf-8?B?ZUNpM2pvOEdjNFQvWTM0OXBRWXpZbENWYk5PbUpha3VUUlVYZ21mSXc1R25M?=
 =?utf-8?B?N2czdG5GNUJMNGFtMCtUY3FKV3pQZ2duQVFsd3NnZlF2cFFLcnJyb1lxM2Nx?=
 =?utf-8?B?d3NUMjhOYnRnZTIwOG00clZGNWRQODVpVDIrbUxGNm83bDdDZXpQaWNXaGYv?=
 =?utf-8?B?OGdsT09zcndudE5NUmVuWUVnRWViYjlST041S0FSbGkwNFkxbTlVK0RqeFZi?=
 =?utf-8?B?Y01YakY0cXFuRlJFakZmaEdUTURCWmIwVXhqNlorOVh5RDRQdE5TNzMreTVE?=
 =?utf-8?B?MDZaWlRiYk9pbGgwaEErSVYwN1VqenpKaEVRS0xBNUR3SlRQbUtGV0xvb0tp?=
 =?utf-8?B?c0FCd2kxNlZ6ODlBTVBUTERiK1RTS1pCRTR4bmoybXdwYlNkano0QURYV1pM?=
 =?utf-8?B?dE10NTZWWXh2dUg4Ym84UDlTVS9pRXUwL05Jdmo0Q29vUWZKeTJKVkhNTXpj?=
 =?utf-8?B?czdmN3NVMkZYSnNxVUgyVDZWSmcxNjZzZ1paTTBRNDE4azYrUlNpa25xbE1J?=
 =?utf-8?B?UW5jaStUWm9zaXQ1Y1VEdExFdFJIYVJMR2ExRlVqSjZNdjhQNEFLaHl3bUZx?=
 =?utf-8?B?SnlXSE5XcE8veElOYWEwQjJMaVZyUUk0THFNdi9LUkFlK1FNUlFxMjVLcG1K?=
 =?utf-8?B?QWZzWlpuSmV3NTB0dklXaHFYbUl5cjVMSWFpcll3MEFhRklvNkp6UmpUVUtu?=
 =?utf-8?B?bkN4c3RGU3RNRGsrU1poWVlZUG1VVDIrT2d4TEo4VHdobHFSQy9reG11aUg5?=
 =?utf-8?B?c3o5M0dRMWhwaXd6SlRjZU84S1NBQlRWSVRydW5WbkU5dDBNV1IwSVNkcmZC?=
 =?utf-8?B?YmErVEhIUEtybFpucjJxZ0lSQ2F4QXg4aTdSajUwVS9nR1p3b3E4ZFArUERx?=
 =?utf-8?B?Qy9kWVAyUzcvTmtJaDFhYnJqYzVVVTFKemNJY3Q3Y2V1cWJnaU9tSVRGWC8r?=
 =?utf-8?B?dnhlV3pKUFROcUJmOUswMlVKNTZPSEd5K2JUUmNsK01sbTdXOU50YUJIZTBo?=
 =?utf-8?B?ei91N3lhMzc4MjZnWmtBQ0xOWXhBMTBqMzJSZXFHZHFLRldIbi9DWDl3RThn?=
 =?utf-8?B?ODRjQ245TDFybERvclFUb2U2V3RuKzJDNUhOTFBJeFFXd1RubXl4UWVibSs0?=
 =?utf-8?B?SjRIQ09EcGtyYTVkMkRmQVBKWVlOYmh1SzA3elZaWnZUd3JFRTRCY2xmRVV3?=
 =?utf-8?B?Nlh3L3pjcWJJcnR6cjJyczhWQkNLdDhhVEZ1ZWRMM1pjZ0lONXE3bnBweGV2?=
 =?utf-8?B?RzJ0blNYdURoMFVjREpyV2RUbWxaK3BmclZRYkZ3bWVCSFBiK3B4Y3ZzUnh1?=
 =?utf-8?B?Ui8vZnZPN0xCVUY2SmNCVnpvSmFxMFNsNHB3czJQWWsyRWowQnhWNDdoNEdV?=
 =?utf-8?B?cjBzeFdaK2FIWVo3OEZsRFFXbDhaV0dRMEIzSHVWeVBSMzRIb21KRXRyY2pD?=
 =?utf-8?B?WFdEV1IxQ3RQU0ZBTXMwUnh2dWljRVpuVzFmRnVEQXZMZnRPTnZpQm10SXpP?=
 =?utf-8?B?Tnpid21ad1dldXFMeDRiRjdKRmVtQy9jS1JOKzZyaVZUYjlSTmdxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76F21E855BC8BD478BD1B728FE9D50F8@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: d-matrix.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF78E03B81B.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55430e2-ff87-474e-efb8-08df37e2c2ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2026 06:38:38.2520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 656d4e6f-3fcf-4ab1-80d1-71331c6f3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t98AwPMyZoHLqPJ1RFXLfvJnSMDPZabDOfhqbEjruwyGJoauNUp+VcsoXQevvAZZQ5Oz0oXfx9A6aaEsuJkUAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR22MB568684

VGhhbmtzLCBLcmlzLiBOb3RlZCBvbiB0aGUgbGlzdDsgbWFpbHRvOmR0cmFjZUBsaXN0cy5saW51
eC5kZXYgb25seSBmcm9tIG5vdyBvbi4NCkxvb2tpbmcgZm9yd2FyZCB0byB0aGUgZmlyc3Qgcm91
bmQgb2YgZmVlZGJhY2suDQpUaGFuayB5b3UsDQpFc2xhbQ0KDQrvu79PbiAxMC8zMC8yNiwgNDoy
NyBQTSwgIktyaXMgVmFuIEhlZXMiIDxrcmlzLnZhbi5oZWVzQG9yYWNsZS5jb20gPG1haWx0bzpr
cmlzLnZhbi5oZWVzQG9yYWNsZS5jb20+PiB3cm90ZToNCg0KSGksDQoNCg0KSnVzdCBhIHF1aWNr
IG1lc3NhZ2UgdGhhdCBJIGFtIHJldmlld2luZyB5b3VyIHBhdGNoZXMuIFRoYW5rIHlvdSBzbyBt
dWNoIGZvcg0KcG9zdGluZyB0aGVtLiBZb3UgZGVmaW5pdGVseSBpZGVudGlmaWVkIHNvbWUgZ2Vu
dWluZSBidWdzIGFuZCBwcm9wb3NlIHZlcnkNCmdvb2Qgc29sdXRpb25zIGZvciBmaXhpbmcgdGhl
bS4gSSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIGNvbnRyaWJ1dGluZyB0bw0KRFRyYWNlLg0KDQoN
ClBsZWFzZSB1c2UgdGhlIGR0cmFjZUBsaXN0cy5saW51eC5kZXYgPG1haWx0bzpkdHJhY2VAbGlz
dHMubGludXguZGV2PiBsaXN0IGdvaW5nIGZvcndhcmQgZm9yIGFsbCBwYXRjaGVzIGFuZA0KY29y
cmVzcG9uZGVuY2UsIGFzIHdlIGFyZSB1c2luZyB0aGF0IG9uZSBhcyB0aGUgcHJpbWFyeSBwdWJs
aWMgbWFpbGluZyBsaXN0DQpmb3IgRFRyYWNlLg0KDQoNClRoYW5rcywNCktyaXMNCg0KDQpPbiBT
dW4sIE9jdCAxOCwgMjAyNiBhdCAwMjo1MDowNkFNICswMDAwLCBFc2xhbSBBbG1vcnNoZHkgdmlh
IEI0IFJlbGF5IHdyb3RlOg0KPiBzdHJsZW4oKSBjb3BpZXMgaXRzIGFyZ3VtZW50IHRvIHRoZSBl
bmQgb2YgdGhlIHN0cmluZyB0YWJsZSBpbiB0aGUNCj4gc3RydGFiIG1hcCwgd2hpY2ggaXMgd2hl
cmUgdGhlIGJsb2NrIG9mIHplcm9zIGFuZCB0aGUgcmVhZC1vbmx5IGRhdGENCj4gaGF2ZSBsaXZl
ZCBzaW5jZSBjb21taXRzIGQ5ZDg2MmI2IGFuZCBlMTEwOThlMi4gU28gc3RybGVuKCkgb2YNCj4g
YW55dGhpbmcgbG9uZ2VyIHRoYW4gYSBmZXcgY2hhcmFjdGVycyBvdmVyd3JpdGVzIHRoZW0gZm9y
IHRoZSByZXN0IG9mDQo+IHRoZSBzZXNzaW9uOg0KPg0KPiAjIGR0cmFjZSAtcW4gJ0JFR0lOIHsg
QFtzdHJsZW4oInl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eSIpXSA9DQo+IGNvdW50KCk7IGV4
aXQoMCk7IH0nDQo+DQo+IDI3IDg3NTMxNjA5MTM0MDcyNzc0MzQNCj4NCj4gUGF0Y2ggMSBoYXMg
dGhlIGhpc3RvcnkgYW5kIHRoZSBvdGhlciBlZmZlY3RzLiBQYXRjaCAzIGlzIGhhcmRlbmluZw0K
PiBhbmQgY2FuIGJlIGRyb3BwZWQ6IGFmdGVyIHBhdGNoIDEgbm8gQlBGIGNvZGUgd3JpdGVzIHRv
IHN0cnRhYiwgYW5kDQo+IHBhdGNoIDMgaGFzIHRoZSB2ZXJpZmllciBlbmZvcmNlIHRoYXQuDQo+
DQo+IEdpdmluZyBzdHJsZW4oKSBpdHMgb3duIHNwYWNlIGJhY2sgaXMgYSBvbmUtbGluZSBhbHRl
cm5hdGl2ZToNCj4NCj4gLSBkdHAtPmR0X3Jvb2Zmc2V0ID0gUDJST1VORFVQKGR0cC0+ZHRfc3Ry
bGVuLCA4KTsNCj4gKyBkdHAtPmR0X3Jvb2Zmc2V0ID0gUDJST1VORFVQKGR0cC0+ZHRfc3RybGVu
ICsgc3Ryc2l6ZSArIDEsIDgpOw0KPg0KPiBJIGNob3NlIHRoZSB0ZW1wb3Jhcnkgc3RyaW5nIGJl
Y2F1c2UgaXQgbGVhdmVzIHN0cnRhYiB3aXRoIG5vIEJQRg0KPiB3cml0ZXIsIHdoaWNoIHBhdGNo
IDMgcmVsaWVzIG9uLCBhbmQgYmVjYXVzZSB3aXRoIHRoZSBvbmUtbGluZXIgYWxsDQo+IENQVXMg
d3JpdGUgdGhlIHNhbWUgc2NyYXRjaCBieXRlcy4gV2l0aCA4IHRocmVhZHMgY2FsbGluZyBnZXRw
cGlkKCkNCj4gdW5kZXIgYSBjbGF1c2UgZG9pbmcgZm91ciBzdHJsZW4oKSBvZiAyNTUgYnl0ZXMs
IHRoZSBvbmUtbGluZXIgcmFuIGF0DQo+IDMuMi0zLjdNIGNhbGxzL3MgYW5kIHBhdGNoIDEgYXQg
NS40LTUuNk0gKGJvdGggMS4yNk0gd2l0aCBvbmUgdGhyZWFkKS4NCj4gVGhlIGNvc3QgaXMgb25l
IG1vcmUgdGVtcG9yYXJ5IHN0cmluZyBoZWxkIGR1cmluZyB0aGUgY2FsbCwgYXMNCj4gc3RyY2hy
KCkgZG9lcy4gSGFwcHkgdG8gc2VuZCBhIHYyIHdpdGggdGhlIG9uZS1saW5lciBpZiB5b3UgcHJl
ZmVyLg0KPg0KPiBUZXN0ZWQgb24gZGV2ZWwgNjFmZWE2MjEsIHg4Nl82NCwgTGludXggNi44LiBP
dmVyIGZ1bmNzLywgYWdncy8sDQo+IGFzc29jcy8sIHZhcmlhYmxlcy8sIHByaW50YS8sIG11bHRp
YWdncy8sIGFycmF5cy8sIGNvZGVnZW4vIGFuZCBkaWYvDQo+ICg3NzggdGVzdHMpLCB0aGUgb25s
eSBjaGFuZ2UgZnJvbSBwYXRjaGVzIDEtMiBhbmQgMS0zIGlzIHRoZSB0d28gbmV3DQo+IHRlc3Rz
IHBhc3NpbmcuIFRoZXkgYWxzbyBmYWlsIHdpdGhvdXQgcGF0Y2ggMSBhbmQgcGFzcyB3aXRoIGl0
IG9uDQo+IGRldi1xdWV1ZSAwZTkzODcyZi4NCj4NCj4gLS0tDQo+IEVzbGFtIEFsbW9yc2hkeSAo
Myk6DQo+IFVzZSBhIHRlbXBvcmFyeSBzdHJpbmcgYXMgc2NyYXRjaCBzcGFjZSBmb3Igc3RybGVu
KCkNCj4gdGVzdDogc3RybGVuKCkgbXVzdCBub3Qgb3ZlcndyaXRlIHRoZSByb2RhdGEgb3IgdGhl
IHplcm9zDQo+IENyZWF0ZSB0aGUgc3RydGFiIG1hcCByZWFkLW9ubHkgZm9yIEJQRiBwcm9ncmFt
cw0KPg0KPiBicGYvc3RybGVuLmMgfCA0ICstDQo+IGxpYmR0cmFjZS9kdF9icGYuYyB8IDE5ICsr
KysrKy0tLQ0KPiBsaWJkdHJhY2UvZHRfY2cuYyB8IDEzICsrKysrLS0NCj4gdGVzdC91bml0dGVz
dC9mdW5jcy9zdHJsZW4vdHN0Lm5vLWNsb2JiZXItcm9kYXRhLmQgfCAzNyArKysrKysrKysrKysr
KysrKysNCj4gdGVzdC91bml0dGVzdC9mdW5jcy9zdHJsZW4vdHN0Lm5vLWNsb2JiZXItcm9kYXRh
LnIgfCAzICsrDQo+IHRlc3QvdW5pdHRlc3QvZnVuY3Mvc3RybGVuL3RzdC5uby1jbG9iYmVyLXpl
cm9zLmQgfCA0NSArKysrKysrKysrKysrKysrKysrKysrDQo+IHRlc3QvdW5pdHRlc3QvZnVuY3Mv
c3RybGVuL3RzdC5uby1jbG9iYmVyLXplcm9zLnIgfCA1ICsrKw0KPiA3IGZpbGVzIGNoYW5nZWQs
IDExNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0
OiA2MWZlYTYyMTE2MGVhNGI2MzAyODc0YzYyYTcyM2RhMTA1YjQ0ODgzDQo+IGNoYW5nZS1pZDog
MjAyNjEwMTgtYnVnMDEwLXN0cmxlbi1zdHJ0YWItMWM0ZTZjN2QyZDA2DQo+DQo+IEJlc3QgcmVn
YXJkcywNCj4gLS0NCj4gRXNsYW0gQWxtb3JzaGR5IDxlYWxtb3JzaGR5QGQtbWF0cml4LmFpIDxt
YWlsdG86ZWFsbW9yc2hkeUBkLW1hdHJpeC5haT4+DQo+DQoNCg0KDQo=
