Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBA221DBD
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 22:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522385; cv=fail; b=lKOQS+7iBxmf0/RYVlilanB4sFJzLenwk1EvDi0kT0e+IwNjc1sDY/WnUiL75jFKVSlVPutsr0JrPX3DQiEb2vHQVc/3A6lsewXY9kqZH02r3MR6YG5TH8WG2F37ZwHvfOO+G4LsrA1I6Uq8wG0XvITc0kboMFVZ+eOfHIfuETs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522385; c=relaxed/simple;
	bh=v8NI//o5y0OT5aPnMUwuR4/TFoAb4CvIcuaKg2cR9yw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eub9AmoJoMN1ELxdbkfFkUSxzfN6ABQ69lJU2sBYGAAxy0o1fOn74Yuu4TXO/3eKOGLlFsw+a7zk+vyAQOKfAoPEhJxFHYyYG8SR1QN9N9Lt80fCIEXAr/1KlohGw9CEv1O9/olpdpmDOHRiERDBgdC6UO26SWFgdeeL19aUysw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cznh2fN2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=na/3UA8Y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cznh2fN2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="na/3UA8Y"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PLfipb009941;
	Tue, 25 Feb 2025 22:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=bu90guc8hlAv12GSvp+4PrwbXGjoEO2j0LnD094YAeA=; b=
	cznh2fN2q/+EBTr5Sf6S7oE6w1T8rWxBMGqVKJNvy7SrYS1kY9LY8nX/eV3JhAN0
	SuiU5epag/gYY0fmg1zGZJxr1WtaGknYkP8z8iX2nK0s+k07nyA8NDEa7zgqjHVZ
	2OhuIg8+wA9uRWDE9lwf+be87DjA8IA1XQJtJT+jWVHLtOI79CDhvCCx1mD0aBjg
	MUrEMzai45VvMxmfkrudeu7oQS14Z1mABfgxjb7f8c8T6YrQzL0gHPNSfvH/rGj4
	dCi7ZmSSJWLbNonl+vg2Idt3w7ChBu/KSlrcAPXeCsPgApY+/PSRalYc/3uk5fNw
	Rxtp3cT5B9jzwLTVkF6oyg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y5c2eh2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 22:26:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PM8sPR012529;
	Tue, 25 Feb 2025 22:26:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y51b5a21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 22:26:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmPNskH0gfJvCiANhtNtC1WIiDfgJEPjAi5thvbexg6jpgtVBcCbJahfe8tGclCGCxJkUiNwLJ2HCbYLbNKqfu6iD2idQ29h6bTwDU2ZEUUAZKzaeIfKJvyMliya8Y4Srd0RCTrpG9dZFUncSitr9asWwyVMbAE4+1hW/oExE4J/fbUrRUrhNOGy3KzRaIWTPKEaIQ8PNepflYAKFjnkecMPWL/Rym6XOxs1joDANLkNvxs4yUGIzPVavqeIwO/LS5sP7P/sIRIqDn/Jh7IihqD7qz7JOgaJbynJO0OW7CdaQ6dICU/tnzJFxtfhXUvN6egRf2fTYtL2+YbpUl0WGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu90guc8hlAv12GSvp+4PrwbXGjoEO2j0LnD094YAeA=;
 b=CK44//bvFNaKh1GEHfzJmBi3EgbW1GKMKEPa5SKDj/W28ZFu/KaJdgtTHqEqaX35Ty1muUvzuo4rgUktJayW22cHsFtdp22W2MJZIo7BbbTlFxDB7PIum/J6MpniGhZzRZnrvSrRrBN5Hk3X+4xX9hCsaXM5efY6irIrtOHNrPAPerRuViDvzKXIimD7KFb0ZoQLUKmPMr/pB3YSW4dt25vIIJ/rp1CUXHHv9cX5ZdlGCQKE/VAM9P9Pcco0djNijqNyQ/ZRj6GuwTKYRqAX1zrftuzIg9PVU6dvA8pz+DB7Dr2FH7nv3cKM1W991KfcIlBZ+ffzx/vMoHRkmQVA7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu90guc8hlAv12GSvp+4PrwbXGjoEO2j0LnD094YAeA=;
 b=na/3UA8Yh/VhB85nWjWTUnadJjB071d9iqO49mhj8/18ZgcIlQUYjJg1ApFxtdix4tZSEkmBtPEVBNIHE1hcBtvMlG6EBz8UyPMNWIy+6DRgPWqtjh9ESvf8X7x3+QxOw1iKQFeytemv6HCtDlnpszEw44JRDEaQz1oO64u8IBA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5885.namprd10.prod.outlook.com (2603:10b6:806:234::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 25 Feb
 2025 22:26:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:26:16 +0000
Message-ID: <2c89d9e9-5844-d480-b268-6ba70bbfddd9@oracle.com>
Date: Tue, 25 Feb 2025 17:26:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] test: allow overriding CC, OBJCOPY, OBJDUMP, NM, ...
Content-Language: en-US
To: Sam James <sam@gentoo.org>, dtrace@lists.linux.dev
References: <cover.1737686990.git.sam@gentoo.org>
 <6df5a570b768a59808b2b197b9b5cdeaed426958.1737686990.git.sam@gentoo.org>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <6df5a570b768a59808b2b197b9b5cdeaed426958.1737686990.git.sam@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:408:ec::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: cf51dbb6-f118-4812-8521-08dd55eb6b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzlxUjdlLzd1bnlha2hzZ0hFWm8rYlhaVDFpL3UxVXRNMTExYVdiQXdUMzRv?=
 =?utf-8?B?dWVqZ1R5MFZkVGxmSi9aYisxeE84UHE4VzVMOHJYeWNOREEvY2RZaWVoTmRo?=
 =?utf-8?B?aGlhQmx3RFhZTjcvaGdGSDd3bzQyNGZ0M3dKeis4WkZFZEE4Z2l0K3p6NzZU?=
 =?utf-8?B?SlBoS0JqWTlMUG8wVjVyV0IxenJ2WVlDak90NWRrS1pqTm50R0lLdGdNUjlJ?=
 =?utf-8?B?Q205WVZUN25hcVNlWFlSL1kweGJOd0lRbEtOYUNmTldlSUcrSUlFRFRNN0Yz?=
 =?utf-8?B?MHRJSDRTbW83Q1I0a3M1NnZhQVBmbHB0ZVlyYTMwekRrUWRPNjBHUUZhMGI2?=
 =?utf-8?B?ZXZaRUNmSVBNTE1hdXNOUU15bmtMR0lNdENzUDJLVVNOaUl6RElScC93cUhv?=
 =?utf-8?B?QlJmRlY5dENBN2c3VmtNd3lVN1dLdXhKZW5wR2l0cDhka3BFVjhIQ0VRVER4?=
 =?utf-8?B?UVpPYVpob1BFTFM5S1RKdEFCTUw5dVhMc1I0QmZEVmx3anlPU0tCWG1PWUFs?=
 =?utf-8?B?ZE1NaE1pWXpWU2NWRlBxclFOL0JJRUgzcXZtazZudTJIdXhPR05icVZRMEFZ?=
 =?utf-8?B?YVpMb1FrUnR6bVVBaVUwS09HYit4NlM3S0FrV0poTmhObldLQVl3VlJYTTBV?=
 =?utf-8?B?UFpFVEErZmpJZkhZZnNnSXRNOCt3ZjNCdnk2MUZ1RXhMNmprUUNqYWVHSzQ4?=
 =?utf-8?B?NzBPOWlWU1BMREdJZ1dMRCtLMFJDcHpyckZJSU1weUFUYzBqMW0zdmFIUnhl?=
 =?utf-8?B?ckxZeFEyaS8vcStibmd6YTRoR1UrSU9oSzhzalVIeDJPTXpKWHY5Z0RYalJE?=
 =?utf-8?B?czlBWTJQVGhKNGxRcUJMRDFZbjVwLzFMZUFOZHo5bmhFbFVKTnJSWVcvVEhI?=
 =?utf-8?B?bWdUZFZvUVNnOTFLMVMxMjl5L1hRTTBTcGo4L3FNdWhhckNKV1g4R0FJYzJS?=
 =?utf-8?B?WXNUcjlBeHA5SWYwU3ZscCtuYWZINWkxMlBPTTdiQXdpMXJ5WnVaZXJoK3B1?=
 =?utf-8?B?OWRIeStvTWxGMVBzczRHNVU1S0hmTXZIM1RjNXRXVnZwdTcvbFc0TmxJVGFa?=
 =?utf-8?B?NjVFc2ZJb2tkZXdQRnJqQlJXZmlCcTB0TEVDaGhtQmxNNDVmaUVmUmVDOTBI?=
 =?utf-8?B?Q0NrRFJabjJaSEFRN2VTZ01ZdUt0eWYrQzlUMERya2pYLzdRaHFkd0lsZjFO?=
 =?utf-8?B?Qlc0TWo5Z3lnWkkrajFqdWh3YWMvK0NEU2JwaitFODhRblpNNi93WE50ZUJ1?=
 =?utf-8?B?d0dOQ0FCODNtWEZGbWlNK0NSUUExd0k3eXQ2WmpLNVhOZWN0TEsxdlFEOWNP?=
 =?utf-8?B?T1k2SXFrRmdiZlpqaGxjeFYyNHRnSlNNSmZLSFZXVDdkb0QrMEkxWGNiTFRV?=
 =?utf-8?B?VUFFWklFMi9SYzhFbXc5NDB2WWtWZHlwWm1WRENsL3A3VHBwU2hLZDhOLzc3?=
 =?utf-8?B?VDlRMEFWMzJUOUh0aTlJZTFEQ1RDUDNyTGtaMWpJL2FFZ3NMVWNwM1VQYWNs?=
 =?utf-8?B?VG15SExMZldVQnZpWHJ5WFhObmp6Q0hHcFNQRnNXWUdlYmllVFkyeGM2SWRG?=
 =?utf-8?B?RWdXUTNjT3pIVkJqeWZnNkpXSlRUVnd3VzBZR2cyODNCeW9uTUxDS1pLQU5L?=
 =?utf-8?B?bkVBNUM5dVFMd3NTLzlvSGZkQkFqdjJydWhTMUVWYlNJR1cxdDVFczdRb1R1?=
 =?utf-8?B?cWNPbWQwSEREbHZmTzhVcndibzN1Q3cxNHJmU3VvYzNTVkpFZ0hZNHpjUGtu?=
 =?utf-8?B?dEl1ZTJPTTlGdHlJYkZRV1I0R1M3Ymk4T2hOSGlsZjFyTURyU2ttZTBHWTFC?=
 =?utf-8?B?SDJYUFZvb0R1VEpjOGZnbXViUW9FanY0WEI2YXZxQkpHUWp0dllwTzFFYjJa?=
 =?utf-8?Q?QNrtX69J8KKdo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDlaejRoUEd5a29wcmc3WFFGbzBLbWlCVU1vakE4UmlMQzZhRzM3THNyb3dM?=
 =?utf-8?B?dmVLUUh4VnU4cUVYM0pVNUdDZnlXcjdjZEJkZmpROHQ1VE92Ty9FTW0zN0U5?=
 =?utf-8?B?aVdzc1VxVWNDNzVaK1RVUTltdDFnb0tRUFg1VUViVFFSNnNCYjNiOXVCamZU?=
 =?utf-8?B?K3VFLzZhaTE5V3NHdGNKUUw4ZUtuVHZoWXg4angwREJCUXIzaGVSV2ZuWXV2?=
 =?utf-8?B?SURWRC9NbUh0R20xR1MyaHg3bmhoR0s4RFFtakI0eFlXd3ozR0hFc0p5TEJt?=
 =?utf-8?B?NkFGSFc3U1EvbE9zL1M5dEREMEF6MjRDeksxMVRiSlFMSmlIa0xGTFE3MEVN?=
 =?utf-8?B?Nmk1aXpoRHNTcXVGdEc4SFlyWGM2UVBXUnp3aTE5R25QczhtVlF0WnYwdUFM?=
 =?utf-8?B?RnAzMmpodm1UcVJDRlVwUHJUbXNtNUovOFgwNmZRazZxdGNLVkhJbkZzQVM2?=
 =?utf-8?B?akhaUFA0L21ZM0dldHdDRDZsUnBZS0pyUzNXTmIremtOd1NnMXZLdmlacUNk?=
 =?utf-8?B?ZWFHQ2xOcEFBbzhWcEc0ZXNkcWp6YTZTRU1Hcm9vN0tQZk5sOVFPV0tVMGJu?=
 =?utf-8?B?UWNmWVcyY1hsL1BkQ0t6clVOVXNUeDVzUEtqOW9qVzJ4Y1I3YUFXZXVVTyt3?=
 =?utf-8?B?Zm5tbXBSakFIbDlsRlBuMUxaZmlUT0JuZzdlSk9BSksyNENHS0ZKZktIWmxQ?=
 =?utf-8?B?MDZKQmgvMlU5SVowNS9URjhoMUwwNk1xTnFoSW1iQ00wbTk1RDI0M0k4TElT?=
 =?utf-8?B?Y2J5ckFWRVpSc1k1NjFFb015RTRNUmVjRUMwSTJya3FXS0ZJc3VZczVXMVFE?=
 =?utf-8?B?d1FBQVRmbVFCemJDTHQ4czhCaWlobkpGVXliMlJyd3BDNit2eHU1OWtYU0dl?=
 =?utf-8?B?ZHdUckJDQUZhTFRjWkpEZjc5c2FMM3FxOGxGRUhMNUF4aVdJdmE2S0ZlUVJ1?=
 =?utf-8?B?UHZhc1lBWCs3UlkwbHFZMU1ERmNVTHF1UFp6RUpFZHlDZWxUNk42c3M3d0lm?=
 =?utf-8?B?VXI3MDFBckdWN0FxSDZxS2Z0VU9FL3lweGp4enB4elE3N1R5RVZSVzRUd2M5?=
 =?utf-8?B?d0lUanVQTno5QThYTTUzYTN6WXRmK0RoZlArK2ZiZGFBQ0pxSS9xRjBuc0Mv?=
 =?utf-8?B?TVJLOUVFS2ZSME5hYWFLNVRZcCtaQnRtUkNzWk9MU3FuTnFqZ2kyVW1qbGsv?=
 =?utf-8?B?Vk5zSTFYUkhkTm5xN053NXFKYW9aY3dzRUsvNWVTSTB6b0lUWkNJUzltYTVJ?=
 =?utf-8?B?UnJkOVl5aWYzWTh0SGg4S1A4VVVOWEJoTWd0N3gwVDgvWm5NWURCLy80aS96?=
 =?utf-8?B?L0tadW9tVW5zNCtGYWVVNy9qSlNTcHg4SU1EZWduZzlXTkFJQlZjY0lLM0pM?=
 =?utf-8?B?M1hIN0poakQvaEJsOHhpRXV4d0d5aFpvbWhEc1VrL2l0Mkl0YjFKbHlDWDVi?=
 =?utf-8?B?TG9OOExUMmhMOXdac1NIcFhjTVNVSnhaVmpGNXorTFh4VTN5Q1ZOMXljM2FR?=
 =?utf-8?B?K0FDV2FvSjhCNmZ5SUd5cGRXdUhoNklhQ2NkR0xRWVFJSHN6NmtidDREN3Jk?=
 =?utf-8?B?Z2gxYnJvZ2lncmE0b0JZVHRLZnV2c3gyRkdZU1ZyU3hZR1dkVnZBckw1WWQy?=
 =?utf-8?B?cElFZFBYeTFGQXphRWRBQWI2dlJxbHl1bC9jK2hsTFlFQnN0QUVHRjhkL3pa?=
 =?utf-8?B?TUxMTy9wTFl6Z21WUnpqMVhNRzB5dVZ6UFBTNmkrdDVqT0tCZWdudnE3OWJZ?=
 =?utf-8?B?TDRsZi8xU051TkVlSG9MQ1FLd2liWk1xZVN2MGZYUW1DNkdldGNXVzdzbTR3?=
 =?utf-8?B?cHE0bHA1SGhHLyt4YUliTG9hdG5TbE5wWmtJQlRndnhFUThqazFsYkZqa1Vs?=
 =?utf-8?B?UGRwekpTWVo2dWtGaTRNd2R4Y1pnNkpGOVlpRU1XSjlIdXF4KzVrcjMvQVor?=
 =?utf-8?B?dnN1cHp5M1R0cllCVEhURHZkTjk3dVhHZDB6QkJuN0dzYnR4Z3daRDVKMjZT?=
 =?utf-8?B?WFdoU0RRaVdxSEltbC9BeXRJS1drQzUxdU5vdHE0b1V6UWNoS3FnZ0xEdTVQ?=
 =?utf-8?B?SFZ5VUhVRVErK1poQUE2L0J3NFlPUHlyQldYSzY1QkJmdVRuQXNhS3hCUTNo?=
 =?utf-8?Q?k5E59lt7BkhgoN1sfop1Zn8jh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M/u6QJGf8i9slD7bPwvaCGUgAAYkva9w7G06O+jheEJZqd/TcSUiIImbxJgNUi2u+bEva9H97eqRhSZu8H8D4NoYCyrp/5pXu/r2qpH3R4DQYH1vq0+DEnLHn/NEJT8eULPAjJ+HPF+TTYeGVsJ2u23LKZUUFgf9v/AYcZ3gIYz+j4fd2XVOQyFMjOteuE/+XaKasdNDQhPq4lhQXR7HcChrsKPnTsFf3ptky+IxsVyN845+glWqzSO2dCor9X45Dktn3mkAG+mhm3xVn4exEOR8lKVIy6PpmKZMMisFpo/btyIsIy630toz7nxBDkx+3q0OEiLUQrc0kPEFu9XIeEA+AdZsLeiP2kgLdfHQY2nlRqooCn3MFJWsQozBuOXNFlQFVmDIT13jltkpiCgfMjcM/AJnuL0C1fDRIzUYcVPu1OqGWIQv36teYjRoqTuh074YpljX1J8o/As0O5koyu8QoRKLxXN8bxBNUOC593DGMrbbUAn1BA6wP6BUh+RCtqtjHCH2nJcKYWzhFWbYdA6L5O3JEJMYH1lcxkXUMuElZAZP/k/8lgoZfad40enNfyTgB162p76zcn8SxtBJ5qzgX3HZg4Q89EGFl8OH/ok=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf51dbb6-f118-4812-8521-08dd55eb6b0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:26:16.0990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBfOlHCU9Q+biemV3etMZnE6cfB3wiV/YeJMsWN7TUYF9laJYBYy2358S3Wb11AP9pvW7/cCL9jMUFrrlN/TnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5885
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502250133
X-Proofpoint-ORIG-GUID: tUBRj0ujbWVveWefKdgd9ay_f-gVXYrE
X-Proofpoint-GUID: tUBRj0ujbWVveWefKdgd9ay_f-gVXYrE

