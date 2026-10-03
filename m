Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA2380FD6
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016900; cv=fail; b=njbfGFhc0oDyU9YEq95FX8qwg/pO0n2Ay++VN3kAQx/mSPu0GlRzOAJ8y+GFKfpaB1qW5tYLKoXH6+sSDk4RIemyaDzXs44oREqMqXYgs4sWPR3tY/T4C3EeL1cLq8qn+tYdEkUHS8rr7SXwOXbQYe/056neyvKAWgFIncdrLEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016900; c=relaxed/simple;
	bh=GvIi4BJZ93+bnsQQ1zJgs1rVctOTmZvviUYLCs3CsEw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gZHwc6PwtrCX9kZR80SeR+wigrdcw+4AYXoet7ajRw8sUZIHXnCCQzWOeWBdO6zoJFaM4v3MVm3Cve3DdgXAASUeMvkvxXdxQAQ6K/vT57zqFDmckbK0xGjXALbG+9v42r0pSOwNGuP57ytKtWcIVt9EG9JseskM+pl0kbl9g7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eS7fACt3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oX+8qToz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eS7fACt3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oX+8qToz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6938JLBF1621100
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=yNh3ySfBVa9IusZxLaL0bYf1mvxB8iLUP6a6LseQIns=; b=
	eS7fACt3IQjNqc5mQ02wZxaDVfpUVx+z8Be02hg9RAXZOmlZfiwBi4lXUbRfiAN8
	snc6oHtMVu9xc0YEJj63GIw4gFCYx6ckChHrS6jN4pZ8gpKiDDr1WHLizt80ydNo
	bEoF39Oe/4by9PLwgb6kCizIJ2dTRZ87w76cmwxi/abPVc6ebHSWkTAQ2PF3W19H
	PDYDM6rLorrCHoxdYfzRP1fLT06J9ekiS2qKOW9WciHwyNzaQ+pZjwj/ZZNwNbkD
	uriqQqZ81bCN5rfm3jcov9B7Z7GfNLSvGNfYA4ssBif19WfsJfWi68QknVmKKycB
	h7uOV5XbNGAstaje4N2cZg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2rm984xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:41:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938ZIi3034832
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:41:37 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r5k6djy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:41:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLDEDHoSi6fpEPbzwk+0ycyC8lm3q3WKuOjGx677bC8quw+p+NHBSZM6G42OqGSgOzFsn6TcMgSbNiK4KjysgIW3oNpbdtCSC0md8npgo7C8OLyZDqIe0pWNKVVO6NbC8dWcJcmzbHVKqTmX4VzypHWZIIn61/4p5EBYMCRUjY5mkUnA9+Z37tJW7GVKjsuZBeBHtIRpzzmNU7fMuXpexEadoJfJ0rmT5VXpQoyMoZb2ce7rsyG8cHgCY9oiU9yaUZ94OoDkQV/fKpMhG0RHIpdmEel6RBaJ2rtD8w2t9TlLRy42StrPVsJMoOxsVO633+3eaViFamlNnQijpmyjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNh3ySfBVa9IusZxLaL0bYf1mvxB8iLUP6a6LseQIns=;
 b=OuminR0p5qXXBKROI7vUall8sxaovZfHkO+3lRcRZxEueHVuyAnJMAHX1mNtb2InARV8q1j06/8zZyZyJBm7w2tH13Mv2fg/wmWsY5B0vxLPw3uJGzUFcywyWtfYR70OUSAx76l4IhHtHecy91yfT0HeJ7p2q6NQRsMoYVa9V85cNiZpacpLCQTrELSuolhsuf2XOuYXqel7IuOeAyXgL10zFGvaFMsrYfZHATrUDpH2gUFNXMWtBi0zyMyTGotAXGdCDw8L+2CIGYYe2riu1P11zTcsGEveDBfQK6pY+Eb2G0jKveCKWdtAtzh411w9ce6ZNvd/YaBA9P6khiB5ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNh3ySfBVa9IusZxLaL0bYf1mvxB8iLUP6a6LseQIns=;
 b=oX+8qTozZpkHqNPdNqHb9ssQSOe5SYoTqVtzyaL9z2f1rLWX303tG2Ci3hBnd3uLaPWiqlGLF/KV8RjEaHmEfHJDFotgoaUT63AOoe3Roep1gCNrQkm72+dAzpVOWQhBfpV8CmI+M+k5syyqPCOCC8SL7tmBXlDGP4qopH7XPGE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:41:32 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:41:32 +0000
