Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB0376A13
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016753; cv=fail; b=XaFmUbkHul/PFYXx6LHGXP7gfoEch1DOx/2/WBbbx6+KRFHcnoH3RNbroEWMx0eP3LBEO3Br9/TRLhjpiBUaRSqHn7Nz5aeIvmvflX1NOoPVxulmzNyUmZqtQ7SChUkTFAxuyXvahf6r0u7Pb4T3d9wRWqQvMCI0jArTiTnJbAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016753; c=relaxed/simple;
	bh=Mz4iFL3wZ+wwDRbDPAxZkkDjaJsMv4vngLiMk20VVTU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JvNzxSfmZHS1p2GkkKvbY1B2S3sg+mlht8cnTGJ2HoqwZ+/ELRghSalHjtvBwlzXnUtlzpnGIkIl49mNVhyqvBbKdl0BCHT4xpHp+3JCZftohkL9lHgYxg51DscYXsQjsXzeb5aMegQRS2hBlhXVzwcg6pRaiMG8Gb/GQagqcZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bp8LzaIz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gMmaDn1r; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bp8LzaIz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gMmaDn1r"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6937hWvR946537
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=FWTDa2jfHq3JrvrsDe1DTGKdtAm9gXz5lSdbHY1GMtA=; b=
	Bp8LzaIzzwyhfSwiwuxvl8QQlPvqnAH1SyonVRH1hVZl8Dj3Jk0iHKl+Lfk6uG9i
	qYCgiX6J+NSW7KkER/sQ0t4TXflnP23gyNkhkUYuOza+IUvEO4TCviJAjXrwpW13
	3S/6oQeLfqFcS2vWwj8o7oE+39AwXRr6MV17fUJboZrekJ+YuC34F3y8OQxhgBu/
	HdNvNg0hrIx8upeIy/bXOqyZG5wejOtu7FGn+gMQyojTBAjs25kNsps54WQvJo0x
	MbXZUFcOZWp/mjkezs+nWYPScJyyBOcjO612vYMoN6IuBSAtSuU+kXxWKRFe1hne
	5t7dsCfO16ONlqrnBLjZkA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2sk7g41y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:39:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938YwGQ018333
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:39:10 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r58ed7f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:39:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvyYiEybHqJFnR9U0JNXmnvFlwBgSspQp8ohTaFeRV6+FL8FWJFJrYFlQaPsQ7/7Y7n9vsX6rA2ShGcHPwANQnNR4XLXfzTGL3WwiUNHX0GAVoufX+Ltxq/8pW5MFbmtYMxfCd8qierdf41NXZYRjFr0jZts7g50LXDs/+1jRoOU+UrTVoRtGJZ2tqpPLmX7CSWbav1UtcgwntluSZ6AiXboha9EpJl/+AXBQXTlhCCGIWYb7FdsRIvZ3jnTiF7mhabVURKHy4o7qr0cle3QeOQcdhoRP28eX8lJe3SwlkzmEiy8wVqH1/d4HpHJkYoLKpKdjBbXPvQt35+woDBFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWTDa2jfHq3JrvrsDe1DTGKdtAm9gXz5lSdbHY1GMtA=;
 b=kihEBZHhviJzJH+deVI873i5yWPh/h6OqRw3kZvrNc7U3F28ileoqpJsuf1cxdQNDkRhNYpIrTW6eURV9gLv/dCzHLk0CRQSsarmkS5rC9GJN4sjFW6CD8wlfiXnPnnZX8WXqfb6Ouba2xvw8rzkOq18LMURLuhaAeFXvKLArXMJUneys7XhrI/2XVe18RVeG5QKdg0xXR//PbcDE//U+uPDwb8ar3Th0cldIL5z67rZUom7+Usm/01uK4FGPQq4cyJR/MQ02eL9AlhxhnOB7u+NUvBs++6l+L5f87GAdNY7dNzghkBhr9OSWQnA5LmfUZVgf5MpXy+4yJE6SVXrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWTDa2jfHq3JrvrsDe1DTGKdtAm9gXz5lSdbHY1GMtA=;
 b=gMmaDn1rcPZ7PBbprI6K15ZUd7eGB3kCTVWJlg9AataGIJcE9hRn1fvwfwjrU2c1h10avOAq6m77n8DrwYAwqKTmkgr/qDTp08nCQTzAeUiM+d92u2XPN19mGtUGLgogAOw0RWAbzPWGGHFuVokvTLsbeqdvWM5e+xj8oDL9y9E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:39:07 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:39:07 +0000
