Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198A194096
	for <dtrace@lists.linux.dev>; Sat,  8 Feb 2025 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739041651; cv=fail; b=lgTM596uLOQuG9sdCc8CWA5tdXhw2D75Ml53PcxzHSBeKruhyDtItbt6SQQ0+t0xM1yWJPGTRh8/if5q7g9rv2z62abWsL6qVf6cP3nYIxWm2KKLruG0fpkXqWGSvTrCcb1a+2augQlZxGnrDGD+yPyI2lC+VkE/kQEPyib2Mho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739041651; c=relaxed/simple;
	bh=sQKdVg0JIV69sSM6JzBqSErHtbCQA+CObJxOOlHkhwc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pk/FvC/Vdy4O9JPWE+yU/8Rw0iDZn4RmFc9plDtvco6GLWXwkVl1uvQOOaUbQwzRZXd3IknJhuYxLvgpsC2o8eD785e+i6tmwr4iHy0MLyQONz1FsxanMNYCDGu0GfDeLHsj9nx+K6fBk0CcFjv8ibfOJeeA+6MuB0wouxAsbhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y+3wMRhu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fmIs+BBs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y+3wMRhu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fmIs+BBs"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518DT1Sh017714
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 19:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=JWAgroAxRkSIajrOLJwLFG2Sf/qVXv/LdCHTRrO9I18=; b=
	Y+3wMRhuWYqpbZVqQsScLKaoYY8s0PjwvRhqiYYxNKHyxFXvsBUO2d5TLsxOSuFa
	dxSZ9yn1CVateO5saj5fQXtQQgox7gEZyx98ZSfeb0Wc5uyipjHYGIrFsNvW+C+S
	mBdQP9zI3reOpucdAm2zGEqFjO9/8t0e1bRSbKrA77yrBZta6BkoEhJ7u/3Va3yd
	sF/YEQQzn9xQFkHnG79xZRA+lHvCtZ4F+6F/Z7oMxwoYxMFGgoQSFwkE5SV70PZm
	OjNecfv7hexwRQFihx/urMsnaW/4wFOG+7WGGO25jV45BVwZ3zHyy+dJvRttnQLd
	2R1XKY6XNphxs+mZFIa+mA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0tg0erh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 19:07:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 518DrkBe038741
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 19:07:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq602es-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 19:07:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrSmvdjtWEvu4kg8c/FJHrGuLMxz7FPfm4vLdZzz5YC1wnEocALD5kRuz/R3vu+mMJsHhtk4vtaxynEXyb4rXjHoVJKZ77zatkby9Zf/PlJEwQi/jsFbEyV1sr9e7sNBt8lTxXTA7/c6e91MbuyQERcnk2a6xReA5wX/uoeD5gv7ZhXmBI64I8CP4skMjXVCT34TTdY9RHElW1TJw6JoVUGR3xe1vF1xY0B22RPdigM1yqN52dUcX8/IrQsMAWpahnmvSEKrJm12JsaJ6y70GvP1lVR53jf7Mb7omGvcVgOWqdUkMK1pW5gwHRVzXOyNU1t92WJrpPbQ5xRHquTS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWAgroAxRkSIajrOLJwLFG2Sf/qVXv/LdCHTRrO9I18=;
 b=nur8ZMAjjcpaqp0jCBuYKekcS0aP3Mswd7CMgVXo5tEKLN1iLAeDD54rX88o73Cfx4s/nsnqNOtAEiEUI3qGv7qfoM1wNLSEaCLLTm/olkW/luoBNjropOMYx7K7T33kBwIqWWwL3SdkZPCDP03OPCMzXhKkOorZNATWvpUUDqwQAnjpiTOSlJNWVtrh9ckM+sZfv1EUDS8VTdx85yvKPpz+7/j9llQF96TvAr3ZiBxoBL1a8AV2vbeL+dmpnAfCaVvv5nABpoKkuUa4xW98WD0WbTpgeMNYXwOdey4JwI+Jx81c8TP7kch5huRk0NyJWZX+lrvxxrnjMKDQGCJd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWAgroAxRkSIajrOLJwLFG2Sf/qVXv/LdCHTRrO9I18=;
 b=fmIs+BBsARuvGNvNQ3Jh7jSMZqt4OA/3NubkSe+gDXu/Wkz1fzshLqD2R29vxPPskEkD1JvJ3KpUo6wBqt1qq7CoRDZ8Poca6S68xUwbtxrMZOOrjxbJzNbk3X3eFkU84kKzyVaCL048bT8JC0OBn1nNw8mC0m39T+vlICTDm4c=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA1PR10MB6147.namprd10.prod.outlook.com (2603:10b6:208:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Sat, 8 Feb
 2025 19:07:24 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.8422.010; Sat, 8 Feb 2025
 19:07:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] test: Add test for predefined preprocessor definitions