Message-ID: <938ccc5e-a843-4d83-a844-0eeb4db58e50@oracle.com>
Date: Sat, 3 Oct 2026 02:41:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 6/8] runtest: ignore BPF verification time
 differences
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <0cdf77bffce3b7976091e81c515d8c80@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <0cdf77bffce3b7976091e81c515d8c80@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0110.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::39) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4104056a-e248-4f0a-7406-08df212a204b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HcDlgQLHJjwYRvCAHF8dJCeW04ykgH17eg/V8uptqTNQnwRmDptGatZHoJdGI0VuYGhqvJYBVMd7GRbe3J+LZqh7hU9tqnxLW/vb6LroRkRN+GKoFnEBH3o8i9B5bdndD/4wdvK5EtscDxnzduJ7MIogxfBqXjPX/F/nahCxY7XNWeovczjHJuvgbIkgcmzm8EUrYysA+3Vk7m+wb8NYo9nyJyQSTp0+c3SQgT/Rsmd/E+2J4ct9xGE7pJZcJjg7KjjkhFTOVbRCkiPAWCLSPk9uvt/sHSHWin3RS71DVo/f20viaLBaNkpUYjQ3c7xxxe8Veg44UTCp1qTrR5MECzERBP15inbQySLez5l1sGHETQ7oiP966dTxDwMIjKyrnGu/TEykWQTx96yCo+d9Hfy/Dq5pB4VZGXwcuGeXghGBq5ddCyjP+W3odqw5G4K61EdQTt/P9Lfw/dcbZG2LK20VX84tcySPvi3n43ipX/kiMVQa0Ck9PMHMeP72wdPNyytvvDJJZwq61rk+WnWzGZNDZKbxLz2Ut4MGbKBqRQcjr7sGSkIcdqPPkB8+hMVGFPR2N30o9si38K37IiqyWbWRxdfn+e/EPxw/WFUzGRDRSAftZUltcy/+dJgNnoORgLrD17Ql++E4aOltjqqRoO9mqko0GLUOkH9jv7Djj2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmJ0eU9tZ0FLbWdIZXNmUG9NLzJrM1ByL3N2OHBMUUhiT2hYSmwyc1hNUm9q?=
 =?utf-8?B?R1BQYXF1VWdQRXlkb0hWelFxZDdvVmpUYVVBT0RTSDB0ZmxvRjQ0NTdYY3pG?=
 =?utf-8?B?ZzJ0VWFxM1NpNmt5THRJTW1KenUrVzNMeE5qZk90KzltV2JyWnRjTVMrYzFN?=
 =?utf-8?B?b2x3NW5ncDdFTkd0OFR6OWV2bDhLcDN5bU5IV25MTk9GZ2w5Wk9DNUFxZjdx?=
 =?utf-8?B?a0l5RHdSTm16Sm1uVlEzbTd1Y2pEN0VIS2RSWWpremV4TU1uSGM4ZE1xNVBv?=
 =?utf-8?B?VSs4QzBiZk5Jcy9wbUJUSklLUkoxUGZ1c1hObGQycG13MGZwL1hzdlN5SUJU?=
 =?utf-8?B?Y1R3SDYvRHdBMGNjdWFoNVJaZEs4ejZ3TGV5bWtVbURiUWZqbGhqTytnNzR3?=
 =?utf-8?B?V3YyUHJEWHRSdTgycHQ5RFNzY0tPeXVqSzJ6VjFwY2NuM2Y0aUxHT3JNeSt4?=
 =?utf-8?B?T1RycFRrMHgwbElBSXcrYVNvQzlyQVJzYzA2a01IMDFWbHN6dVE4TDJYZEtj?=
 =?utf-8?B?NDFaeTUya05YNStUWlZqUmZVTmxIRCtDM1BtUGM0bmF6YWRHcGJWcFdXZUFs?=
 =?utf-8?B?RlFZbzBtN0VnOU1mcjhQRUFjQmZVVURCWnpyNW52clJTWHQwU2w1RFdSL3Zw?=
 =?utf-8?B?TVVjL0V0aW1zd0xCbUZHWHpVWmRObkRlYlF5WHUrbXNpMitjcGoycGVxNXUz?=
 =?utf-8?B?SyszOTA3ZnBsa2dEem9Hcmk1MzZEeDl2Ni83U2JEVFU1c0JmRTh2RGdzSDlK?=
 =?utf-8?B?RWl3QU9VZ2lQNS9Xc0Z1ZkNRLzV6OE01dUpCVURhZk13N0pmQUNVRUVJOVll?=
 =?utf-8?B?WWc3RTFYekorKzdpdmtpNTlsTVBpY0dJR1V0MVhpNmhNdXRCdmtHNjUwRy9z?=
 =?utf-8?B?aE1CdG44Y2tyVzRWK2J6OXVpcFlVSkI3SSs5UVZBd0JnblR4QVJyMllHWE1s?=
 =?utf-8?B?b3BMaysvNEprMFFoYW9YTXBTY0V5TGJ6TlpCc0RxN2RjY1p6eUhFOFVKeDNB?=
 =?utf-8?B?eVZhNlU1VU16cEtrVGpsaGZzVTFxeGlmVldvM29ydHd1VlFpQnRCay9uWTVi?=
 =?utf-8?B?WUdSQzNQMEF6U0xzTklrWGJOUE9PdmkxckRPa3dKVFhKUkswRTgzVTJjc2Jo?=
 =?utf-8?B?MFk3dkRDdWM3Wm12Tys3QUZNak9Makg0NFI2QUUxUHg1WlVXS1oyOXVCWmZ4?=
 =?utf-8?B?Z1ZBS3VXMWd3dkNraENNRDV5M21jb294dURCSWpLVFVhaGYzeWwzNXhia3VT?=
 =?utf-8?B?K1Z3Mm8wQ0l1dzQ0Tkl5RjdaYUR3b0RSaEhwdnFaM1RsdjZwaml1Qm8xZDBm?=
 =?utf-8?B?elRCVEVsWGJTUUNSY1RRdHR0ZkJRL3NHazcydTRIMTFaSE9JcTI3NXRSTjNB?=
 =?utf-8?B?L1BsUTEwbUswcmZPY01FTjZVTlY4a0NwUFBQeEh1ek50YUdIN2E1WWlzVm9T?=
 =?utf-8?B?T0lzbmN5aFJmcmRIUEZJL0I3b012bk1yaElUOWlBSDhFRy9TWUMyK2lHLy82?=
 =?utf-8?B?a0NhQ1E4QW8zNk9hTFM1QjBuNFQ3WjZremVhYTdqeExiaXZmT09PenZQY2dV?=
 =?utf-8?B?cjlKejUyeFlzRzdFYUhSSVB0TW4zY0RQYVRUcDk0L0pPVmhoT2hsY2d2NXNw?=
 =?utf-8?B?Zk56ck0yejBEbVRYMFVPUXhlVVozS0Z3ck92WFhRNWRMMjdsNWxHeDE4L3o1?=
 =?utf-8?B?ZUovWjNMQnBScllNbE8xaVROZW14MXpER2hIUVZYUjJsMkVzQnFMYWFWa2hz?=
 =?utf-8?B?d28reWl4dCtyazV1dHR4dVBRMDI0enJaazdLSnJKMUlQd2JDQnFGWDd2WkpV?=
 =?utf-8?B?Y3NzRzZ6UDJLYm9NWXF3akZLNXdjRXNERTYrcDdKNExMOFBlazczTk9PdjFp?=
 =?utf-8?B?OWtrVFN6WDhiaUUrMEcxVUhJbUZKTTNXTCtOeWNubkFUVEpmaFhOcy9saHN3?=
 =?utf-8?B?QWZyYmh4eXg1aWtQelRWVmZpb3ZmQkpvTXF4NW1Rb1NkSGxBR0FaNk40NTJS?=
 =?utf-8?B?Uk5nUW4wSkpoV2ZJM002bXRXUEhwbFZENU1Jd2JPQWtKVm5FMU9EMWJkRGM2?=
 =?utf-8?B?WE1lcHdsOS91NVJUNnVzTW85c0V4VU1sNXRpcHNoZ3B6S2QzR3hJZVFBK1Zy?=
 =?utf-8?B?ZDJqQVJPbEdaV3NqRlFLZFh3UmhrLzJFL3YzQUJBcHlSWDNPeHNHS0RKVGFB?=
 =?utf-8?B?c1p2b25LMUFaekwvcFFsTWJ6NFBsQjZibk53ckRvemNWTjFwcEJoem9UVStD?=
 =?utf-8?B?b0pYRkNzWElLYnR2aVB4c0drL1dqT1k2VkZ6aVlpNEY4UWVBSWRJcVBOeEM3?=
 =?utf-8?B?UWNrU2Z6N3o2K1grY0pUcGhVSjNQSDJQK0tmcHpyREVhMkcvWmtVNDFQT3Vt?=
 =?utf-8?Q?CnIuuTjUXxJXpp/Y=3D?=