I'm open to signing off on this patch, but I have some questions:

*)  You said you'd do a full test run.  Did that happen?

*)  If objdump is used several times in a script, how about setting it 
once and then reusing the same definition?  E.g.,
         test/unittest/bitfields/tst.bitfield-offset.x
         test/unittest/options/tst.ctypes.sh
         test/unittest/options/tst.dtypes.sh
     Same for nm:
         test/unittest/usdt/tst.eliminate.sh
     But wait, before you answer that question...

*)  How about just setting
         CC=...
         NM=...
         OBJCOPY=...
         OBJDUMP=...
         READELF=...
     "once" in runtest.sh?  Then use $CC, et al., everywhere, rather 
than replicating the assignments in all those different files.

*)  By the way, more bare objdump instances have crept into origin/dev:
         test/unittest/usdt/tst.pidprobes.sh
     Sorry.  I guess I'm to blame.  (Recurring theme here.  Oops. Sorry.)

*)  Some files still have "CC=/usr/bin/gcc":
     test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
     test/unittest/usdt/tst.dlclose4.sh
     test/unittest/usdt/tst.enable_pid.sh
     test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh

*)  Some files still have "gcc" hardwired in:
     test/stress/options/tst.cpu-syscall.sh
     test/unittest/funcs/copyout/tst.copyout.sh
     test/unittest/funcs/copyoutstr/tst.copyoutstr.sh
     test/unittest/options/tst.cpu-syscall.sh
     test/unittest/pid/tst.offsets.sh
     test/unittest/usdt/tst.badguess.x
     test/unittest/usdt/tst.nusdtprobes.sh

