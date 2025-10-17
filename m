Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61820296BCF
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722376; cv=fail; b=fV2aYLROY3mxDc40C828kyerwpp+NSnG2caQxwwvydAd95nzvyaZG/m416d8KFw8EZSbGWxRkc7oQUa+AL7y9yCCbjOT5txI/OrXFczyxvBACEHyvi7ZF76ew/GDt/DtTJ7emCJBeeby81v/XTTvZpzrmivcCyleDBW0daSGt7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722376; c=relaxed/simple;
	bh=m70xPOxO3Nc/rpNmwwPIsj2AJDNSUea9iR/jAZJEI78=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A1VMWVsdMast6mzAmPp5rPsWkXIk1CW+LWjU1juJMZl1Idot+2Nsvgny7oQGhf7Dxx6Ku1nCD+ZjxNPjTuw2iUhMjznQjO/oBQqjLNmPjNrY7KYSwyTx3TFNPlJA6cSiBYLyraMsX8BM4lXKKpAIb9xBUW1cl+kfsRglJo1NJGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DO0doCss; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jyKjH3hK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DO0doCss";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jyKjH3hK"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCdllB021602
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ymj+HtJjkM3AaiKJe4X9GVlFCBl8IVbj2n1We3aq5zU=; b=
	DO0doCssYUbagWF+qnZx28/LeoIghnEt8gbep/0kKg2Wee1CFGlSxy//NqVvM7vd
	PBD8aIGeRIKAsbjuWbTnELZaZcgeSu9HcR39x79Ussvj9nd1SaaMbdOq13/bp9Oy
	6sjEDlAzTw7uaeF4BeovQe5lmuc7v9+zofCYIhMM56ltXWiyuzxtZsAddWrVRP9S
	DqI4L4BubqvxM51r/pRp7WGs3diUCuauW7vK5TmaCA8vFOHlXR4x1qBjVIW4kemR
	5ZmjZocxw8h62AXA4kRoH8L5PxASStMOoQlr16mzF3Ixt+4Re/Dk7o+COQZ6VP+c
	BrHV1HGt36eGDKfb9JLskg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ra1qjh54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:32:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGNLk7024820
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:32:52 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpdcs5x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:32:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiXPoWejoQ81CYjqsXdA07gekEFDIg0mNT3ecrpuE9iAYBzoQdTtPepW67GbyQa4hfenzW1re/AbRXvwtGNfvqjqAZmxjxYOiFCg/Z4epntbR0Tpl20QvGx1QsJHCc2VfX2ciEMdbgOhkLmn8g/3IZe5QVu381LFgprHmVmBU34DPOWLGHtdQZTE6IxQGrS/wOjnT2VuNOxQwQE039313FjzdDxuw0dxUvaCocC9S4b/Hb8jd6/SbWBvUiQ5GyisVb/jgLGUMv1uC423c8rW+C13MGFJ5fBwYdFVs79CBPI+kHGfe5q/oCfKHChD4Dp7MMzjotXNTnL6E5ohdP47hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymj+HtJjkM3AaiKJe4X9GVlFCBl8IVbj2n1We3aq5zU=;
 b=M6WbMTzqalMLcQ+RzbnNNqo2cm6kkCXxM5btHRv245NtNSH2MtS0//79HU7OqtSqoyX/RlRWyvsvY5owcx7drO1rxAPUgHnMRPApyw253qEDpGclTpleU+Wl/VTK3MUvasSg4mPSkSOFGD2sEc/I/Tbf/ASO785cJFG01hI3HeoC4/68KDMuQC+71lE3il0CJn3KjEkrRIs2Ycdkbg+lrB5xfV8bJbRyVDB9I5H/s5L5lbxjBdhgmNneV63bfzgdisRcoQLe/4hx+3UNpKqM4nbRQe2fBQ5qK1QRyw0HI2T03EIfBfL6ZtF8eJbo9D7FxH/prRHY5Oc6SLfPwAdwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymj+HtJjkM3AaiKJe4X9GVlFCBl8IVbj2n1We3aq5zU=;
 b=jyKjH3hKPOKaboFXP4irsxhbJoqFmobGTI8PgUagSQ+ZV8rW/nTaNyry03+cRE/oa/nEIJtVjzD79oWu6JBRtIAjsCGS0ArGNH0dO5VL35weGoukNfaX5GLNIJD3V4y8g6RR6JlNWiiZb9aQalf3D+mzX4L0u2SICWSS11JWayE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV0PR10MB997612.namprd10.prod.outlook.com (2603:10b6:408:33e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 17:32:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 17:32:48 +0000
Message-ID: <87c44286-dd57-9368-da23-b2121febdc5c@oracle.com>
Date: Fri, 17 Oct 2025 13:32:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Clean up stack_fbt test
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251016205641.15446-1-eugene.loh@oracle.com>
 <aPHf07N4ISwnhK7K@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aPHf07N4ISwnhK7K@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV0PR10MB997612:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee008bf-c876-43b7-edd6-08de0da330a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEluR3E4N245WHEzK2tMUHkraHp3K0M1S1ZOZkN3Q2d4M3JPUzdQMVB5NW9F?=
 =?utf-8?B?VzdjMk5CY3Y0NFhvbXJqTDZvZWQ3Rm04UjNGUFhuUXo3ZUZwc2JPVnRCb1N5?=
 =?utf-8?B?YnZlOHNrL1Avb01MeGttNU0wRGEvSVluNFVrQk1Ga0VDNUdzQzJOd1ZhaVRn?=
 =?utf-8?B?c09hQlNsQ0JxMHdvcmVmcVJiMCtiREp2anhwdUJCRi90b3JuY2tkS0RUZHBZ?=
 =?utf-8?B?bnRvcHpVT0V5WExzWVhjNU9mTU03TVhrTkdlSjN2dnFxTU1FeFVMN3daeDNk?=
 =?utf-8?B?aUh2SWsxVmNPT0lLWTh6eU9Eb1R1WWpMMktGVEtqaEV4ZGNkUHhOMjE1M1ZP?=
 =?utf-8?B?dXVEcUd1cFkwSmNJNnZoaWVFQjhYYUZ0eTZIUTRnVXFSWkpFcFNSd3pBdTcr?=
 =?utf-8?B?Tnh0L0FYN0QwMERHS0R6TkN0WSt3YkZjU3pUbjNEUy9xOEVodUgzVWdvbzRQ?=
 =?utf-8?B?MFgzL1phNmpJVVkrRFRIWm9sMSszeEVEREJBMWRoRVQ0anFDeW5mTU9mMW1m?=
 =?utf-8?B?TkpxTVYyRmZ0R2J5TTYwa0dQdXN0cmloKzRNcG5PemtCR1BydGt2RDhFNzlx?=
 =?utf-8?B?U3g1N3FiWVJubldlVFVGTWZmRFpYOVBQc0lQYUp2R0ZNdWtmbWVaTzBBVzlT?=
 =?utf-8?B?S2QwT0xab3Z1eWVXNzYzWi8xSFZqelNiTjhSN2hJVWM3OUpOVzJxRzJQRUZl?=
 =?utf-8?B?UURpWUhibHhranhZcHpXWXFuVmJzM256K2lobUFjV2tQTDBFSWVvS0lsWTlP?=
 =?utf-8?B?ejV0M0Y3ZlZ3bkxIVTFKaDJOWkxQeHpRcHlSYlFmUEM4QjdZbHNSMERWYXI0?=
 =?utf-8?B?ZWZ6SmtDSnpYdTZ5dkJ1THJxaTI2RTRHY2E4cVAxZEdSS3JIOGJoak5FVzVB?=
 =?utf-8?B?ZTNDNG9CWXhwei8rd2dXMS9Lcmg0SFp4em5RT2pXcjFrZlNFZjl3WFE0end1?=
 =?utf-8?B?OEZMQVA4eHVTcDBaeHAwYUduUkhxOUFqUzB0L3ZCOC9Qemgybnk1bFhkV0lM?=
 =?utf-8?B?UityWTVCblVTd0xmMWhiNCtxUkFRakpEbVZ1Umc5Z0c3Nkw3a082M3N2RUww?=
 =?utf-8?B?dlQvVVkvMHprWWFUdmFPbldGZitPeGY2ZzBZWjlQVy80dDc3bG9PYkF2MWUv?=
 =?utf-8?B?aW9kY1c2MDF1b3B6M2M4L2l3cFdMLy92SEJxM1JOcEZIOVV3VVA2WkUxeGpB?=
 =?utf-8?B?T0U5YjBJKy8vcCt3V05ka0FnQ0VwVXUxVnZBQ2JrRWFXSkxQTExhbjE4Vlhx?=
 =?utf-8?B?MGc4SjByaHJaSFpxbkxLSHhJY0wwTWdGL24vaGREaG1qUXBXOFAxbUc0SUdE?=
 =?utf-8?B?VmFtdVduQlpsOTNacUROc0dTWmpnWDF1cXlsYVpFdmoyNDJLVG5JVk82N3Fa?=
 =?utf-8?B?ekpyRjBNTlc4WVBrTkpENDZEUTRsYUlic05JYmZ5d0dUcDV2MTJYRC9kY2NB?=
 =?utf-8?B?RExTMmFjSDFIaWhqbS9KTkdZRHc4VlFvWERVTTBKbS95bnVkaWFBem0xZGl5?=
 =?utf-8?B?U0M5bXAxcW1mbFAzNHFvd2ZQclJJVmJGVVE4SVlzUFZPTU1pdDROZzFORWlO?=
 =?utf-8?B?SlZ2amx6Y1djWTh3NGtScVlaMklnWmNFWGdJbHYvc2RBVjJHL2tueGdFcElT?=
 =?utf-8?B?ZUM0TENFKzFsWklyZUlERzY5VSt5U2tHdkM2R2JDdElPZWV4Q2RleU5abnl2?=
 =?utf-8?B?T2kxam13cm1xRmk4L2RhcUplQVk3RDV1c2YyRE1zZlFsenJYK1pic0VDbVh3?=
 =?utf-8?B?dGRuNnRFaWMrZGtxMnZ1UFVnNjdIdDYzN2pzRmtLSWhlcnZ6cmVMYk83cmlL?=
 =?utf-8?B?ZFlVRFlxSTdTY3dpMnMvNkZtbTdtNTN0b0YwTXgwM3R3Y0l4RG9pVERyT1h3?=
 =?utf-8?B?djBOR3k4b2IzcE1ZSVRyNjNsekdUM1JrTFBmcUg4c3dUNDhxdTNvTFlMeEVU?=
 =?utf-8?B?SmxjSjdoTG0reWFFeGtVWFVXb2JldVk0N0dCMkpMMVNqN0dpSlhpNVFLckQw?=
 =?utf-8?B?ZU1xRG5pVk9BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk4xNmhpTFYybnp0aU5EaGlxcC8rdDVLQjFkNkRuVzRRL3EvNzVJb2ExSUd6?=
 =?utf-8?B?dUtQa3BNc0FDVmc3bEk1THBrbng4eEpIeDdhTHRHNXFoRUtNNFluVkNScjgw?=
 =?utf-8?B?UEZoVG9lS0hnKzZJdnR0aGxaMjlYcFhBQy9FdjRSblltZWEvS1pvUS9yV0Z2?=
 =?utf-8?B?K1dqLzBGQjlnNTh2TFQvYWZtQ1VqRDZ2UVZrNjBDckpJcDYrNXl0cWlsdGg4?=
 =?utf-8?B?YmY1bkttbDlKelY4enhLWEl0N1pXd2J0clgyUURXNlA4YXhidEZVVHE1dEFz?=
 =?utf-8?B?VnBOM2tuQ3RHK0lwZFprbG1nSWxqdjhYWTEyUm5DaWhoVitPZTBDSEw5N2Uw?=
 =?utf-8?B?YjBySEF1VUlhSUJZMzF1WkhHcFZQY0JyRHdvdWJtLzRIcDFYWFg0YnZTUTdT?=
 =?utf-8?B?SzlndDVLek9PZTl6UnNOZFV1dGxnK1laL0lmcHNFZDRRZXlMdHJEU0dyUjJ1?=
 =?utf-8?B?aHg3UjNzUDhJSzFiQzBwWUM5RDBUbTdTQkZlbGhKblNVaU5CaHlVbThMaG80?=
 =?utf-8?B?TTlMdVJpZitxUHhIWm4zbW00VjM4VWd1NkFDVCsreldVOXAvZ1IwbzBtMHh3?=
 =?utf-8?B?WmxnUm5OaDBiUmhxWU5TRXdOWTdFbFRQaUVDTEo1UzhrcE5kWGs3N2pCTmFD?=
 =?utf-8?B?ckVleExpUGJ1N1VrZzBxRkF0RmZBTlFkYW16Sm94emtaNXBYMExubDFnSzJL?=
 =?utf-8?B?ZDRuZFA2WGV5NWZrU01TcGd0V0l6RVRoZElCaThyalhLTVczS3Vpb0R0dVY4?=
 =?utf-8?B?dENQQld4ZWoxSjJaSmwzR0VUbjN3ZGkxRU5ScXdiUmxPQ1J5SFhPL1Bmbzg4?=
 =?utf-8?B?OXpQWWFPRjZOcXNEaUwyR0FnOWhGazlGcUxhREc3YVg4MzFqdXpKWVdKVnNs?=
 =?utf-8?B?dnFTRjE5TTZxRHEvY3N4YTZTMDY2bFByaGlEaEE5dzFjeVVlMHZFbWtaUm81?=
 =?utf-8?B?bXhqcytKeXFESmhmQ2RZUjBQdVBJOEFyMk5zeWFZWU1PZG9CMkw2WFNFYnhG?=
 =?utf-8?B?cDBESUVUbXBKV0VFNExxd1RCQjFDaVZHOEhUdzR0MWZzNGNnQWNZQW9Xejl0?=
 =?utf-8?B?elFhWUoveldrV3FJK1V4TG80RzBkUEhXR01Ja0NITzEvd00rWndxNlhLdDJt?=
 =?utf-8?B?Znhhb2d4RXdhcXUxK1RIeEpOV0FuT05hTmM4b2IzU0lRVE5yVkpDdXBnSjNx?=
 =?utf-8?B?UUkxQXdVaXhaYUVSam1RTXh2dHRmRGtrcFZVY3RKZnFOMHZoTnU3RU9PMTFD?=
 =?utf-8?B?SWp4cnkrNzlybjVkek5CT2pTaWE5Z2NUeWRvY3htcWVDUklXclllQWQ5RDRz?=
 =?utf-8?B?cmcvOXFZS2ZiejYrbUQwOHVRM0FmeExqLzBtd1JuNWk2MVJMMkRWSE1pRnJT?=
 =?utf-8?B?RWI3bTQvL3VvZ3ZsSXJPYVNraXNlVDhtV3Z2TTM3YzI2K0N1aHRGS2tuY09L?=
 =?utf-8?B?QVVScm82R3Jya0xlYmcyZDVFckhlNHhpUUJBc2ZzK25jeWEyUVpYdSttVk9z?=
 =?utf-8?B?aFhza3Y3UUc5SHM3TzI5ZHJIZFNRZEF1RGVWTjczMWlBd1M5WGZMeCtLdHhF?=
 =?utf-8?B?OTBLa1lDV2RHbWxPT2hodTkyTW1tU2o0anEwckkrRDhxa216aTRNNzBzUE0r?=
 =?utf-8?B?NjZlY2swMFJaYXd5SXQ1bkVZeCt1d3lUYXJsMzVobjVEQSt4eWdGb0p3eU1Z?=
 =?utf-8?B?QmZXTld3Q2N4UjgrSkJYR1NXNG1DZWxOUk94ZkhqRnVPc2RqMUMvUEFobVkx?=
 =?utf-8?B?Uzlmdm5KekZYaFJwd0VsZTNSUGZhQWtxeGlxVk5ROVhWeStUT3pNZVN5UHFE?=
 =?utf-8?B?RDd3V1RHWDNuZWtFc3oxY2JIZWxCcTVYL2t5dlYwZ29reVhmelBuV2E4Ti9w?=
 =?utf-8?B?N2NYS1VaNzZUa2dhT241djJXQWVTK0dBcng2S0F1WVljTFl3VXFJTU1NYThH?=
 =?utf-8?B?eVdlVG8yQnVLaDBmQ3o4eGEvUHJWcDVlL3EwUEpKME8vWExZbW5odjNFRU1C?=
 =?utf-8?B?SUVaUytBZlFiUkVpTnlBeFk0d3UrODdpMmlkZWoxWks4VVdSNGNLMkZYd3pP?=
 =?utf-8?B?L3Q3VmJHWWE5NjNRNVhDRXJ0TEFTczlDc2NycW1kTGRlbnpmb2lSUjNlckVV?=
 =?utf-8?Q?XrV3pPIhF39zYIILIWxsbpDZY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UBWIVJhS1G6/nOdJ25KBGHIQ7ynPhLgb69Ubx0M4bTPnOLGPQ3AnHCWxwLAKs6UsLfk2loDx5Nhb1S+Iy6Wuq0Z4f0LJ478oaUenwHGp2/6q7tK9454hzYnfT/fsMrgCNlARhnJo36mBdw71SVchBs1WzC3VtT10D70z8bgzcoZvpuv7l+bW5oI6N6YH+foFEyZq8fTP6sCmCyp1ziCnkMmp5oyst5NCYRvbbeDevHE72QKcFQeGxiimgGQTU9NvShhgX0/wc7/30FY4qmEEIVwyvkz8fAtNYiIw2/1IR7NkiJdA7uen3FqGmxJvCEBKX2Gi5TkQ4X2pZZwBv7DUfE67sO08xP81al6SdZftAU5M1bp862mcvQw5FWaxEIODtQF8Dzc/PGkP1INW4XGikbY4DEM8hUSHaa+8HDStzRsjjBExjdrtWekXEUPwZgncTwq1yBGOSnWO0hsoteYizMOfSp6XEcSwmorkwXHdTCv1H8vctJWjkm3eP5e6nEpq/OS1NmunaG8qnYMag3HJpDDKySdLhRll04Jc9Uxmt8citYDVpgu+5IzuAIi2BbVV6kFv3t+VvXMsX4OpYw/rrL8qFiD/ZEvw1cdc8GZYY5s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee008bf-c876-43b7-edd6-08de0da330a1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:32:48.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtPqkRt8q22tx8pwuZLtzaY/b13kRbC0vsPRP2D4a4jLBd5XftD28u4H9N91LES+8dXdkhBEGSOMbKWZDAlefA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997612
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510170131
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA1MSBTYWx0ZWRfXzrdrEVZ5bngO
 YmAXqWNXuSlbhHyO6uQVU6PgIYzvbXbCHjt5buOvea+ZQfMXNtxbSjD8UXOlz/ut+R0sCMvMdoC
 fJVkAadhb69lH6/wpAFgKBH8X0Zu9ku7fnd3g4ldKTKw/MkG7UIZf179qsdZoCnd90fOoFKm+xz
 ln4IcltMNpKRfzG0izBnd/CS+9EdNWfTC6zaYzIetu6680Nt3+L/49XTQnDFy9WbYKPA4vgM8QH
 3zVZnkhbzWTwnsi5nvqmaMFo1Vbw1iRcpfUZ46ZPwe28gYIzBUDu3BmcRbNAFMBb1u+8ZSbEZKt
 LkOSXGfBh2D3nwq1dYfzljX9FdL7F7pqZwdbX7sd7Kqrm1bTD7n95zIPWbZbjnAv+BpL5si9zxu
 ss5PQwzsm38PFqI5yXv/B55ksVkSBQ==
X-Proofpoint-GUID: bn2wFo85Zv1y-bt0njieF7PzpypGJnEU
X-Proofpoint-ORIG-GUID: bn2wFo85Zv1y-bt0njieF7PzpypGJnEU
X-Authority-Analysis: v=2.4 cv=GL0F0+NK c=1 sm=1 tr=0 ts=68f27dc5 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Guyv27Bbv4eGyZPZpdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 10/17/25 02:18, Kris Van Hees wrote:

> On Thu, Oct 16, 2025 at 04:56:41PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The idea behind the test is to check the stack() output for some fbt
>> probe for specific expected frames.  An attempt was made to specify the
>> exact stack that was expected, but there are too many variations among
>> kernel versions and so maintaining the test was difficult.  Loosen the
>> test to check for only a few expected frames.
>>
>> The test was also checking that stack()'s first 3 frames matched
>> stack(3), but such a test is already provided by, for example,
>>      test/unittest/printf/tst.stack.d
>>      test/unittest/stack/tst.stack.d
>> So, drop the stack(3) stuff.
> Since the kernel implementation can change between versions and architectures,
> why not just verify that the function we're probing is the top frame, and then
> perhaps for sanity ensure that the rest of the frames are resolved addresses
> (i.e. symbolic nmes rather than hex addresses)?  Although that perhaps might be
> a bit strict because I could see some architectures implementing the syscall
> stuff somehow with dynamically generated trampolines or something that would
> not have addr-to-symbol information.  Or ksplice might even cause that if the
> splicing took place while tracing was going on because we never re-read the list
> of kernel symbols after dtarce started.

That feels to me like a different sort of check.  The intention was not 
simply that the result should be visually reasonable, but in fact that 
the frames are "correct."  That's hard to do (because we don't exactly 
know what "correct" means), but there seem to be certain specific frames 
that we can generally expect to see.  Maybe there will be some systems 
where the generated stack frames are totally different from what we 
normally expect, but maybe those situations will be scarce enough that 
we can just look and make one-off judgment calls that they're okay.