Date: Sat,  8 Feb 2025 14:06:22 -0500
Message-Id: <20250208190622.23484-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250208190622.23484-1-eugene.loh@oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:408:94::36) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA1PR10MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: b71e0c57-eb1e-483e-eaab-08dd4873d25c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk5WdS9UbXEyd0hkOEFlK1d6L0lTY2EzcjRWc2swM0NNZndqeHc3WWg5SjU3?=
 =?utf-8?B?Z3dicnBaNGxpZWhGdjlTVE5qV1Zuc2hYOThraDl1dzd2SmNjTXltRmNnT1lv?=
 =?utf-8?B?L0pWTVhtT0NMVGxKZk4rMGJ2TDZXSUlmK3ZMaHNVUzhxVjI0Q1NnRGJwZmw2?=
 =?utf-8?B?MVJUaldxOFpXUGEvajlaMDZ1dk52dFh0WnZCMVlVTDhoVVF2QjRQV3VxZExH?=
 =?utf-8?B?Q0VMK1pvUlJ6SldLL1NtZVdjcXRHMklheXVrREkvcEkvVUN4KzhtVm9XWkdv?=
 =?utf-8?B?bDN3UVVDbDQwalBTL2RRR0paVUhOMEtZNStBSVNyRkxMbnZ3TDZ1VW52WUhN?=
 =?utf-8?B?bW1CSkJEeHJkR3FWWHNjbjNkWjcwdjU3eDg1bzNkd3U5WUROM0F0RDloNjds?=
 =?utf-8?B?R0NqSm83SFFGbmNjVnU5Z3RqYTdpclJZTE84NFlkN1V3Q3M2azFuVXFVMTBn?=
 =?utf-8?B?L3VmbnZGdnpJeHhLMzhVM1BrSnU5a0FIL3JOYU51d3p0NFhyZHVzL2tYM1Uy?=
 =?utf-8?B?dHhHY2FXMkU1RGRUZHlRSWlJVFNuS2gydm54MTc3eUV6OTB3SnhBQ3A3dG5U?=
 =?utf-8?B?MjVEckJ0NDVjUm5nREdVOG0zTVJ5d0wwd0xzVGE4WDB4eVZ5RWp5bU9yc2dV?=
 =?utf-8?B?aGFEVUFkeWkxU2lpVytydGFKbS9pQ3F3UUtzQ0pXUXIxc0lGZVFTTStwQ21x?=
 =?utf-8?B?MkF2VUdQS0pnN2lXTERzTlBzZG5TV0RIcllsZ20xRFlvbi9IUHZSYjZCSFVy?=
 =?utf-8?B?Vi9lVTF5UzFSZkwrN3NkMWlFS2t0RVNBTHlvZUNsditMcHlNdzdRVXJ6SmlT?=
 =?utf-8?B?L2c5bGRVYlNmTmIyTVI5amNTOWl3WWpsZFVSdTdGVitZWTM0ekllZDVOdnZ4?=
 =?utf-8?B?bG1CNXpXTGcxRGNibThmQkRQc0ZEaXRVNWJibE14SnNTaFNBZWh1UFkyaWtS?=
 =?utf-8?B?aTNaTXpqNjZPaXZ2YStYN3VKTmlreFRrZnFjY3NoakNWWUFhUDZ2N05OeWQr?=
 =?utf-8?B?emxtbUtyNjRjNVBCYXNiTVBMejRIS0xZcDNIS1JtNkNYRXByMGgwaHZha3VT?=
 =?utf-8?B?eWZwbWNubEErbFJ4bjE2em9lZmtvcDhLVWk5NG1EcEhjSnNsUU5VdkttUHQy?=
 =?utf-8?B?SHR0TkJRLzZTaUgvbDNYczhWSGczZmZTdG4wQVg3eTBnUzZMM2RjdzF4TCtJ?=
 =?utf-8?B?cVZyeloyY2R5ZjdVV3A4SVdoWkN5RkZ3cjFuKzNZRVlnR1dRQXRPOGVNeUVP?=
 =?utf-8?B?RU1HaTFaWTA0QXJRNTBHb0U3Z21KUnFtVWdiLzRVTU9SaS9XdHk5Y1RPckQv?=
 =?utf-8?B?RjZXNVJSQjVWbjFLOHlid3BrazNrOU5pM01UaXBNYkJsbEloZUphZFkzUUpo?=
 =?utf-8?B?WHNlMDZ2eWtJSkY5OU0yZ3lPUDh4dnFyQ1ArQjFRakdiaXBQRS9wSGxsb2Jr?=
 =?utf-8?B?QXFkbC9jb0RjM0x5UGtsK1gyaWFEaUR3WVk1bkV5TmFLOEdnRER4TDdTMlRP?=
 =?utf-8?B?VklMTHZ0QkpyWGFJRXJ3eTRhL3gzeU1KNkxZM2hBbTVzUld0YVc1YnVTV0Y3?=
 =?utf-8?B?bE9QYTlEaWVyQjdjL0JGdTZKVmNGUDhsWUltR1h0UGRKOUJNZHBmV1U4U2NO?=
 =?utf-8?B?NEZvZUtUQktwV01BUFhoWEJRL2tuMGg4ZEYvaU94Z3E3WWFnUjF1YU1nQlFm?=
 =?utf-8?B?VWEweEhqRjFuWVc0ZFAyZXB5WkEwaXFZc1U1dVo2c2lJNXFqYkNHWjFpUnpI?=
 =?utf-8?B?dFFqM2dMbDlmZEo3L0FOVUduNzU2dHRHZ2lFWWUyWUpueDF0dm5zalhObkVC?=
 =?utf-8?B?WGtwcXlac0tGR3ZMeWZUZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1JaMFF4UE95YlE3ejA3V3RUMTVrcWhOT1JCc2JSRDZaeUs1UnZIYkt6eS9w?=
 =?utf-8?B?ejBicGZRWnJKanVwekgweUV3S0U2Mjc2L1o5amZnSC94NGFMMkRZc1JYdXFr?=
 =?utf-8?B?eG8vV2pxV0NGM3dUOE9FQ20vSiszcFhhQllVRnJhMnV2bjNKVDNsOVJVTHY2?=
 =?utf-8?B?M2RzanVvd0VVd1FhS1NzeSs5WVdpRnQ0a2ppWE52eFB4MDlNMm9mMzZhMUZE?=
 =?utf-8?B?eVV0UXZRNWU1aUVoemFHZDJSbW1Kek1JeGJTd0gvalI1TFBxVlowenozVytR?=
 =?utf-8?B?QlZ0ek9tOE9wMmQrR2NpUXREdUJyMy8zT3BwK2ZVOWNwb1ZuRTNsOEpsN3Z0?=
 =?utf-8?B?Sk96dkowMkJMRWx5Y3FjVlJaSEhxTlUwMGx2OHl3TzZGaTNCbTZqb2tZM3Bi?=
 =?utf-8?B?clc3Yzh3cFFuOUdFUHhMaUZHNkFJRTJySGo2L3VxS2FYVlJmWDFaNk9xWGxQ?=
 =?utf-8?B?OG1ZM2NaS21KZko0Vk04Q0hnREJkakl3aS9keHkySUdaU2xVanM3L1ZwaXp2?=
 =?utf-8?B?OTd5TWxQVjF1SDBzWGd2K1hsTFIycU1iZzNZVFZHZGorYVBDYmxyWDlYZG9J?=
 =?utf-8?B?NUs4WGhKUjlDUzVLOGx6akgyRGE2ZjBLMDN4YlZ5ekNVQ1hBdTA5TFl3OU1K?=
 =?utf-8?B?ZGJRVFFzNUUwaVNodlJpdkpMS3ZKN3l1L2tXeENGRWozYkhMRE1pZUY2NEZM?=
 =?utf-8?B?NklTeVRYUTJJdmxSTGo0QVBzaVhIQXNleVlzbFhYUVNOc2xlNEZFUkNiQTFD?=
 =?utf-8?B?ZGsxVmpPbGlXTmVMYXBYeFgwdkFwS1d5WUlFdDZWbEd0OUhJaExBamVnTmhK?=
 =?utf-8?B?R3VsVnBvaENhTll2azA0U0ZyMFhnbGIya2c4RUxqa2xCZEtsUmNWYURsWmlO?=
 =?utf-8?B?NEdPRkJJYTU0VFRoV2tlK1g1ZHc0RDhrT0ZacE50TUJHUDNBZ2FsNzlLU3RK?=
 =?utf-8?B?eG56aVVCU1RNN1dsbzVicUdpRm01YTdzeVM3OFBlazVDWHk5S3I0YXY2ZnNC?=
 =?utf-8?B?TzJEUFNOYXhQQWd4a0xPV2RSY3BySGdDbE9jWXBDU0tLQWlCbDMrWjY5RU1Y?=
 =?utf-8?B?aWVPWVFhdzloVm43MlFWT1hGVGRvQ3UyR045WjFMdlE4QmdYQ2RuOUZUT3p1?=
 =?utf-8?B?NlA4cm5EeEFhNVBJTXdpUnQxdlYvaFJOUWhPNjg2Ym1ncjBtTDQrWTU1NG90?=
 =?utf-8?B?SWtXb0Jqd3VXM0pOTFp5WXAxblZEbmlhWmJVV2JMTnorQWZhd3dJUlp3WDJ3?=
 =?utf-8?B?allxOFpsN0FHaGVneTQ0SEUxK2tybDZRQkdNVlJnSSs1c2tZNTVRWEJMQ3Ni?=
 =?utf-8?B?eGI5SE8wSTRWOVZzcVNQTC94ek9BRVNhb1o3L3JQNkxtOFFLSlh3RGhWUzNk?=
 =?utf-8?B?QXQyQ2FMeDRYaCtYT3dlNzJzeG5jY2MzeE9LZU5WY0FKdlBzVHlaL1FuRTJH?=
 =?utf-8?B?OTJUdS9oTGV0YXVQSlpJdjlMTWhaRlB2MktET1lLam56UEp2anQ5eEVRblcz?=
 =?utf-8?B?aVlnWDFqSWZSK1dWOXI5b0ZqS1l2RitVVFVYdnRTSXpyemtwdmZESzFmNDNp?=
 =?utf-8?B?eXhSMmVIeW4zMzllYTJ1cXhpZW9DcjZjVFlTeU11NDFsMGtCUUpiSlorZFBn?=
 =?utf-8?B?bCtSMCtKSHdleEpxYkZFbWJCVnZhdXJLWkMzMnZnb0FSWWVuUnJlazBBMUR5?=
 =?utf-8?B?SDBLek5PYzNZWGNQUVpHSDBTRkNoYVNUbkY0ZW9oaEJ6d2VpdXp2M295Tm0r?=
 =?utf-8?B?U2psM1B5d2Jvb3ZlMnpialo2NHhDMGJVcmM0QkVoUGFqL3hSM2J0QkdKTmNj?=
 =?utf-8?B?T1NFZFNlbGxNODdma3UxUHZxZy80SlYvZUZkd3lmeWlNSXRqaXRraFI4UkZW?=
 =?utf-8?B?UzYyb2dmRTE4VzZBZmU4cklNbWZBaGUwejFDdlk1TGhSb0QzWjkxQXBoVGx3?=
 =?utf-8?B?UENPUFpSRnpSMjl0aUhlQ3V6TzhHV0QyVnRjVWppTjVhTFA2M1FNUUpUVC9y?=
 =?utf-8?B?N2V6V0FpU1ZpL1IvdHM4Sk1odFB5VE9ORE5ranJnV1VUaVJDZ1REM3QveFQy?=
 =?utf-8?B?ZkVZMzdQU0kxY3o4cjlvT0tldVFHSDRLakdWRVZ1VzJzTUdHZUMzVkdKN255?=
 =?utf-8?Q?2tPzGvA67p3CNR+zxemUe5hwj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	voyHALuYI3Ub/7zZ76XqdLJwWbuLA2fOpN1Rl8r+dYmPCDrvP4/yI/H1sQY8zDZguL1yN/WOYzyy4bApfeifEiNWe2RrcGLbTbgZ1XcFq04L+77E3f3bL/F9x7AjN8h/xSg7uYVGdConMX/Bc2dnTHX1Gn9oeQ9QU1zJj7lCX3Np6/GjgM0rF8yOstDSaEbfuni1drBaXAxjdY4S4GrgYIFa5SlVVj+dVm5Rhz0c24u52/CqMKFqhXN+y3P3bdQyzxEvnRYcsPY9NpM8UU9V1wLuoIWFEqZC66gzK188SjtA/qjXPCSl2V/TbIg4CgManBZCluAaarUlic2KvBwQ5rNCIXCsNGIcTkl+zfaLhPnfIuF7GN4siXfGeg+yMwRT9LDLDYoEBzNOh9VDez/3ISZKuoo0K9P5wyUGSDOCj3UQzHHdReoQ9LB5b1GYbCnL3WqyERlqQeu6IwMp3uTx3MSmm79Y8Re7Fxf98kl6ZfyPc5UucuvdMoz4xoV0sWTV8FIFqC0X+ycqHHLqYShuai0jANtaZJzCpcMvXhl72aP3cIB9VBI8TEW1qSBtFFH+i2qqVzazA/pn6P2Aw6CcobzhW6xKS4rC5V/AMU0jNfs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b71e0c57-eb1e-483e-eaab-08dd4873d25c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 19:07:24.6802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzhyRoeZ43N6ZqKh0CGqi3uYAKQwiiI3IfJLu/aOQwNYvJk3+gM25VVBGa9t4f45bonRj28L7bDVNViiNlKMUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080162