X-Exchange-RoutingPolicyChecked:
	a9lCaB3srJstDkH1HB2p4a7ebIo6AhdhZKYg+D41YdsN8wGMW815ZBcPezI0u3MywQycGSnWm70JZLvS2a9rBKl/YFKZrpoIxK3LhbpSPtfCuOIKZMwLA2lIMt6hd6v6Yc/UsJBwdX9c7P9KLdev+27s9K2Fy4qpkpWvH+ZnlDYb8SxOrR9pJa1WF26vHMrdoTxP8eDG62pRIzpEYzN5yo2pGZCWD2F3kicnLGNpAnzuKhtn7LKJGimOt7xxaHM5HnFP5dSfHHywq5zHof9DIWU8Oz/RsTY3eXbKZIrwVK2fybFXGPBTN1kS9wKzK1igKnS8UNkOiy7vOUYf37zj5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nipPAm8zPf1fIkhgZsfaXy9l37X1Gp6mEdeILUo8afhBN3/4dv8EgfgliPK/a0MimVLdRTt2lDmlxtdFHC7KlYS/HIQfPGT4KftIzLUuGAn5PQPDiHk2QNFeWHDgPoRoJo+nnzHZztEd76uoPjVRconzsvZ4pgB325+T2KgM/318nmGKCHRkhFCc49bm8Btop6roCDmzBS4T/Mfvvi7N6bOr2VHBXrOadjekCOS/MeAtr9kXp84LzfMttlfBm/HTRDmCqW40pN/RTkNHiolNrrist+audSYXMuH8FII9MxMyG7pHVcu/CtQokrljac3Teit14qc1lxUvSXRD5d3uLLrwv6V+FI6csz0TMHd/gYcoQ5KaueLEFTJdfVcK0sOebmfGgane6p5o9A82bG7mVSpDZPIecTIpkHA2f7Zk9aw8VW1+p1ZI3vdigR/b023tH9thfdhvz41qSZZtXxtcq1ii/uhlWwIZUHDlls5dJj5LvmQxT5SZEhDQVVTjf4lFPOxmjaIjpa5MKbYWvJYSrLI8NORMPXttWbqQuP+AyBWqUbK5I7uUk+PgWaJb9qqAMnbRMpa4ejY+ixszpXyP9T0mxA6VCJq3AMrAkxd356A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4104056a-e248-4f0a-7406-08df212a204b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:41:32.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4HvbOPNTrgWwjclRoI7SOfmE51CVKav6lehfP7JPQYeN8wIgawTXK81sbuLTAipKKznk//4oExRRddRJZVbv3kpDWuUZnqHmUaCLR+pw04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2610030034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX/piTyNE/kKCG
 hmT5o0hdyl0oe2vnlzwuTXLbdd3AUAhEGwnQEZoTSY19Ob2vGAmszleAsXv8hdZ747GF3dnDsCm
 UbpgVBiBdTEjSWhfo/mp2tZUXGQXASxLDUTM/aGELgwmovIS94smQs067p0Hb6cQ7k0bFBjXdPb
 z9vZ593tAgAnroqiaxQCHbaeBhwv7qUUXfiZVQiKlKSef/wGE29Bim+efo/1c/GzKfeGYksF8DR
 DtV3Db3HAcTsdF2/POuUo8Gofqp0KaZMXn/kRslIYEk8MvUgjKcEy3r5Ah8DtTiar16BeUqgRa5
 5kq9oc8/ujQ+4M3+75Goe9ez5GFOEO1BcOqML+Y4G4w/nO2sS4cZeqUVsCQmRMj+ZDsaed3Q1Pg
 1A1mAP5o6IKL1kEb9LeijJguZeJZznj5cBuXPiK1e5VByZVmrWAB7ZuD1NCAe2FGVT6gMhwDve4
 bFMGQ6pK49fHiTdhmnlLVhd7Bb0yIYHmtSNk5R24=