Message-ID: <9c889d8c-f3e9-48eb-bc82-2b81a67ee8bf@oracle.com>
Date: Sat, 3 Oct 2026 02:39:03 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 1/8] list: add dt_list_empty()
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <fc105162c29955947d9ad85ce981a739@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <fc105162c29955947d9ad85ce981a739@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0131.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::8) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ff05d1-a2c4-4e8b-4dc4-08df2129c9aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IQOjb/pKb86Zj7Amdt8JGhy0zrkKIZ6DUtWNOR2q1qbMlGEhVrcH2NMSmoO8AMp/IZnyMAMW/oe1nNhWXRaLEX9AZFSSNMorFEDqOkZYdDsMlJUBeohE1EC7SD/ddrYcouNdfZQRHzv+1rgF1bvV+SudIy3wxYlzDFE/OpRCtqReu++pni+9a/ltk8h+mNWSnoU0dOD87n9Yy5rB2rNapd8u5ppmKy1JUI+L3idD68WXNcXddkGUTgWD+nEnU4Py8tKNiGv8Kiui+7lKRtaw4t+Q8OsSlKmMWiaG5T6IUqNIZdqRycy7XfgORX2oCMnphh+LxyUgajfHyMNAmp+3mwwk7p4g0CMR1ajEQwu8xFdNoP+LHwuAM9QiDQ5V0t1YAbvaQf7ZWF73fGXnCNRikzBZMaY27ENyT/hIzeDsxSh9bb13BxDZDuRj6itoWAe7JFVFArbTGe/AC2AE2WkoDvjCkmUD+ZPtrsC3+Zhs3Ci5AUiaXttjq9+F9zhWDyPgwmNQckHaMsZO+HEYqEEhs+Joy5nbsaghM6q8+McL9SEu1AwoUHN3auNgaaOQN+MPxvTPsruddwyTNcssc4ZUip+BJ9A2sUmoayWQcTlxrsYUVYOaNu15p7wPy8i1VWkeu0mBIRMirPPsFXggbN8P0tiOOwhhqn+cIqVw8+R3xMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlppRlF3T2JVMGt1MGs5N291Um1YTkI2bjk5RGxYa2owSDZVN1hNQmFvdWtQ?=
 =?utf-8?B?SmRkYndhU0VybXZHcFBPc1gyUkdCaWxVaTdnWk1LY0VSOUZvNHJSekJ5MjRM?=
 =?utf-8?B?ajlIZys1RlhoMXkzZHpIa252ZlJhRXJObVY4SzVobzBlSm9tRTRWSmsxWlF5?=
 =?utf-8?B?UXRsQ3dGRCtDc0pLbkhuR3ZOWEFLaUtsRWFkV0k5MUVBa2FOUFhKdDlkS3RK?=
 =?utf-8?B?bFlNOFZLeTR1V2pEaEN4TDBUSWgxVnBXWXNlZFRFckQwazJtOGp5Mi90cFlF?=
 =?utf-8?B?cUxlTnVENzd4SU50OG41SW5hcXpHUXN4NmsvQ2dQMlZpandwais1RnJIWG5M?=
 =?utf-8?B?Uk15eDM2ZjM3ZTRrSHVuMGZwRE5UOW9zbjlkZlZObHp2VUFOMkQrT3pkb0t4?=
 =?utf-8?B?RmJkZE5WdERKWFo1UUtIYkZ1cGQzMmVEc0wwT2xNak93UTBxYzFFZWRROVpr?=
 =?utf-8?B?bVRvbGFMcWxQcnNLM2pHRUhvSUQxdnhuaDY2QXR2OXY5MWtzSXhtZjZSbUpv?=
 =?utf-8?B?V1RFdk5lNHN3UHJaSmFnR3JQV1FJNkFjNTVZdTdOSzV5eStvZG5OdmpUbU9I?=
 =?utf-8?B?cWFsQjRVN2RLci9zNEIzYUZ4bklpSmtpVlZDUmNMenBSUmRSZTZ1T21uUEhW?=
 =?utf-8?B?cW1XOXdJbFcvNEx1WmVKTTlITUhnODRXUnJ0bC9DQ2lmSUJid1B0UHYzOTl0?=
 =?utf-8?B?aWhHYitBRFlna2ZNcU9hM1VDSUJqNGVWNVF1UmJXODAwWmtIc1M5Sm9lWXJN?=
 =?utf-8?B?ZjFNVVpDS1ZROWNMT0xwdmxGUlBEM20wbm9mR1p4MU9mYjdqVEtYMFZRN1hv?=
 =?utf-8?B?UUJJaVdSL29Fd25Cc2Rwc1pnM2FvblRaWWlyODF1MlNyWlVJQUlWVjM0RHpk?=
 =?utf-8?B?VXJSN1gyWjk3bWNGMkNtNkpLV2lwRTFLK1hOSVBYOFBmaythUGYvdjNFZGl0?=
 =?utf-8?B?dUpRYXc5Nk42OS8zM082ZnVPRWJCSjk1NFFEZDhzZTVobDFsZ1NNMjg4d2NI?=
 =?utf-8?B?TnZscWhoRTFhTzJxOVpIekdRN1NvTUdSalJpdERFT2RCdWk4UGdITkRISmt5?=
 =?utf-8?B?eWtlWXhDVmtyNEtFZGVpVXV0bVRITU9NVmZHVHpVMUQ1ZWR4REZsRS9XM2xQ?=
 =?utf-8?B?Y3V6Z2lKdGR2cmVZeCtlV3pUNGlaKzFlVHEvcFl0Ulp3SnIrSzV0bUpnSWY4?=
 =?utf-8?B?YUc1bzY3ZDV3N25ZcnhmZm9uOTRVWFdjMGlRdGU1OWZhTVBlVXhXR2VMSkl4?=
 =?utf-8?B?WlROcnpLVGNKdkg3c3QrRGVBREs3ZmNrMEdEbUFBVWFNVkdlMzhOaVAxaEV3?=
 =?utf-8?B?c3NwNlJRZ1hRR3lQQVFkdWdTVzYwclJxb2M4VlM2Zzc2YWxpV1RrNjZBWElO?=
 =?utf-8?B?VTJHdUR0VUdtNW1tdGRCVkFhSTVoNFVDWlBhNloxOStzRXk5aVlENDkvT0hZ?=
 =?utf-8?B?L3BqWkNZdEZXdzYzb20zNzJXWVJWaEJjNzNhYlBBaTZ2THBLQUdqTmdSdG43?=
 =?utf-8?B?MXVHbk5uSm5XWitiOHdMR09yMlVrWU55SSszSVdELzBIK01YL2h3eElNd3N4?=
 =?utf-8?B?K2pLVDJ0cEVJQXIyUDFTRGtmd1FjbE9KMmVIeUd4WHEwR2pmRHl4TWxKZXlR?=
 =?utf-8?B?eDk3elpURzdEQVhwVlh0ZytuRlJSZzZDM3psMSt2NE4yaGtFNVAxRXdxWXRX?=
 =?utf-8?B?MlZyamU4UTkwc2o5ZzJEdHdyVHlNY3c3Y3hsQnZuenU5Z3lEb3ZUV2o2bmxv?=
 =?utf-8?B?UkVmNG9mbHg5dDhtMkxOeFk0cmZxUlY2VHBlQmVuSkt4OVM4UlRXNnJQZE5y?=
 =?utf-8?B?bUh0YVZkWkpnR0VBNHo0eHhvaHV6cFFOUG1GTzJJWUU0L2ZxTXorQnhMQ0ZO?=
 =?utf-8?B?YWZvTnlMa1l3ZnJBOTZrOE10R1ZhQW4zM29qWlpHWG14bG1RZ2w5b0llS0dx?=
 =?utf-8?B?OXlZUEN5cHBJMUVuenFqQk9xME5GSEt0NzR4V0xWdjViWWZGOGFqRzNhQjRi?=
 =?utf-8?B?M1BUeDc2bWJ5WG9WRG14TjRyMjBFamVtUktWM0lnZTYvVmI0TVJ0UW5aSDlz?=
 =?utf-8?B?NGU4SDVjeFZxY3dhYTFFWXhHczJ0YzRpdmhseW4vMjJUYlFkaHhhVFlycnlo?=
 =?utf-8?B?em43S1BKWkd1cURhUWY0ZlpWRHNDbVBPeGdIcHNYUFJDRnFRREQ4cDA4WkdM?=
 =?utf-8?B?YW56VC9CZHBwamZwQmM5SmVuQUJXQlhmbU1RMW4xS3hnUytzbkMvaEtCZmRF?=
 =?utf-8?B?d3NHNUZUR2pIaGk4bTB6ejdiS2RIc01FN09jTVFYM3ZsQXQ3M29BQkhjZUp2?=
 =?utf-8?B?eGpaRmlqWkpxeW5WNzUvN201Q29yQWIyUTJQY3dTQ01veGJ2cjJ6b0VJNGYr?=
 =?utf-8?Q?Bmi+KLqRjqoX2HJA=3D?=