X-Proofpoint-GUID: llvt7sNX29GY74nQrDo30l6mlxU5xW2t
X-Proofpoint-ORIG-GUID: llvt7sNX29GY74nQrDo30l6mlxU5xW2t

From: Eugene Loh <eugene.loh@oracle.com>

Orabug: 28763074
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 COMMANDLINE-OPTIONS                          |  10 +-
 test/unittest/preprocessor/tst.predefined.r  |   1 +
 test/unittest/preprocessor/tst.predefined.sh | 119 +++++++++++++++++++
 3 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 test/unittest/preprocessor/tst.predefined.r
 create mode 100755 test/unittest/preprocessor/tst.predefined.sh

diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
index 40561af91..73be89b1f 100644
--- a/COMMANDLINE-OPTIONS
+++ b/COMMANDLINE-OPTIONS
@@ -321,12 +321,12 @@ definitions are always specified and valid in all modes:
     * __sparcv9 (on SPARC® systems only when 64–bit programs are compiled)
     * __i386 (on x86 systems only when 32–bit programs are compiled)
     * __amd64 (on x86 systems only when 64–bit programs are compiled)
-    * _`uname -s` (for example, __Linux)
+    * __`uname -s` (for example, __Linux)
     * __SUNW_D=1
-    * _SUNW_D_VERSION=0x_MMmmmuuu (where MM is the Major release value
-      in hexadecimal, mmm is the Minor release value in hexadecimal,
-      and uuu is the Micro release value in hexadecimal; see Chapter
-      41, Versioning for more information about DTrace versioning)
+    * _SUNW_D_VERSION=(MM << 24 | mmm << 12 | uuu), where
+      MM is the Major release value
+      mmm is the Minor release value
+      uuu is the Micro release value
 
 -Z
 Permit probe descriptions that match zero probes. If the -Z option is