Anyhow, the idea is to check that specific frames are there.

>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   test/unittest/stack/tst.stack_fbt.r  |  1 +
>>   test/unittest/stack/tst.stack_fbt.sh | 89 +++++++---------------------
>>   2 files changed, 23 insertions(+), 67 deletions(-)
>>   create mode 100644 test/unittest/stack/tst.stack_fbt.r
>>
>> diff --git a/test/unittest/stack/tst.stack_fbt.r b/test/unittest/stack/tst.stack_fbt.r
>> new file mode 100644
>> index 000000000..2e9ba477f
>> --- /dev/null
>> +++ b/test/unittest/stack/tst.stack_fbt.r
>> @@ -0,0 +1 @@
>> +success
>> diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
>> index 15b85be13..f3d321e7f 100755
>> --- a/test/unittest/stack/tst.stack_fbt.sh
>> +++ b/test/unittest/stack/tst.stack_fbt.sh
>> @@ -5,7 +5,7 @@
>>   # Licensed under the Universal Permissive License v 1.0 as shown at
>>   # http://oss.oracle.com/licenses/upl.
>>   #
>> -# Test the stack action with default stack depth and depth 3.
>> +# Check the stack action for expected frames.
>>   
>>   dtrace=$1
>>   
>> @@ -26,8 +26,6 @@ BEGIN
>>   fbt::vfs_write:entry
>>   {
>>   	stack();
>> -	printf("first 3 frames\n");
>> -	stack(3);
>>   	exit(0);
>>   }' >& dtrace.out
>>   
>> @@ -37,17 +35,16 @@ if [ $? -ne 0 ]; then
>>   	exit 1
>>   fi
>>   
>> -# Strip out
>> -# - blank lines
>> -# - "constprop"
>> -# - "isra"
>> +# Ignore blank lines and strip out
>> +# - ".constprop.[0-9]"
>>   # - "_after_hwframe"    (x86 starting with UEK8)
>> -# - pointer values
>> +# - "+0x[0-9a-f]*$"
>> +# - leading spaces
>>   
>>   awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
>> -               sub("\\.isra\\.[0-9]", "");
>>                  sub("_after_hwframe\\+", "+");
>> -               sub(/+0x[0-9a-f]*$/, "+{ptr}");
>> +               sub(/+0x[0-9a-f]*$/, "");
>> +               sub(/^ */, "");
>>                  print }' dtrace.out > dtrace.post
>>   if [ $? -ne 0 ]; then
>>   	echo ERROR: awk failed
>> @@ -55,77 +52,35 @@ if [ $? -ne 0 ]; then
>>   	exit 1
>>   fi
>>   
>> -# Figure out what stack to expect.
>> +# Identify, in order, a few frames we expect to see.
>>   
>> -read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
>> -
>> -if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
>> -	# up to 5.8
>> -	KERVER="A"
>> -else
>> -	# starting at 5.8
>> -	KERVER="B"
>> -fi
>> -
>> -if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
>> -cat << EOF > dtrace.cmp
>> -              vmlinux\`vfs_write+{ptr}
>> -              vmlinux\`__x64_sys_write+{ptr}
>> -              vmlinux\`x64_sys_call+{ptr}
>> -              vmlinux\`do_syscall_64+{ptr}
>> -              vmlinux\`entry_SYSCALL_64+{ptr}
>> -EOF
>> -elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
>> -cat << EOF > dtrace.cmp
>> -              vmlinux\`vfs_write
>> -              vmlinux\`__arm64_sys_write+{ptr}
>> -              vmlinux\`el0_svc_common+{ptr}
>> -              vmlinux\`el0_svc_handler+{ptr}
>> -              vmlinux\`el0_svc+{ptr}
>> -EOF
>> -elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
>> -cat << EOF > dtrace.cmp
>> -              vmlinux\`vfs_write+{ptr}
>> -              vmlinux\`ksys_write+{ptr}
>> -              vmlinux\`do_syscall_64+{ptr}
>> -              vmlinux\`entry_SYSCALL_64+{ptr}
>> -EOF
>> -elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
>> -cat << EOF > dtrace.cmp
>> -              vmlinux\`vfs_write
>> -              vmlinux\`__arm64_sys_write+{ptr}
>> -              vmlinux\`invoke_syscall+{ptr}
>> -              vmlinux\`el0_svc_common+{ptr}
>> -              vmlinux\`do_el0_svc+{ptr}
>> -              vmlinux\`el0_svc+{ptr}
>> -              vmlinux\`el0t_64_sync_handler+{ptr}
>> -              vmlinux\`el0t_64_sync+{ptr}
>> -EOF
>> +if [ $(uname -m) == "x86_64" ]; then
>> +	frames="vfs_write do_syscall_64 entry_SYSCALL_64"
>> +elif [ $(uname -m) == "aarch64" ]; then
>> +	frames="vfs_write __arm64_sys_write el0_svc_common el0_svc"
>>   else
>>   	echo ERROR: unrecognized platform
>>   	uname -r
>>   	uname -m
>>   	exit 1
>>   fi
>> -
>> -# Add the first 3 frames a second time.
>> -
>> -head -3 dtrace.cmp > dtrace.tmp
>> -echo first 3 frames >> dtrace.cmp
>> -cat dtrace.tmp >> dtrace.cmp
>> +for frame in $frames; do
>> +	echo 'vmlinux`'$frame >> dtrace.cmp
>> +done
>>   
>>   # Compare results.
>>   
>> -if ! diff -q dtrace.cmp dtrace.post; then
>> -	echo ERROR: results do not match
>> -	diff dtrace.cmp dtrace.post
>> -	echo "==== expect"
>> +diff dtrace.cmp dtrace.post | grep '^<' > missing.frames
>> +if [ `cat missing.frames | wc -l` -ne 0 ]; then
>> +	echo ERROR: missing some expected frames
>> +	echo === expected frames include:
>>   	cat dtrace.cmp
>> -	echo "==== actual"
>> +	echo === actual frames are:
>>   	cat dtrace.out
>> +	echo === missing expected frames:
>> +	cat missing.frames
>>   	exit 1
>>   fi
>>   
>>   echo success
>> -
>>   exit 0
>> -- 
>> 2.47.3
>>