*)  Some still have "cc" hardwired in:
     test/unittest/pid/tst.provregex1.sh
     test/unittest/pid/tst.provregex2.sh
     test/unittest/pid/tst.provregex3.sh
     test/unittest/pid/tst.provregex4.sh
     test/unittest/usdt/tst.enable_pid.sh
     test/unittest/usdt/tst.pidprobes.sh

*)  A lot of files need updated Copyright years:
     test/expensive/locking/tst.DestructionDoubleUnlock.sh
     test/internals/headers/tst.header-endianness.sh
     test/unittest/aggs/tst.aggmod_full2.sh
     test/unittest/arrays/tst.uregsarray-check.sh
     test/unittest/builtinvar/tst.errno3.sh
     test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
     test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
     test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
     test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
     test/unittest/misc/tst.include.sh
     test/unittest/options/tst.ctypes.sh
     test/unittest/options/tst.dtypes.sh
     test/unittest/options/tst.linktype.sh
     test/unittest/options/tst.strip.sh
     test/unittest/pid/tst.offsets.sh
     test/unittest/usdt/tst.allargs.sh
     test/unittest/usdt/tst.badguess.sh
     test/unittest/usdt/tst.dlclose1.sh
     test/unittest/usdt/tst.dlclose2.sh
     test/unittest/usdt/tst.dlclose3.sh
     test/unittest/usdt/tst.eliminate.sh
     test/unittest/usdt/tst.enabled.sh
     test/unittest/usdt/tst.enabled2.sh
     test/unittest/usdt/tst.entryreturn.sh
     test/unittest/usdt/tst.exec-dof-replacement.sh
     test/unittest/usdt/tst.execstack.sh
     test/unittest/usdt/tst.fork.sh
     test/unittest/usdt/tst.guess32.sh
     test/unittest/usdt/tst.guess64.sh
     test/unittest/usdt/tst.header.sh
     test/unittest/usdt/tst.lingering.sh
     test/unittest/usdt/tst.link-idempotence.sh
     test/unittest/usdt/tst.linkpriv.sh
     test/unittest/usdt/tst.linkunpriv.sh
     test/unittest/usdt/tst.manyprobes.sh
     test/unittest/usdt/tst.manyprocs.sh
     test/unittest/usdt/tst.multiple.sh
     test/unittest/usdt/tst.multitrace.sh
     test/unittest/usdt/tst.onlyenabled.sh
     test/unittest/usdt/tst.pie.sh
     test/unittest/usdt/tst.reeval.sh
     test/unittest/usdt/tst.static.sh
     test/unittest/usdt/tst.static2.sh
     test/unittest/usdt/tst.user.sh
     test/utils/workload_analyze_loop.sh