diff --git a/test/unittest/preprocessor/tst.predefined.r b/test/unittest/preprocessor/tst.predefined.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/preprocessor/tst.predefined.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/preprocessor/tst.predefined.sh b/test/unittest/preprocessor/tst.predefined.sh
new file mode 100755
index 000000000..79caf17ac
--- /dev/null
+++ b/test/unittest/preprocessor/tst.predefined.sh
@@ -0,0 +1,119 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Confirm preprocessor pre-definitions.
+
+dtrace=$1
+
+DIRNAME=$tmpdir/predefined.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Arg 1 is macro that we check is defined.
+
+function check_defined() {
+	# Add to script: #ifdef is okay, else is ERROR.
+	echo '#ifdef' $1                         >> D.d
+	echo 'printf("'$1' okay\n");'            >> D.d
+	echo '#else'                             >> D.d
+	echo 'printf("ERROR!  missing '$1'\n");' >> D.d
+	echo '#endif'                            >> D.d
+
+	# Add to check file: expect "okay" message.
+	echo $1 okay                             >> chk.txt
+}
+
+# Arg 1 is macro whose value we check to be arg 2.
+
+function check_value() {
+	# Add to script: print value.
+	echo 'printf("'$1'=%x\n", '$1');'        >> D.d
+
+	# Add to check file: expected value.
+	echo $1=$2                               >> chk.txt
+}
+
+# Arg 1 is macro that we check is not defined.
+
+function check_undef() {
+	# Add to script: #ifdef is ERROR, else is okay.
+	echo '#ifdef' $1                         >> D.d
+	echo 'printf("ERROR!  found '$1'\n");'   >> D.d
+	echo '#else'                             >> D.d
+	echo 'printf("missing '$1' is okay\n");' >> D.d
+	echo '#endif'                            >> D.d
+
+	# Add to check file: expect "okay" message.
+	echo missing $1 is okay                  >> chk.txt
+}
+
+# Construct version string (major, minor, micro).
+
+read MM mmm uuu <<< `dtrace -vV | awk '/^This is DTrace / { gsub("\\\.", " "); print $(NF-2), $(NF-1), $NF }'`
+vers=`printf "%x" $(($MM << 24 | $mmm << 12 | $uuu))`
+
+# Start setting up the D script.
+
+echo 'BEGIN {' > D.d
+
+# Check for the preprocessor definitions of COMMANDLINE-OPTIONS.
+
+check_defined __linux
+check_defined __unix
+check_defined __SVR4
+if [ `uname -m` == x86_64 ]; then
+check_defined __amd64
+else
+check_undef   __amd64
+fi
+check_defined __`uname -s`
+check_value   __SUNW_D 1
+check_value   __SUNW_D_VERSION $vers
+
+# Confirm other preprocessor definitions.
+
+check_defined __SUNW_D_64
+
+# Confirm that __GNUC__ is not present.
+
+check_undef __GNUC__
+
+# Finish setting up the D script.
+
+echo 'exit(0); }' >> D.d
+echo              >> chk.txt
+
+# Run the D script.
+
+$dtrace $dt_flags -qCs D.d -o out.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: DTrace failed
+	echo "==== D.d"
+	cat        D.d
+	echo "==== out.txt"
+	cat        out.txt
+	exit 1
+fi
+
+# Check.
+
+if ! diff -q chk.txt out.txt; then
+	echo ERROR output disagrees
+	echo === expect ===
+	cat chk.txt
+	echo === actual ===
+	cat out.txt
+	echo === diff ===
+	diff chk.txt out.txt
+	exit 1
+fi
+
+# Indicate success.
+
+echo success
+
+exit 0
-- 
2.43.5