X-Exchange-RoutingPolicyChecked:
	oHy1ZWsaoXoUFLdScPMMab58xeTssjuS4/b5zLDnSeO/s4AGoOC13Y95hjL4K9jXAFR1KZJCj9BUgctzHpXKnethrURWOGS6J/73x0Rt0kFc+TjhTeky+a+u/8HJUpyBzyNO6uUjjkczvibXCwocqoL7P7gdkio8t6GutaF2EEr9zAvF/goA7hVfzCG1hAhNf6pZD5N7kJpehbDeIZOOhVODOCQi50getJ90htFKXg4dJ8nVg0pmMFJUeu3Ne3uQ6OaNnnIi4PRS14sWMfDYfREiARJq3RIx7tPM+eYRe2dwzhLhPIudyUuCikUQOzXReEggxT3y8JKrft5e9TH8Fw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xgRDEYPCK+trMsZXdsGRCnBQhIYipZs0X53mFNA6ZyBMQMhF4Nk1b47RmewUZ6vAupNIWMBJbi6XMwVyjUcPbVRJGFIqanNS9K7OApdwkJ79sgbd2YRb1HUjogkTiHWGH2pJhqJ+NzB96NFp2JEjDa3O2KQdAADpx9n0CVyIE2Vku0hXh1jMzrFjLXGFdMbSRJ3GwU60GOMeN/YRALPj5rSrSogyqeCtxZ9iAh/68qaMXIkYXtuQkd0eBi4qicIs41VbZYoWSZvlpZ9jXVFoiA9gX5BjESyVUdMU+dJkabSm5lXX9+YKQioiPFueIk3l+kgES9/jTWeWhf/No0ZUapfLqX3TcDX5074tFOniIhVFsx8/V/7FFBQj47P65F/JGFgy2nAunywcEcV799chRkoO/j7/QqhCsfG252plvm+AfpeU3ibyggNM1+ZbAifJ83nBxhxiDCTGJHG96jjUVEEZTOctIfoNPhY4zX52FWFZwoqNiX3rJCx+N2x8itaG8k9CuwifWmWXOXrk94zS/y9iexu6BfN1odoDIoeei3iTLoyfnjrsxALKn4NtIhBjdGLWaUCujASUCWSA5wYaHc/22fs4hsuzNWpVf1nGi4w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ff05d1-a2c4-4e8b-4dc4-08df2129c9aa
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:39:07.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Z1I+cIfg6G8KfA+bDUG29ydkMD+KJqdYK1l7y1hPAfElju8SoZDfZKtOZG7WIuNCrQE6IhdjGqcv+kmrQnwCikd0ytVgMocalTLOBW3mz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030034
X-Authority-Analysis: v=2.4 cv=Cpsq4X4D c=1 sm=1 tr=0 ts=6ac0bf2f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8
 a=KtWhpml6NpAU_BQSLVkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xXmLIrtLxkCByA7PjGc-Pupudk76dZD3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX3IM8bjlfLaBK
 wZEi0E0lYjucCoxY8dqgApO+qf9wclZeEvOck+XGqSGqfNn42ZowDLKs5F9acdtZjbxiIs0j7C1
 O8ZEEW3HZrcGRvhj35LIEZZGvK9TwC0UJnRnhlt1lQeRBdCDpIGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX7h5KjDOOQFm9
 Zhb2i+O74JJjoKdpkw9eYExBo7Q9au8N4pWVcNMsGGG3TCZTA0l+fB51maPcqffG1gdeb8KCHkA
 +xwYhWjjm3I6RKG/XSev+XDYNVDPocWJ+E6K/VX9EJQ5uwHCpvcljl2DUTllWMQG+UeTKv3/ZNo
 Yx9OP+A9YfBi/jVDjDBKTGXKcC++kC1njDEZnMZXf94boc/1zOWGLRW5m7iQjEptyNwhCZTsyit
 bDTqQVlXfk82xpC+L8EPL+hWhfJSq3wDY9tYrKfySkQeA3n8rKJuxElq8hkmdZu2JyMlsEzxL+d
 3D3ujH4YMDkM6FIAZ0vpvspmAq4ZDb6vfD1arCODQz6akLQEn2UXrtdUBft2DP188vZ+JXa3T6F
 d7MPwvf/TIfMH4dgpT1PxC4xeOjooPsEuKbIS/o8DLUpin7ovToZV2LHzRmfmNR5wK6SKyaj3Qy
 KmzuNLae/Vq8DE9+b1g==
X-Proofpoint-GUID: xXmLIrtLxkCByA7PjGc-Pupudk76dZD3


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 9/28/26 12:01 PM, Kris Van Hees via DTrace-devel wrote:

> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libcommon/dt_list.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/libcommon/dt_list.h b/libcommon/dt_list.h
> index e6d4c863..ffe0b963 100644
> --- a/libcommon/dt_list.h
> +++ b/libcommon/dt_list.h
> @@ -19,6 +19,7 @@ typedef struct dt_list {
>  
>  #define	dt_list_prev(elem)	((void *)(((dt_list_t *)(elem))->dl_prev))
>  #define	dt_list_next(elem)	((void *)(((dt_list_t *)(elem))->dl_next))
> +#define dt_list_empty(elem)	(dt_list_next(elem) == NULL)
>  
>  #define dt_in_list(l, e)	(dt_list_next(l) == (e) || dt_list_prev(e))
>  
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