X-Authority-Analysis: v=2.4 cv=QMD91QLL c=1 sm=1 tr=0 ts=6ac0bfc2 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=KtWhpml6NpAU_BQSLVkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13537
X-Proofpoint-ORIG-GUID: IZAbxm9N1hkTAHNiU-sZHCUWNfobzx-o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX5jxn3de31/Tu
 BuMg59jxNC3lQ0vTbcDVOxQgLU4ydodJAgYxAnnHVdp/+SM9QlAHUNoKDuNqFjfHVZmKM99XGKd
 Jo49vYxiDQNrB+B42Dxam2DQAhy8eCoeiieartSghGSlk+J7FPXj
X-Proofpoint-GUID: IZAbxm9N1hkTAHNiU-sZHCUWNfobzx-o


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 12:02 PM, Kris Van Hees via DTrace-devel wrote:

> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  runtest.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/runtest.sh b/runtest.sh
> index 9f06a499..836613f8 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -510,6 +510,7 @@ postprocess()
>      # values which are not continuously variable.
>  
>      sed -e '/^==[0-9][0-9]*== /!s,0x[0-9a-f][0-9a-f]*,{ptr},g' \
> +	-e '/^BPF: verification time /d' \
>  	-e 's,at BPF pc [1-9][0-9]*,at BPF pc NNN,' < $tmpdir/pp.out > $final
>  
>      return $retval
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