On 1/23/25 21:49, Sam James wrote:
> Bug: https://github.com/oracle/dtrace-utils/issues/75
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
>   test/expensive/locking/tst.DestructionDoubleUnlock.sh   | 2 +-
>   test/internals/headers/tst.header-endianness.sh         | 2 +-
>   test/unittest/aggs/tst.aggmod_full2.sh                  | 2 +-
>   test/unittest/arrays/tst.uregsarray-check.sh            | 2 +-
>   test/unittest/bitfields/tst.bitfield-offset.x           | 8 ++++----
>   test/unittest/builtinvar/tst.errno3.sh                  | 2 +-
>   test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh     | 2 +-
>   test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh   | 2 +-
>   test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh     | 2 +-
>   test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh | 2 +-
>   test/unittest/misc/tst.include.sh                       | 2 +-
>   test/unittest/options/tst.ctypes.sh                     | 6 +++---
>   test/unittest/options/tst.dtypes.sh                     | 6 +++---
>   test/unittest/options/tst.linktype.sh                   | 4 ++--
>   test/unittest/options/tst.strip.sh                      | 4 ++--
>   test/unittest/pid/tst.offsets.sh                        | 2 +-
>   test/unittest/usdt/tst.allargs.sh                       | 2 +-
>   test/unittest/usdt/tst.badguess.sh                      | 2 +-
>   test/unittest/usdt/tst.dlclose1.sh                      | 2 +-
>   test/unittest/usdt/tst.dlclose2.sh                      | 2 +-
>   test/unittest/usdt/tst.dlclose3.sh                      | 2 +-
>   test/unittest/usdt/tst.eliminate.sh                     | 6 +++---
>   test/unittest/usdt/tst.enabled.sh                       | 2 +-
>   test/unittest/usdt/tst.enabled2.sh                      | 2 +-
>   test/unittest/usdt/tst.entryreturn.sh                   | 2 +-
>   test/unittest/usdt/tst.exec-dof-replacement.sh          | 2 +-
>   test/unittest/usdt/tst.execstack.sh                     | 6 +++---
>   test/unittest/usdt/tst.fork.sh                          | 2 +-
>   test/unittest/usdt/tst.guess32.sh                       | 2 +-
>   test/unittest/usdt/tst.guess64.sh                       | 2 +-
>   test/unittest/usdt/tst.header.sh                        | 2 +-
>   test/unittest/usdt/tst.lingering.sh                     | 2 +-
>   test/unittest/usdt/tst.link-idempotence.sh              | 2 +-
>   test/unittest/usdt/tst.linkpriv.sh                      | 2 +-
>   test/unittest/usdt/tst.linkunpriv.sh                    | 2 +-
>   test/unittest/usdt/tst.manyprobes.sh                    | 2 +-
>   test/unittest/usdt/tst.manyprocs.sh                     | 2 +-
>   test/unittest/usdt/tst.multiple.sh                      | 2 +-
>   test/unittest/usdt/tst.multitrace.sh                    | 2 +-
>   test/unittest/usdt/tst.onlyenabled.sh                   | 2 +-
>   test/unittest/usdt/tst.pie.sh                           | 2 +-
>   test/unittest/usdt/tst.reeval.sh                        | 2 +-
>   test/unittest/usdt/tst.static.sh                        | 2 +-
>   test/unittest/usdt/tst.static2.sh                       | 2 +-
>   test/unittest/usdt/tst.user.sh                          | 2 +-
>   test/utils/workload_analyze_loop.sh                     | 2 +-
>   46 files changed, 59 insertions(+), 59 deletions(-)
>
> diff --git a/test/expensive/locking/tst.DestructionDoubleUnlock.sh b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
> index c9b9eadc..c0f7156a 100755
> --- a/test/expensive/locking/tst.DestructionDoubleUnlock.sh
> +++ b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
> @@ -28,7 +28,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/destruction-double-unlock.$$.$RANDOM"
> diff --git a/test/internals/headers/tst.header-endianness.sh b/test/internals/headers/tst.header-endianness.sh
> index e45cc597..317ea90c 100755
> --- a/test/internals/headers/tst.header-endianness.sh
> +++ b/test/internals/headers/tst.header-endianness.sh
> @@ -10,7 +10,7 @@
>   set -e
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   OLDDIRNAME=${PWD}
>   CFLAGS="-I${OLDDIRNAME}/include -I${OLDDIRNAME}/uts/common"
>   
> diff --git a/test/unittest/aggs/tst.aggmod_full2.sh b/test/unittest/aggs/tst.aggmod_full2.sh
> index 66cfc002..48988a1a 100755
> --- a/test/unittest/aggs/tst.aggmod_full2.sh
> +++ b/test/unittest/aggs/tst.aggmod_full2.sh
> @@ -17,7 +17,7 @@
>   ##
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/aggs-aggmod_full2.$$.$RANDOM"
> diff --git a/test/unittest/arrays/tst.uregsarray-check.sh b/test/unittest/arrays/tst.uregsarray-check.sh
> index f55d36d0..648072b4 100755
> --- a/test/unittest/arrays/tst.uregsarray-check.sh
> +++ b/test/unittest/arrays/tst.uregsarray-check.sh
> @@ -7,7 +7,7 @@
>   #
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/arrays-uregsarray-check.$$.$RANDOM"
> diff --git a/test/unittest/bitfields/tst.bitfield-offset.x b/test/unittest/bitfields/tst.bitfield-offset.x
> index ae57c2b5..b1f21da4 100755
> --- a/test/unittest/bitfields/tst.bitfield-offset.x
> +++ b/test/unittest/bitfields/tst.bitfield-offset.x
> @@ -12,8 +12,8 @@
>   # skip the test, since we can't possibly tell what it was
>   # generated by.
>   
> -if ! objdump --ctf=.ctf --ctf-parent=shared_ctf /bin/true > /dev/null 2>&1 && \
> -    LANG=C objdump --ctf=.ctf --ctf-parent=shared_ctf /bin/true 2>&1 | \
> +if ! ${OBJDUMP:-objdump} --ctf=.ctf --ctf-parent=shared_ctf /bin/true > /dev/null 2>&1 && \
> +    LANG=C ${OBJDUMP:-objdump} --ctf=.ctf --ctf-parent=shared_ctf /bin/true 2>&1 | \
>       grep 'unrecognized option' > /dev/null 2>&1; then
>       exit 2
>   fi
> @@ -21,7 +21,7 @@ fi
>   ctfa=$tmpdir/vmlinux.ctfa
>   trap "rm -f $ctfa" EXIT ERR
>   
> -objcopy --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
> +${OBJCOPY:-objcopy} --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
>   
> -objdump --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
> +${OBJDUMP:-objdump} --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
>       gawk '/Version: 3/ { exit 1; } /Version: / { exit 0; }'
> diff --git a/test/unittest/builtinvar/tst.errno3.sh b/test/unittest/builtinvar/tst.errno3.sh
> index 7546152f..5985a0d3 100755
> --- a/test/unittest/builtinvar/tst.errno3.sh
> +++ b/test/unittest/builtinvar/tst.errno3.sh
> @@ -7,7 +7,7 @@
>   #
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   
>   DIRNAME="$tmpdir/builtinvar-errno3.$$.$RANDOM"
>   mkdir -p $DIRNAME
> diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> index f8083f2c..5de50001 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> @@ -22,7 +22,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/list-probes-func-usdt.$$.$RANDOM"
> diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> index dc6cb100..0c0694ce 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> @@ -22,7 +22,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/list-probes-module-usdt.$$.$RANDOM"
> diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> index 59b8dca5..21e6b841 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> @@ -22,7 +22,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/list-probes-name-usdt.$$.$RANDOM"
> diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> index 64fc185d..4d325386 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> @@ -22,7 +22,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/list-probes-provider-usdt.$$.$RANDOM"
> diff --git a/test/unittest/misc/tst.include.sh b/test/unittest/misc/tst.include.sh
> index 9d9989a3..738b4794 100755
> --- a/test/unittest/misc/tst.include.sh
> +++ b/test/unittest/misc/tst.include.sh
> @@ -13,7 +13,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIR="$tmpdir/misc-include.$$.$RANDOM"
> diff --git a/test/unittest/options/tst.ctypes.sh b/test/unittest/options/tst.ctypes.sh
> index 30a6c9b1..19c76792 100755
> --- a/test/unittest/options/tst.ctypes.sh
> +++ b/test/unittest/options/tst.ctypes.sh
> @@ -14,14 +14,14 @@ if [ ! -r $tmpdir/ctypes.ctf ]; then
>   	exit 1
>   fi
>   
> -if objdump --help | grep ctf >/dev/null; then
> -	objcopy --add-section=.ctf=$tmpdir/ctypes.ctf /bin/true $tmpdir/ctypes.o
> +if ${OBJDUMP:-objdump} --help | grep ctf >/dev/null; then
> +	${OBJCOPY:-objcopy} --add-section=.ctf=$tmpdir/ctypes.ctf /bin/true $tmpdir/ctypes.o
>   	if [ $? -ne 0 ]; then
>   		echo "ERROR: Failed to create ELF object from ctypes.ctf"
>   		exit 1
>   	fi
>   
> -	objdump --ctf=.ctf $tmpdir/ctypes.o | \
> +	${OBJDUMP:-objdump} --ctf=.ctf $tmpdir/ctypes.o | \
>   		gawk '/CTF_VERSION/ { found = 1; next; }
>   		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
>   		     END { print "C CTF data" (found ? " " : " NOT ") "found";
> diff --git a/test/unittest/options/tst.dtypes.sh b/test/unittest/options/tst.dtypes.sh
> index 441de098..658793c7 100755
> --- a/test/unittest/options/tst.dtypes.sh
> +++ b/test/unittest/options/tst.dtypes.sh
> @@ -14,14 +14,14 @@ if [ ! -r $tmpdir/dtypes.ctf ]; then
>   	exit 1
>   fi
>   
> -if objdump --help | grep ctf >/dev/null; then
> -	objcopy --add-section=.ctf=$tmpdir/dtypes.ctf /bin/true $tmpdir/dtypes.o
> +if ${OBJDUMP:-objdump} --help | grep ctf >/dev/null; then
> +	${OBJCOPY:-objcopy} --add-section=.ctf=$tmpdir/dtypes.ctf /bin/true $tmpdir/dtypes.o
>   	if [ $? -ne 0 ]; then
>   		echo "ERROR: Failed to create ELF object from dtypes.ctf"
>   		exit 1
>   	fi
>   
> -	objdump --ctf=.ctf $tmpdir/dtypes.o | \
> +	${OBJDUMP:-objdump} --ctf=.ctf $tmpdir/dtypes.o | \
>   		gawk '/CTF_VERSION/ { found = 1; next; }
>   		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
>   		     END { print "D CTF data" (found ? " " : " NOT ") "found";
> diff --git a/test/unittest/options/tst.linktype.sh b/test/unittest/options/tst.linktype.sh
> index 564d9b0f..15bc649b 100755
> --- a/test/unittest/options/tst.linktype.sh
> +++ b/test/unittest/options/tst.linktype.sh
> @@ -9,7 +9,7 @@
>   # @@nosort
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/linktype.$$.$RANDOM"
> @@ -61,7 +61,7 @@ function mytest() {
>   	fi
>   
>   	# report whether the file format is recognized
> -	objdump --file-headers prov.o |& gawk '
> +	${OBJDUMP:-objdump} --file-headers prov.o |& gawk '
>   	    /format not recognized/ {
>   		print "objdump does NOT recognize file format";
>   		exit(0);
> diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
> index 054955fb..1124ccc5 100755
> --- a/test/unittest/options/tst.strip.sh
> +++ b/test/unittest/options/tst.strip.sh
> @@ -7,7 +7,7 @@
>   #
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/strip.$$.$RANDOM"
> @@ -48,7 +48,7 @@ fi
>   
>   # link with and without -xstrip, dumping the DOF section
>   
> -objdump="objdump --full-contents --section=.SUNW_dof prov.o"
> +objdump="${OBJDUMP:-objdump} --full-contents --section=.SUNW_dof prov.o"
>   
>   $dtrace $dt_flags -G -xstrip -s prov.d test.o
>   if [ $? -ne 0 ]; then
> diff --git a/test/unittest/pid/tst.offsets.sh b/test/unittest/pid/tst.offsets.sh
> index cc1a440d..795553b0 100755
> --- a/test/unittest/pid/tst.offsets.sh
> +++ b/test/unittest/pid/tst.offsets.sh
> @@ -85,7 +85,7 @@ fi
>   # hot and cold instructions in the function.
>   #
>   
> -objdump -d a.out | gawk '
> +${OBJDUMP:-objdump} -d a.out | gawk '
>   BEGIN {
>   	pc0 = 0;	# First PC of loopfunc()
>   	pcjump = 0;	# PC of the jump
> diff --git a/test/unittest/usdt/tst.allargs.sh b/test/unittest/usdt/tst.allargs.sh
> index 179552b6..3404b62b 100755
> --- a/test/unittest/usdt/tst.allargs.sh
> +++ b/test/unittest/usdt/tst.allargs.sh
> @@ -15,7 +15,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="-std=gnu89 $test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.badguess.sh b/test/unittest/usdt/tst.badguess.sh
> index b6ff9e23..45044c32 100755
> --- a/test/unittest/usdt/tst.badguess.sh
> +++ b/test/unittest/usdt/tst.badguess.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.dlclose1.sh b/test/unittest/usdt/tst.dlclose1.sh
> index a6bad02b..a62da006 100755
> --- a/test/unittest/usdt/tst.dlclose1.sh
> +++ b/test/unittest/usdt/tst.dlclose1.sh
> @@ -29,7 +29,7 @@
>   # The second should not.
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/usdt-dlclose1.$$.$RANDOM"
> diff --git a/test/unittest/usdt/tst.dlclose2.sh b/test/unittest/usdt/tst.dlclose2.sh
> index 907685a6..1f7064ad 100755
> --- a/test/unittest/usdt/tst.dlclose2.sh
> +++ b/test/unittest/usdt/tst.dlclose2.sh
> @@ -15,7 +15,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/usdt-dlclose2.$$.$RANDOM"
> diff --git a/test/unittest/usdt/tst.dlclose3.sh b/test/unittest/usdt/tst.dlclose3.sh
> index 0b70906f..f65ba4e6 100755
> --- a/test/unittest/usdt/tst.dlclose3.sh
> +++ b/test/unittest/usdt/tst.dlclose3.sh
> @@ -21,7 +21,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS=
>   
>   DIRNAME="$tmpdir/usdt-dlclose3.$$.$RANDOM"
> diff --git a/test/unittest/usdt/tst.eliminate.sh b/test/unittest/usdt/tst.eliminate.sh
> index e74896bb..b0174fca 100755
> --- a/test/unittest/usdt/tst.eliminate.sh
> +++ b/test/unittest/usdt/tst.eliminate.sh
> @@ -16,7 +16,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> @@ -71,13 +71,13 @@ if [ $? -ne 0 ]; then
>   	exit 1
>   fi
>   
> -nm test.o | grep \$dtrace > /dev/null
> +${NM:-nm} test.o | grep \$dtrace > /dev/null
>   if [ $? -ne 0 ]; then
>   	echo "no temporary symbols in the object file" >& 2
>   	exit 1
>   fi
>   
> -nm test | grep \$dtrace > /dev/null
> +${NM:-nm} test | grep \$dtrace > /dev/null
>   if [ $? -eq 0 ]; then
>   	echo "failed to eliminate temporary symbols" >& 2
>   	exit 1
> diff --git a/test/unittest/usdt/tst.enabled.sh b/test/unittest/usdt/tst.enabled.sh
> index 4cd1eccd..d444a1fd 100755
> --- a/test/unittest/usdt/tst.enabled.sh
> +++ b/test/unittest/usdt/tst.enabled.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.enabled2.sh b/test/unittest/usdt/tst.enabled2.sh
> index 1732085e..7d7648fa 100755
> --- a/test/unittest/usdt/tst.enabled2.sh
> +++ b/test/unittest/usdt/tst.enabled2.sh
> @@ -15,7 +15,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.entryreturn.sh b/test/unittest/usdt/tst.entryreturn.sh
> index 84af9672..3c0cba9a 100755
> --- a/test/unittest/usdt/tst.entryreturn.sh
> +++ b/test/unittest/usdt/tst.entryreturn.sh
> @@ -13,7 +13,7 @@ fi
>   # @@xfail: dtv2, no wildcard usdt probes yet
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
> index 6d547cce..191f749f 100755
> --- a/test/unittest/usdt/tst.exec-dof-replacement.sh
> +++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
> @@ -14,7 +14,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.execstack.sh b/test/unittest/usdt/tst.execstack.sh
> index e7b59105..75586dfb 100755
> --- a/test/unittest/usdt/tst.execstack.sh
> +++ b/test/unittest/usdt/tst.execstack.sh
> @@ -11,11 +11,11 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
> -OBJDUMP=/usr/bin/objdump
> -READELF=/usr/bin/readelf
> +OBJDUMP=${OBJDUMP:-/usr/bin/objdump}
> +READELF=${READELF:-/usr/bin/readelf}
>   
>   DIRNAME="$tmpdir/usdt-execstack.$$.$RANDOM"
>   mkdir -p $DIRNAME
> diff --git a/test/unittest/usdt/tst.fork.sh b/test/unittest/usdt/tst.fork.sh
> index 9b2b372a..75cf99fd 100755
> --- a/test/unittest/usdt/tst.fork.sh
> +++ b/test/unittest/usdt/tst.fork.sh
> @@ -12,7 +12,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.guess32.sh b/test/unittest/usdt/tst.guess32.sh
> index 7a130e17..8ae4fb00 100755
> --- a/test/unittest/usdt/tst.guess32.sh
> +++ b/test/unittest/usdt/tst.guess32.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.guess64.sh b/test/unittest/usdt/tst.guess64.sh
> index 23b7a241..1141d5e4 100755
> --- a/test/unittest/usdt/tst.guess64.sh
> +++ b/test/unittest/usdt/tst.guess64.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.header.sh b/test/unittest/usdt/tst.header.sh
> index c5e411be..05813c1e 100755
> --- a/test/unittest/usdt/tst.header.sh
> +++ b/test/unittest/usdt/tst.header.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.lingering.sh b/test/unittest/usdt/tst.lingering.sh
> index 079acb75..d1a1b03c 100755
> --- a/test/unittest/usdt/tst.lingering.sh
> +++ b/test/unittest/usdt/tst.lingering.sh
> @@ -14,7 +14,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.link-idempotence.sh b/test/unittest/usdt/tst.link-idempotence.sh
> index 643ba10c..62f2a518 100755
> --- a/test/unittest/usdt/tst.link-idempotence.sh
> +++ b/test/unittest/usdt/tst.link-idempotence.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.linkpriv.sh b/test/unittest/usdt/tst.linkpriv.sh
> index 2c89f5d4..0e95dcac 100755
> --- a/test/unittest/usdt/tst.linkpriv.sh
> +++ b/test/unittest/usdt/tst.linkpriv.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="-std=gnu99 $test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.linkunpriv.sh b/test/unittest/usdt/tst.linkunpriv.sh
> index 9ef38639..1775db82 100755
> --- a/test/unittest/usdt/tst.linkunpriv.sh
> +++ b/test/unittest/usdt/tst.linkunpriv.sh
> @@ -13,7 +13,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   
>   DIRNAME="$tmpdir/usdt-linkunpriv.$$.$RANDOM"
> diff --git a/test/unittest/usdt/tst.manyprobes.sh b/test/unittest/usdt/tst.manyprobes.sh
> index c0deb8df..080d9cda 100755
> --- a/test/unittest/usdt/tst.manyprobes.sh
> +++ b/test/unittest/usdt/tst.manyprobes.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   DIRNAME="$tmpdir/usdt-manyprobes.$$.$RANDOM"
> diff --git a/test/unittest/usdt/tst.manyprocs.sh b/test/unittest/usdt/tst.manyprocs.sh
> index 58550302..05cc8717 100755
> --- a/test/unittest/usdt/tst.manyprocs.sh
> +++ b/test/unittest/usdt/tst.manyprocs.sh
> @@ -14,7 +14,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.multiple.sh b/test/unittest/usdt/tst.multiple.sh
> index 440a7d7b..e6eab3e5 100755
> --- a/test/unittest/usdt/tst.multiple.sh
> +++ b/test/unittest/usdt/tst.multiple.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
> index 262c7828..b73dd830 100755
> --- a/test/unittest/usdt/tst.multitrace.sh
> +++ b/test/unittest/usdt/tst.multitrace.sh
> @@ -14,7 +14,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.onlyenabled.sh b/test/unittest/usdt/tst.onlyenabled.sh
> index d3487834..8d84e3ec 100755
> --- a/test/unittest/usdt/tst.onlyenabled.sh
> +++ b/test/unittest/usdt/tst.onlyenabled.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.pie.sh b/test/unittest/usdt/tst.pie.sh
> index 0d62c376..4ddae43e 100755
> --- a/test/unittest/usdt/tst.pie.sh
> +++ b/test/unittest/usdt/tst.pie.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="-fno-inline -pie $test_cppflags"
>   LDFLAGS="-pie $test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.reeval.sh b/test/unittest/usdt/tst.reeval.sh
> index 371eee3d..9d49755a 100755
> --- a/test/unittest/usdt/tst.reeval.sh
> +++ b/test/unittest/usdt/tst.reeval.sh
> @@ -12,7 +12,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.static.sh b/test/unittest/usdt/tst.static.sh
> index 81b3ba04..d6dd4a7b 100755
> --- a/test/unittest/usdt/tst.static.sh
> +++ b/test/unittest/usdt/tst.static.sh
> @@ -11,7 +11,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.static2.sh b/test/unittest/usdt/tst.static2.sh
> index 115a9551..b7b1be16 100755
> --- a/test/unittest/usdt/tst.static2.sh
> +++ b/test/unittest/usdt/tst.static2.sh
> @@ -15,7 +15,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/unittest/usdt/tst.user.sh b/test/unittest/usdt/tst.user.sh
> index 30513acc..30e897e3 100755
> --- a/test/unittest/usdt/tst.user.sh
> +++ b/test/unittest/usdt/tst.user.sh
> @@ -13,7 +13,7 @@ if [ $# != 1 ]; then
>   fi
>   
>   dtrace=$1
> -CC=/usr/bin/gcc
> +CC=${CC:-/usr/bin/gcc}
>   CFLAGS="$test_cppflags"
>   LDFLAGS="$test_ldflags"
>   
> diff --git a/test/utils/workload_analyze_loop.sh b/test/utils/workload_analyze_loop.sh
> index 3bbadf78..1fb8c0b2 100755
> --- a/test/utils/workload_analyze_loop.sh
> +++ b/test/utils/workload_analyze_loop.sh
> @@ -13,7 +13,7 @@ if [ ! -e $prog ]; then
>   	exit 1
>   fi
>   
> -objdump -d $prog | gawk -v myarch=$(uname -m) '
> +${OBJDUMP:-objdump} -d $prog | gawk -v myarch=$(uname -m) '
>   # decide whether to track instructions (which we number n = 1, 2, 3, ...) or not (n < 0)
>   # specifically, do not track instructions until we find the disassembly for <main>
>   BEGIN { n = -1; }
