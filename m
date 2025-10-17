Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87D92E8B81
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760729025; cv=fail; b=Byk5kpx9eKFwZCYMQkpmLCY5Gl7p9rN3FJaVNksQ8xyR53fvxCJZxZxEFyFOkgDUxd99FYxN1r1+CDrjY9R0zltTRng4GwvrEJX1YHU7K+d1jTTSSvO+9nUiSCIqB0buhPDM0Bg9X/GYb/VW3fPFHV2o1djCpBNVsilB8o52VWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760729025; c=relaxed/simple;
	bh=3zy3/74GZf4Mzj03bQkPMSaI70+mNgtiPkTOhpICK9Q=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gyp55/tzsEgn1/sNKEfdjUa0VhuzDAv+8HySQXICmoff2zOwiUvRpdUTtDVusMG49pBxsz5TIPv3nj+hFI+urb4PRWZ2Cm/+2/soRd1CfzBIuIYERKikMqUOqZtDUKwKZ4MluMXMkRY7hfcdKco39BGbXTRanW9P8l0uYj9mhgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g4H7E95v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n7rO+ufJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g4H7E95v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n7rO+ufJ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCdlHQ030477
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Xcf6ABLCtK8I5pkwqTbn/IwUvm4GbX1SPjDnKIalYaQ=; b=
	g4H7E95vjD8rmYY7l+ZTpo+vOz9acZQdvHtXu9+m/py2y5Y2BpQNQgcGnWJOHHnU
	cEMX+83GVUUerGObTg4mJhk8mnXqyrLaKgmEPfxYvs/sYbUXxmzQPF977trMf2ow
	4+oUcGYE4RNS/HykM+G4qVATPq98/nL8RrWwa2meBeEbwk8mh8kn4TjvzhnwgBeT
	CY0X47EPRpk5qkNG1UDZpDG6quyBzIwC6uL/7qNbEEhguRTherfgtVE/eD7iAdVL
	SL3gVK/WVbr0J4o0hpbMZbw701RVTk34OqzDA2BpA8VGnpPRT5bTtZpfKb/v0T9j
	ju4FrWVC2b7FKxqMTySmuQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdncbjee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:23:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIdNTV017926
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:23:38 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpd8gje-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:23:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4wmou2uNo44W93IbPRxFz9OcV1dv7X5/U6KhoZQNR5dtx1SO3BJzh8+KClBED/aMFNuc1eJZO87b1JkV3jVA7UbBgaaaAvvH48qn5b0lUCcOJOWilVFXaC3JdK5QjsEUngwJZpdztNrT3Ipl8q6Ug5c2Ixkj7kF/DtKeRWiL2M/7qD7A/ouZxTrkmyyZuZAl/W4RPmK6oVVJTLig9CS4d3dh3MGRh6pJQd3v9irxSki1XwdYQTnVYlEQbmXAfnRjXTMRAi/l5VXIdvRLGJt1m6S6Fn1uiw5YDOBmgFr1dgqCjmYdUDHGvKyfI7ri5LkiM0f3u3MHnWWgeTjQXgqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xcf6ABLCtK8I5pkwqTbn/IwUvm4GbX1SPjDnKIalYaQ=;
 b=ckFe4vBW44PRdTQ8Hzd/W8/dQqukU3zDJ8BBbsnazdkP2cLtVm3Tp0c55XkCpTuplu9fYjnPhIoyI+K/p/jPs32YmHQ+oUO90Bcfp2MJyR96OvhJyTBUELaTLvZJeKdHIf8i5cZPhpB1N61CYUEE9kmPFL1Jkw02KoURIpwj54D96KrnOACEYwBNVM96k4MyPxjPk6BJIxn6zXKsSg6m4v8IMzww1ewOk56JUSdterbh9e4Wxt2TBydTCOvCUoyLaAndXSn2NvOXysk4FDnYQ8e+1DmeOL3Xqs6z8q8sjwXK/04xv+dv1qY2UgtflSrTNaUWVxUmVeY3ishKxKAovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xcf6ABLCtK8I5pkwqTbn/IwUvm4GbX1SPjDnKIalYaQ=;
 b=n7rO+ufJi2S/bm92fpKccGhb11c71Ua8KCzFoCVKHxTkkiinn6HkS04e7K7kucEjAuaQn7kz3uQbIVnlvvw7XRmx1MbkEP09JuUa3azeo2IgiN+CSOca/dBG2Q3yCvXVwJia5WjsGEZ/8ubUKdAMW6yw9sgZcJ5sMdAufrC6uxY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPF8E7C782BE.namprd10.prod.outlook.com (2603:10b6:f:fc00::c35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 19:23:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 19:23:33 +0000
Message-ID: <a0d96418-559e-8ffa-984b-2386e3e1fb5f@oracle.com>
Date: Fri, 17 Oct 2025 15:23:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] examples: add a new set of scripts
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251017192244.19164-1-eugene.loh@oracle.com>
In-Reply-To: <20251017192244.19164-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPF8E7C782BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 1010d3f6-e73c-49a0-dec4-08de0db2a998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzZVRWU1VWNsUlVmelJ1bWFzSDJ0a2l4LzY0eHhBb0t3dEhvYXVXWHNkMDR2?=
 =?utf-8?B?Y1NHUXhLMDJBTG1ZWXRKZ1hVaFdFTVBwa2xYRGVJMy9qQmhnRHlTQngyRDV2?=
 =?utf-8?B?ZXpWcjhYQVl4Szc1L1JSVGg0RVFwZnNHWTMyNUdVUUs0WWJaQnBBb0ZNNjNY?=
 =?utf-8?B?SkNMZktmNUlaRHhOTXZiaXI5azhlRWRhdG83TTRFVEJidERhK0RFME56Mm1k?=
 =?utf-8?B?YVcwOVphRlhmekthckgzYzAwTkwvb1dpV1RIb1hiWi9NSzloUE84dlM5amFx?=
 =?utf-8?B?T01LaWR1K2RBUm9XUnJlL1ZvVFgvTW1MVk8yV2NITytTY3pNc2dWMGI0U3Br?=
 =?utf-8?B?S05hbHFpaUhaQkxPT0FIUUVCWmtsREhKVTNaa1V2L0R2ZmRjTmc2R0tPM3Ju?=
 =?utf-8?B?RWNUbDN5MjUzZHpkVmtvNVVwWVhxV0d4cVBGTFRIL29hOWtPSnZHVkhLdmor?=
 =?utf-8?B?Z1F2QnBGL3Noa2VHdzZncTFGei92N0w1SGZ2SUxkT3VTd21IT3RXZzFBd3F3?=
 =?utf-8?B?V1RLZFNhMENkeUpMSW5Dc2Y3aFZmR09RTnU0a2IxNFF6RjBIeDdZK3I5NUdK?=
 =?utf-8?B?aDNmSnlZYXJIVTNjdWszamR0eWoyMytBdWhXRVJRQ0hKZVpOY25pcjlqakps?=
 =?utf-8?B?dEJOREJFOEFWalhmQ2V4VHhHTkprNlo3dW9NVlFJdDI1SGVYTzJXR3drdys1?=
 =?utf-8?B?ZCt4R01kMy92ZTAvZ2YyNWtuWm5GaXBDWEMzVTJjN1lvWklsMURNcTZnenJM?=
 =?utf-8?B?YVZBbXBzQk1wMUhoYlF5bytRVzJySFhyOGYremVkWThEbHdlNVcyZmhtaWN6?=
 =?utf-8?B?SUdOTFpaekExalBQUXJKdkZXVDhKU0R0TVBSYlBqWVRHY0dmN04wZFhMdVJj?=
 =?utf-8?B?bS93cllIZVUxazI4UmZEYklHSFI2WEJ5V3l3aEQwS0o5L3NQMFhEWm45S04r?=
 =?utf-8?B?clVpS3NRMW5temhkNzV3RjhJcDVacG8rdlQ3aXVkaWl2eUhZVFR4dERDZkov?=
 =?utf-8?B?TVZjenJOSURoTkVHRElhNnJJS1hLcmVlcGkxMTl0RVVJWXk2azBWTFNmUnA2?=
 =?utf-8?B?a3hjS0ljRkV6MDlQRkUzM2ZLUEgxVmF5eXFoNTlOd2RwN0NuRVhGbjdnSDNm?=
 =?utf-8?B?ODl1QjlYQkx2Ny9TZTQ4dzRmMThlN3BHQlE2RytFbytTTHZxQVpVTmlnazcy?=
 =?utf-8?B?REJKMVJ2S0NLMFhvRVA3bnV2QzY3YUJxSm9hUXgvSWltZDkwTFhyKys1ZUtK?=
 =?utf-8?B?Nmd2clNSK1lKVDVZcFB5NFNYWUU4bWtobzA2dUlRS2RFK0pkek9qZVoxZVFr?=
 =?utf-8?B?NGNxalR3dmh0VGs5SXFpVUpaRTNmd3BzN0twVHc0dG9TUmltQWZqQ3NRTnU1?=
 =?utf-8?B?Q05vYzhmSHFhYmlaYmRLMTArTGFqbkgrYU95RXJYRUpXM0RkeGorWWdpam9o?=
 =?utf-8?B?SVd5NHcrZlBsTjdPb3UySVdJZHVDVmxUbjVtUVlFSndudmZrRmVXS0hWVC9H?=
 =?utf-8?B?WU52SGhJbXNyOTVTMFB6MCtZWHRkeW1LbjE2aW1zeEFnU1lzSkRtZjh1VVA3?=
 =?utf-8?B?RGkzZlNsQTJPai9mMGozVUoxMmJIencrZXJkY1JNZGRIdU1jdnhxanJrQkVH?=
 =?utf-8?B?RE15c0hCaHlNenJUcStWNTN5TXNPdDNzMFVaTFRoRkRrRFRLVUg2MFRnc2R4?=
 =?utf-8?B?aW1KRDNwK3ZUb0RLMTFGazFXck82eVBBYlFsQWNTZlZaS0lJTmVSdG8yR0Iw?=
 =?utf-8?B?QTZNVjlQNnJ3QndEbjQ1M2xmdTh6alBjeUVIRHpOeVBuWTBZVTc2QXZIUWMy?=
 =?utf-8?B?MExTYzU0UDE5c2dZVldaWHVFbWtSTGpPcGV1dVZSM0duZUxIZmhnVHNRZjN6?=
 =?utf-8?B?UWhRVkxzOXlzbDZVY2c5blBJbGhXMlpvZGc1bTIrdmR5ZktoZndJR0Fia3NO?=
 =?utf-8?B?cFVDZ1NuVkVOV2JBdk4xSnRxWkRTWGxKeVZPZ2VNak1JZ3czYkIrRGNRVHZM?=
 =?utf-8?B?ZE9yLzB5cDdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QythTXMwNG96SmtsUm5KK1ZveEpyblFpQStVQXJpbloyM2tYSVRreWdzKzhq?=
 =?utf-8?B?cHRJZVlLWlYzRnA4Y0hpWm9WT0R6N1A5MURhdUlxbjJCcXIzWmxnYm55SC9Y?=
 =?utf-8?B?SHpEaVZ1eGFaSmpvbXdOaUNMbEoxVWlVTEdoaGZYbVRMQk1UbXhDT2ZyektP?=
 =?utf-8?B?d2dRUmJSQk02Qit2em42eWs2MnBFYTAyS2F0YlErdVRXVkJNbXNZV3VwamhT?=
 =?utf-8?B?eHBVWXNDS3FQRERZdi9nNnlTRStGcUREN29iWUpCY1RTRzIyejJDekdZZ24v?=
 =?utf-8?B?NWQ3NUhzdDMyMGQ5UlNKYm5IQWZZYjJjeXl5a1R5RUVIZ3FHTUhJeXJYM1Ft?=
 =?utf-8?B?clIzaGUya0ZzdlQzMTBjSDhRM1E0UFNZdzZ2alZPQVpoSElqdnVPSTNZYWpj?=
 =?utf-8?B?bnB4V2VPTlJFbVZoUkZiV2F5Rytxa2lSdklDYkVOZUJFWU5uNVpRN3NaOWF1?=
 =?utf-8?B?ZFQ0TjRVRXRldkVSa0dhWUF3b2ExeWo5VVNhYnFiU05YeFpCKzNtRUN2aXcv?=
 =?utf-8?B?MjdrSzJVcWk5TWFBcVNUM1FZN0tDaGU1bWdiUDFrb2RLMitDcnBiTmd0UWRH?=
 =?utf-8?B?MGlGOVlxNFRRV1Y2VmlEeC9xU0wzVGhHbE9ZZWt6VGRSQXloTGg0aG12SVJU?=
 =?utf-8?B?UmMyNXpQbHFLamZVMDlsQlhsRi91U1QzUys0UDF2cVdsdmMzL2QyakkzYnVq?=
 =?utf-8?B?ZmpDYjBVUkx2L3gra3ZkaytRQkU4UlNFaUptQ1ByOU1ETHZSeTJsNUloN1VB?=
 =?utf-8?B?RlRUdktZNEFRaWJmVG80bHNNelJXYit1SGRmOFhybEc2TDlYQjV2WFdSSGtp?=
 =?utf-8?B?NUdNV3VaQXVERVBFZ2xUdHQzM2xlc0tEbGlvTHkrWHp0UEl3TjlIUnFoNEVs?=
 =?utf-8?B?U0MzMUVyMVEvRGEyUloxdDZ0RDV6V01Ybm5KRnl4S1kwM1R4dlhJN3lscm1N?=
 =?utf-8?B?Sy9WWXlGdFFNUU90Zld5cXp4Z3JkUG96dnhRVllYM0VhckttdEUvZng2UytR?=
 =?utf-8?B?dXkzLzZOejA2OC9YN0llZlFwOEZTTnVVK3htRjkzdWsyMlFvaHJrY1hvckpH?=
 =?utf-8?B?cHk0SC9CVFNoallLOTQ4VStkazRYa3NKRS9wWS9ZV2dMMjRwc0o0ams2SzZt?=
 =?utf-8?B?TnFoS21FU1dYTTQyOFBqaWpZYStQVkR3MXRMeGV3azkwUjFNZCtTVFVQdnNY?=
 =?utf-8?B?WUhkSnhrdDN1VStEdUdiSVQ5T1MrcnFrdWFsckZPTWdZc2ZvSk4rRTlnc3NZ?=
 =?utf-8?B?Si82NFBvM1FyMlRNYVZabVIwRGhjVkRjWmx5QS9lYW0xUzhWajIrVmlCb0R2?=
 =?utf-8?B?enlMM2o5aGtRaHZLUWRmdWYyc3hmcUVGbTlwSC9GMlJYL0k5dFg1c0k3L0RK?=
 =?utf-8?B?c214SkptcGUzRm5xYUY4cjVjenNxZU1TTmJBdXMwWmJKVEh6bkVqZGl3ekU0?=
 =?utf-8?B?bXNFWlBmVk5sSVN6aCtqTUpubTFBS2hWd29XWFhiWkh3cng5aXorZG5NV3ZD?=
 =?utf-8?B?MmNoR3RIcTJUSWxUa2hCTFd1eHc3bUluS2xZaUdBVlZnUlEvbitVQnpQTVQ0?=
 =?utf-8?B?OStTb2JBd1hoWkdyUXJmK003ZEREaGVYaVdMK1RXM1o0NE1vMUFNTHJqbHRj?=
 =?utf-8?B?N29CbXFZSVoydExzc1RqaVNQN05PZ3cxQk0vMnVtVFh5OXQrRFlmN3g3Ylhz?=
 =?utf-8?B?WWdENmw4d2NBVnVyZFJyQURDZ0FYTWdNVFdzR0NLbytSL09KRGJaWm5lYlY0?=
 =?utf-8?B?c0EwNGhBeVN5bHVmR0JFVjlPdkJZVTMwVk8wOVZFMGpvTnpWd1I5R0tYeVQx?=
 =?utf-8?B?eXozQktubUFneC9OeExQRkJtaDVrZGVPUnpla3VxY25uYUpJa29nbnRFZjhu?=
 =?utf-8?B?UGZhdTFVYXRrQzBhRWFvRENwTVp6SUc2SWdoQitHSHVlMWtQaW55QXluU3J4?=
 =?utf-8?B?Sm51c0MweG4rUUJVV2djNWt1MS9NZ0tlSUI2djdLbU5JdkNveFk0RkNuaExp?=
 =?utf-8?B?ZmlBZkNOMGZOdGRkT0NzQXhjZDg0eDdXWHJtR29MT2cxMnhlQ3ZVdXl1d0pD?=
 =?utf-8?B?djBEaWZjVm05V1VSMG9mN0k4T2Nvcm5PSk1yc0gyNmpocDQ5dExXSHpNaG9r?=
 =?utf-8?Q?1x7nSNN6mGlSLeWEpsByBcSqM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TD5uLtbn1utvenDF/eBrer6GAvVn27xSlg/IzWaYIDwIvhn0oe3ilsekp1pLXEfEu4RsYKpNjxm03CJfxcsS1sWauVnSvqOhen//LIUrFf/3EFQJ5XlW2JciUBlQ6KjlbfAvZjaUxLt0i4zRm6hPvKrfFltH0Jt4dhbEKsYh+ObBlj1Ac5ruxmw54tMZjyAV10g2aWwa69fZtj6Q3STzElF3IHmJROUSCZE13tgVIhfZgjYHnEOuUEf9zqzV/8Mw0/Jc4b3RKQWyTQTrQoB2UEVEoKsVDn/taUtNUKLKwHm2cYkR2OtvRGlaZoRRi/qUuBFNXT55IE3vlA850k1gT3PW5vW0scPSCsCNBAujviEXeNheZEM1JDvmNXqODdSb89vwr61We4oZPh2XW0qbuMfN/RxZ/09jYuWiWJ+qnz4fNXs+xY4gG7hMXr08YYBHyV+YnixD6a4UcqzfDQ1SXR2ETIVDWCNyyIp29V3FlN/UpdcoItBRaOh3eTdKMxXBZ4Lwu7sE1VaLHUD4XFGSEczFoAthUOwlJ+BRAeV+XZBjz+YHwb2MGQXkhTimmnJYhF/6NRfTLy8XrCVl/lc0kyWSw/x50sT9Jsgnqzw/qHs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1010d3f6-e73c-49a0-dec4-08de0db2a998
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 19:23:33.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AyITG+LA57w4uJSVhbj8hh+aAbdLE72e1KuIpWhlDm8zoRVCxB/81uL65vRMj5uE1x0z5ApXl8eSAfIBaNiOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8E7C782BE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510170147
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfX1QZ3ZDp0xErD
 KQdn+B+sGiI53KuHGwhKWSw0sooNVU9k52MKB4P4dTZKl9/278i43ki6L/H+LtxwC4Lm7Co0pWe
 KqtJQHLgUOm6aYymOlJs8WLHkGEYubj3zYl5gjaP7AvjZoTDt4p2PBNunGgKg/7RqvrGCiHmVRy
 8xz67cxunFhTwwG6Z89ZK6KFyXIXXz2aD8HSwP2jNLN1sX5IYZa+wdeeRHr2nrXE8WgOm5Evx25
 EgaWRWRjIh02OAhqQ3gSBxH3eAEb2kizGfLaCJ+ezXwC2JiF1iq2a4Lr/Ukp+bM3LS3pX6lUH47
 fWNw0vyaPJ9ctYhy7p4AKgbTCw/QOcl2Y1G3fFoETpTzRmkbHeOxs1eoW1jajweiEGr/Z90f9mq
 qshwOB56bCgT40BqROqBVyW1jqw77A==
X-Proofpoint-GUID: doOCaj3zlSzGJE8IgAxK-QlvNkLrHHXD
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68f297bb cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=TZlIC3qUfBTodg788EQA:9 a=70h3ZcGAWjq4Kfsu:21
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: doOCaj3zlSzGJE8IgAxK-QlvNkLrHHXD

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 10/17/25 15:22, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> This is a set of new example scripts.  These are basic programs to
> demonstrate specific functionality.  For example to get an overview
> of system calls executed, processes running, I/O statistics, etc.
> There is also an example of a D script embedded in a shell script.
>
> Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> ---
>   examples/getting-started/activity.d      | 129 ++++++++++++++++++++
>   examples/getting-started/activity1.d     | 144 ++++++++++++++++++++++
>   examples/getting-started/calltrace.d     |  95 +++++++++++++++
>   examples/getting-started/countcalls.d    |  45 +++++++
>   examples/getting-started/countprogs.d    |  44 +++++++
>   examples/getting-started/countsyscalls.d |  38 ++++++
>   examples/getting-started/cswpercpu.d     |  88 ++++++++++++++
>   examples/getting-started/daterun.d       |  42 +++++++
>   examples/getting-started/diskact.d       | 106 +++++++++++++++++
>   examples/getting-started/errno.d         |  56 +++++++++
>   examples/getting-started/errno1.d        | 145 +++++++++++++++++++++++
>   examples/getting-started/execcalls.d     |  51 ++++++++
>   examples/getting-started/fsact.sh        | 114 ++++++++++++++++++
>   examples/getting-started/goodbye.d       |  36 ++++++
>   examples/getting-started/hello.d         |  28 +++++
>   examples/getting-started/readsizes.d     |  46 +++++++
>   examples/getting-started/readtrace.d     |  72 +++++++++++
>   examples/getting-started/readtrace1.d    |  78 ++++++++++++
>   examples/getting-started/rwdiskact.d     | 112 +++++++++++++++++
>   examples/getting-started/syscalls.d      |  50 ++++++++
>   examples/getting-started/syscalls1.d     |  62 ++++++++++
>   examples/getting-started/tick.d          |  55 +++++++++
>   examples/getting-started/tick1.d         |  56 +++++++++
>   examples/getting-started/wrun.d          |  55 +++++++++
>   24 files changed, 1747 insertions(+)
>   create mode 100755 examples/getting-started/activity.d
>   create mode 100755 examples/getting-started/activity1.d
>   create mode 100755 examples/getting-started/calltrace.d
>   create mode 100755 examples/getting-started/countcalls.d
>   create mode 100755 examples/getting-started/countprogs.d
>   create mode 100755 examples/getting-started/countsyscalls.d
>   create mode 100755 examples/getting-started/cswpercpu.d
>   create mode 100755 examples/getting-started/daterun.d
>   create mode 100755 examples/getting-started/diskact.d
>   create mode 100755 examples/getting-started/errno.d
>   create mode 100755 examples/getting-started/errno1.d
>   create mode 100755 examples/getting-started/execcalls.d
>   create mode 100755 examples/getting-started/fsact.sh
>   create mode 100755 examples/getting-started/goodbye.d
>   create mode 100755 examples/getting-started/hello.d
>   create mode 100755 examples/getting-started/readsizes.d
>   create mode 100755 examples/getting-started/readtrace.d
>   create mode 100755 examples/getting-started/readtrace1.d
>   create mode 100755 examples/getting-started/rwdiskact.d
>   create mode 100755 examples/getting-started/syscalls.d
>   create mode 100755 examples/getting-started/syscalls1.d
>   create mode 100755 examples/getting-started/tick.d
>   create mode 100644 examples/getting-started/tick1.d
>   create mode 100755 examples/getting-started/wrun.d
>
> diff --git a/examples/getting-started/activity.d b/examples/getting-started/activity.d
> new file mode 100755
> index 000000000..30f13b6d5
> --- /dev/null
> +++ b/examples/getting-started/activity.d
> @@ -0,0 +1,129 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    activity.d - report on process create, exec and exit
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s activity.d
> + *
> + *  DESCRIPTION
> + *    Show the processes that are created, executed and exited
> + *    while the script is running.
> + *
> + *  NOTES
> + *    - This script uses the proc provider to trace the following process
> + *    activities: create, exec, and exit.
> + *
> + *    - This script is guaranteed to produce results if you start one or
> + *    more commands while the script is running.  There are two ways
> + *    to do this:
> + *    o Execute this script in the background, and type in the command(s).
> + *    o Alternatively, run the script in the foreground and type the
> + *    command(s) in a separate terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Associative arrays are used to store the information from the
> + *    proc provider.
> + *
> + *    - The DTrace User Guide documents the proc provider probe
> + *    arguments like args[0] and also structures like psinfo_t.  It is
> + *    strongly recommended to check the documentation for this info.
> + */
> +
> +/*
> + *  Fires when a process (or process thread) is created using fork() or
> + *  vfork(), which both invoke clone().  The psinfo_t corresponding to
> + *  the new child process is pointed to by args[0].
> + */
> +proc:::create
> +{
> +/*
> + *  Store the PID of both the parent and child process from the psinfo_t
> + *  structure pointed to by args[0].  Use 3 associative arrays to store the
> + *  various items of interest.
> + */
> +  this->childpid  = args[0]->pr_pid;
> +  this->parentpid = args[0]->pr_ppid;
> +
> +/*
> + *  Store the parent PID of the new child process.
> + */
> +  p_pid[this->childpid] = this->parentpid;
> +
> +/*
> + *  Parent command name.
> + */
> +  p_name[this->childpid] = execname;
> +
> +/*
> + *  Child has not yet been exec'ed.
> + */
> +  p_exec[this->childpid] = "";
> +}
> +
> +/*
> + *  The process starts.  In case proc:::create has fired, store the
> + *  absolute time and the full name of the child process.
> + */
> +proc:::exec
> +/ p_pid[pid] != 0 /
> +{
> +  time[pid]   = timestamp;
> +  p_exec[pid] = args[0];
> +}
> +
> +/*
> + *  The process starts, but in this case, proc:::create has not fired.
> + *  In addition to storing the name of the child process, store the
> + *  various other items of interest.
> + */
> +proc:::exec
> +/ p_pid[pid] == 0 /
> +{
> +  time[pid]   = timestamp;
> +  p_exec[pid] = args[0];
> +  p_pid[pid]  = ppid;
> +  p_name[pid] = execname;
> +}
> +
> +/*
> + *  The process exits.  Print the information.
> + */
> +proc:::exit
> +/p_pid[pid] != 0 && p_exec[pid] != ""/
> +{
> +  printf("%-16s (%d) executed %s (%d) for %d microseconds\n",
> +    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
> +}
> +
> +/*
> + *  The process has forked itself and exits.  Print the information.
> + */
> +proc:::exit
> +/p_pid[pid] != 0 && p_exec[pid] == ""/
> +{
> +  printf("%-16s (%d) forked itself (as %d) for %d microseconds\n",
> +    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
> +}
> +
> +/*
> + *  Assign 0s to free memory associated with this pid.
> + */
> +proc:::exit
> +/p_pid[pid] != 0/
> +{
> +  time[pid]   = 0;
> +  p_exec[pid] = NULL;
> +  p_pid[pid]  = 0;
> +  p_name[pid] = NULL;
> +}
> diff --git a/examples/getting-started/activity1.d b/examples/getting-started/activity1.d
> new file mode 100755
> index 000000000..c63317689
> --- /dev/null
> +++ b/examples/getting-started/activity1.d
> @@ -0,0 +1,144 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    activity1.d - report on process create, exec and exit
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s activity1.d '"bash"'
> + *
> + *  DESCRIPTION
> + *    Show the processes that are created, executed and exited
> + *    in the bash shell while the script is running.
> + *
> + *  NOTES
> + *    - This script uses the proc provider to trace the following process
> + *    activities: create, exec, and exit.
> + *
> + *    - A predicate is used to ensure that only those processes executed
> + *    by bash are traced.  While this could be hard coded, here the name
> + *    is passed in as an argument.
> + *
> + *    - This script is guaranteed to produce results if you start one or
> + *    more bash commands while the script is running.  There are two ways
> + *    to do this:
> + *    o Execute this script in the background, and type in the command(s).
> + *    o Alternatively, run the script in the foreground and type the
> + *    command(s) in a separate terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Associative arrays are used to store the information from the
> + *    proc provider.
> + *
> + *    - There is on important subtlety to pay attention to.  Since
> + *    bash (and other shells) optimize for performance, it may happen
> + *    that proc:::create does not fire, because there is no call to
> + *    fork(), clone(), etc.  This is why two different probes for
> + *    proc:::exec are defined.
> + *
> + *    - The DTrace User Guide documents the proc provider probe
> + *    arguments like args[0] and also structures like psinfo_t.  It is
> + *    strongly recommended to check the documentation for this info.
> + */
> +
> +/*
> + *  Fires when a process (or process thread) is created using fork() or
> + *  vfork(), which both invoke clone().  The psinfo_t corresponding to
> + *  the new child process is pointed to by args[0].
> + *
> + *  Use a predicate to only execute the clause if the condition is met.
> + *  In this case that means that only processes executed in the bash
> + *  shell are traced.
> + */
> +proc:::create
> +/ execname == $1 /
> +{
> +/*
> + *  Store the PID of both the parent and child process from the psinfo_t
> + *  structure pointed to by args[0].  Use 3 associative arrays to store the
> + *  various items of interest.
> + */
> +  this->childpid  = args[0]->pr_pid;
> +  this->parentpid = args[0]->pr_ppid;
> +
> +/*
> + *  Store the parent PID of the new child process.
> + */
> +  p_pid[this->childpid] = this->parentpid;
> +
> +/*
> + *  Parent command name.
> + */
> +  p_name[this->childpid] = execname;
> +
> +/*
> + *  Child has not yet been exec'ed.
> + */
> +  p_exec[this->childpid] = "";
> +}
> +
> +/*
> + *  The process starts.  In case proc:::create has fired, store the
> + *  absolute time and the full name of the child process.
> + */
> +proc:::exec
> +/ execname == $1 && p_pid[pid] != 0 /
> +{
> +  time[pid]   = timestamp;
> +  p_exec[pid] = args[0];
> +}
> +
> +/*
> + *  The process starts, but in this case, proc:::create has not fired.
> + *  In addition to storing the name of the child process, store the
> + *  various other items of interest.
> + */
> +proc:::exec
> +/ execname == $1 && p_pid[pid] == 0 /
> +{
> +  time[pid]   = timestamp;
> +  p_exec[pid] = args[0];
> +  p_pid[pid]  = ppid;
> +  p_name[pid] = execname;
> +}
> +
> +/*
> + *  The process exits.  Print the information.
> + */
> +proc:::exit
> +/p_pid[pid] != 0 && p_exec[pid] != ""/
> +{
> +  printf("%-16s (%d) executed %s (%d) for %d microseconds\n",
> +    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
> +}
> +
> +/*
> + *  The process has forked itself and exits.  Print the information.
> + */
> +proc:::exit
> +/p_pid[pid] != 0 && p_exec[pid] == ""/
> +{
> +  printf("%-16s (%d) forked itself (as %d) for %d microseconds\n",
> +    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
> +}
> +
> +/*
> + *  Assign 0s to free memory associated with this pid.
> + */
> +proc:::exit
> +/p_pid[pid] != 0/
> +{
> +  time[pid]   = 0;
> +  p_exec[pid] = NULL;
> +  p_pid[pid]  = 0;
> +  p_name[pid] = NULL;
> +}
> diff --git a/examples/getting-started/calltrace.d b/examples/getting-started/calltrace.d
> new file mode 100755
> index 000000000..5de2b0f46
> --- /dev/null
> +++ b/examples/getting-started/calltrace.d
> @@ -0,0 +1,95 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    calltrace.d - time all system calls for the cp command
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s calltrace.d
> + *
> + *  DESCRIPTION
> + *    List and time all the system calls that are executed during
> + *    a cp command.
> + *
> + *  NOTES
> + *    - This script traces all system calls that are executed when
> + *    a cp command is run.
> + *
> + *    This means that you need to execute the cp command while the
> + *    script is running.  There are two ways to do this:
> + *    o Execute this script in the background, and type in the cp command.
> + *    o Alternatively, run the script in the foreground and type
> + *    the cp command in a separate terminal window on the same system.
> + *
> + *    - You can use any file to copy, but you can also generate a file
> + *    and then copy it.  This is an example how to create a 500 MB file,
> + *    copy it with the cp command and remove both files again:
> + *    $ dd if=/dev/zero of=tmp_file bs=100M seek=5 count=0
> + *    $ cp tmp_file tmp_file2
> + *    $ rm tmp_file tmp_file2
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +/*
> + *  Set the base value of the timer.  This is used as an offset in the
> + *  return probe to calculate the time spent in a system call.
> + *
> + *  A predicate is used to select the cp command.  All other commands
> + *  skip executing the clause and do not set ts_base.
> + */
> +syscall:::entry
> +/ execname == "cp" /
> +{
> +  self->ts_base = timestamp;
> +}
> +
> +/*
> + *  The predicate ensures that the base timing has been set.
> + *  Since this is only done for the cp command, no information
> + *  is collected for the other processes.
> + */
> +syscall:::return
> +/self->ts_base != 0/
> +{
> +/*
> + *  Compute the time passed since the entry probe fired and
> + *  convert the nanosecond value to microseconds.
> + *
> + *  Update the aggregation called totals with this time.  The
> + *  execname (which is cp here) and the system call that caused
> + *  the probe to fire, are the fields in the key.
> + */
> +  this->time_call = (timestamp - self->ts_base)/1000;
> +  @totals[execname,probefunc] = sum(this->time_call);
> +
> +/*
> + *  Free the storage for ts_base.
> + */
> +  self->ts_base = 0;
> +}
> +
> +/*
> + *  Print the results.  Use printf() to print a description of
> + *  the contents of the aggregation.  The format string in printa()
> + *  is used to create a table lay-out.
> + */
> +END
> +{
> +  printf("System calls executed and their duration:\n");
> +  printa("%15s executed %18s - this took a total of %@8d microseconds\n",
> +         @totals);
> +}
> diff --git a/examples/getting-started/countcalls.d b/examples/getting-started/countcalls.d
> new file mode 100755
> index 000000000..1c614228b
> --- /dev/null
> +++ b/examples/getting-started/countcalls.d
> @@ -0,0 +1,45 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    countcalls.d - count the open(), read(), and write() calls for 5 seconds
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s countcalls.d
> + *
> + *  DESCRIPTION
> + *    List and count the calls to write(), read(), and open() executed, while
> + *    the script is running.  The script automatically stops after 5 seconds.
> + *
> + *  NOTES
> + *    - This script uses the profile provider to stop the tracing after a
> + *    certain amount of time.  This time can easily be adjusted by changing.
> + *    the number and unit.
> + *
> + *    - An anonymous aggregation is used to store the results.  Like a named
> + *    aggregation, it is automatically printed when the tracing terminates.
> + */
> +
> +/*
> + *  Fires every 5 seconds.  Since exit() is called, the tracing terminates
> + *  the first time this probe fires and the clause is executed.
> + */
> +profile:::tick-5sec
> +{
> +  exit(0);
> +}
> +
> +/*
> + *  Create the key by concatenating the function name and a string.  An
> + *  alternative is to only use probefunc as a key and print the string as
> + *  part of a printa() in the END probe: printa("%s () calls\n",@);
> + */
> +syscall::write:entry, syscall::read:entry, syscall::open:entry
> +{
> +  @[strjoin(probefunc,"() calls")] = count();
> +}
> diff --git a/examples/getting-started/countprogs.d b/examples/getting-started/countprogs.d
> new file mode 100755
> index 000000000..7674b8a24
> --- /dev/null
> +++ b/examples/getting-started/countprogs.d
> @@ -0,0 +1,44 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    countprogs.d - count processes invoked by a specific user
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s countprogs.d <uid>
> + *
> + *  DESCRIPTION
> + *    List and count every processes that is started by the user, while
> + *    this script runs.  The user id is passed in as an argument to the
> + *    script.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - To ensure a process is started while the script is running,
> + *    either execute this script in the background, and type in one
> + *    or more commands, or run it in the foreground and type in the
> + *    command(s) in a separate terminal window on the same system.
> + *
> + *    - The results of an aggregation are automatically printed when
> + *    the tracing terminates.
> + */
> +
> +/*
> + *  Fires on every process that starts execution.  An aggregation called
> + *  proc_name uses the executable name as a key and counts the number of
> + *  times this executable, or process, is started.
> + */
> +proc:::exec
> +/uid == $1/
> +{
> +  @proc_name[execname] = count();
> +}
> diff --git a/examples/getting-started/countsyscalls.d b/examples/getting-started/countsyscalls.d
> new file mode 100755
> index 000000000..b77c6b2bb
> --- /dev/null
> +++ b/examples/getting-started/countsyscalls.d
> @@ -0,0 +1,38 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    countsyscalls.d - count system calls invoked by a specific user
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s countsyscalls.d <uid>
> + *
> + *  DESCRIPTION
> + *    List and count all the system calls executed by the specified user id.
> + *    The user id is passed in as an argument to the script.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The results of the aggregation are automatically printed when
> + *    the tracing terminates.
> + */
> +
> +/*
> + *  Fires on every system call executed.  An aggregation called syscalls
> + *  uses the function name as a key and counts the number of calls to this
> + *  function.
> + */
> +syscall:::entry
> +/pid == $1/
> +{
> +  @syscalls[probefunc] = count();
> +}
> diff --git a/examples/getting-started/cswpercpu.d b/examples/getting-started/cswpercpu.d
> new file mode 100755
> index 000000000..814f4929d
> --- /dev/null
> +++ b/examples/getting-started/cswpercpu.d
> @@ -0,0 +1,88 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    cswpercpu.d - print the number of context switches per CPU per second
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s cswpercpu.d
> + *
> + *  DESCRIPTION
> + *    Every second, print the CPU id, the number of context switches each
> + *    CPU performed, plus the total number of context switches executed
> + *    across all the CPUs.  For each info block, include a time stamp.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The results are stored in an aggregation called cswpersec.
> + *    Every second, the results are printed with printa() and the
> + *    aggregation is cleared.
> + *
> + *    - In addition to using the CPU ID as a key in the cswpersec
> + *    aggregation, also the string "total" is used.  This entry
> + *    is always printed last, because by default, printa() prints
> + *    the results sorted by the value.  The total count for any of
> + *    the CPU Ids is always equal or less than "total".
> + */
> +
> +/*
> + *  To avoid that the carefully crafted output is mixed with the
> + *  default output by the dtrace command, enable quiet mode.
> + */
> +#pragma D option quiet
> +
> +/*
> + *  Print the header.
> + */
> +BEGIN
> +{
> +  printf("%-20s %5s %15s", "Timestamp", "CPU", "#csw");
> +}
> +
> +/*
> + *  Fires when a process is scheduled to run on a CPU.
> + */
> +sched:::on-cpu
> +{
> +/*
> + *  Convert the CPU ID to a string.  This needs to be done because
> + *  key "total" is a string.
> + */
> +  this->cpustr = lltostr(cpu);
> +/*
> + *  Update the count.
> + */
> +  @cswpersec[this->cpustr]  = count();
> +  @cswpersec["total"] = count();
> +}
> +
> +/*
> + *  Fires every second.
> + */
> +profile:::tick-1sec
> +{
> +/*
> + *  Print the date and time first
> + */
> +  printf("\n%-20Y ", walltimestamp);
> +
> +/*
> + *  Print the aggregated counts for each CPU and the total for all CPUs.
> + *  Use some formatting magic to get a special table lay-out.
> + */
> +  printa("%5s %@15d\n                     ", @cswpersec);
> +
> +/*
> + *  Reset the aggregation.
> + */
> +  clear(@cswpersec);
> +}
> diff --git a/examples/getting-started/daterun.d b/examples/getting-started/daterun.d
> new file mode 100755
> index 000000000..59081598c
> --- /dev/null
> +++ b/examples/getting-started/daterun.d
> @@ -0,0 +1,42 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    daterun.d - display arguments to write() for the date command
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s daterun.d
> + *
> + *  DESCRIPTION
> + *    Trace the calls to write(), but only when executed by the date
> + *    command.  For such calls, print the file descriptor, the output
> + *    string, and the number of bytes printed.
> + *
> + *  NOTES
> + *    - Execute this script in the background, and type in "date", or
> + *    run it in the foreground and type in "date" in a separate window.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The output string is stored in arg1 and contains a newline (\n)
> + *    character.  This is why the byte count is printed on a separate line.
> + */
> +
> +syscall::write:entry
> +/execname == "date"/
> +{
> +/*
> + *  Use copyinstr() to copy the string from user space into a DTrace
> + *  buffer in kernel space.  This function returns a pointer to the buffer.
> + */
> +  printf("%s (fd=%d output=%s bytes=%d)\n",probefunc, arg0,
> +                                           copyinstr(arg1), arg2);
> +}
> diff --git a/examples/getting-started/diskact.d b/examples/getting-started/diskact.d
> new file mode 100755
> index 000000000..31b5acd43
> --- /dev/null
> +++ b/examples/getting-started/diskact.d
> @@ -0,0 +1,106 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    diskact.d - for block devices show the distribution of I/O throughput
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s diskact.d
> + *
> + *  DESCRIPTION
> + *    The io provider is used to gather the I/O throughput for the block
> + *    devices on the system.  A histogram of the results is printed.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *   - The bufinfo_t structure is the abstraction that describes an I/O
> + *   request.  The buffer that corresponds to an I/O request is pointed
> + *   to by args[0] in the start, done, wait-start, and wait-done probes
> + *   available through the io provider.
> + *
> + *   - Detailed information about this data structure can be found in
> + *   the DTrace User Guide.  For more details, you can also check
> + *   /usr/lib64/dtrace/<version>/io.d, where <version> denotes the
> + *   kernel version.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +/*
> + *  To avoid that the carefully crafted output is mixed with the
> + *  default output by the dtrace command, enable quiet mode.
> + */
> +#pragma D option quiet
> +
> +/*
> + *  The pointer to bufinfo_t is in args[0].  Here it is used to get
> + *  b_edev (the extended device) and b_blkno (the expanded block
> + *  number on the device).  These two fields are used in the key for
> + *  associative array io_start.
> + */
> +io:::start
> +{
> +  io_start[args[0]->b_edev, args[0]->b_blkno] = timestamp;
> +}
> +
> +io:::done
> +/ io_start[args[0]->b_edev, args[0]->b_blkno] /
> +{
> +/*
> + *  We would like to show the throughput to a device in KB/sec, but
> + *  the values that are measured are in bytes and nanoseconds.
> + *  You want to calculate the following:
> + *
> + *  bytes / 1024
> + *  ------------------------
> + *  nanoseconds / 1000000000
> + *
> + *  As DTrace uses integer arithmetic and the denominator is usually
> + *  between 0 and 1 for most I/O, the calculation as shown will lose
> + *  precision.  So, restate the fraction as:
> + *
> + *  bytes         1000000000      bytes * 976562
> + *  ----------- * ------------- = --------------
> + *  nanoseconds   1024            nanoseconds
> + *
> + *  This is easy to calculate using integer arithmetic.
> + */
> +
> +  this->elapsed = timestamp -  io_start[args[0]->b_edev, args[0]->b_blkno];
> +
> +/*
> + *  The pointer to structure devinfo_t is in args[1].  Use this to get the
> + *  name (+ instance/minor) and the pathname of the device.
> + *
> + *  Use the formula above to compute the throughput.  The number of bytes
> + *  transferred is in bufinfo_t->b_bcount
> + */
> +  @io_throughput[strjoin("device name = ",args[1]->dev_statname),
> +                 strjoin("path = ",args[1]->dev_pathname)] =
> +                   quantize((args[0]->b_bcount * 976562) / this->elapsed);
> +
> +/*
> + *  Free the storage for the entry in the associative array.
> + */
> +  io_start[args[0]->b_edev, args[0]->b_blkno] = 0;
> +}
> +
> +/*
> + *  Use a format string to print the aggregation.
> + */
> +END
> +{
> +  printa(" %s (%s)\n%@d\n", @io_throughput);
> +}
> diff --git a/examples/getting-started/errno.d b/examples/getting-started/errno.d
> new file mode 100755
> index 000000000..7c76d9678
> --- /dev/null
> +++ b/examples/getting-started/errno.d
> @@ -0,0 +1,56 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    errno.d - list and count the system calls with a non-zero errno value
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s errno.d
> + *
> + *  DESCRIPTION
> + *    Trace every system call that returns a non-zero value in errno.
> + *    Show the name of the function, the value of errno and how often
> + *    this function returned a non-zero value for errno.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The value of errno is available upon the return from the system call.
> + *
> + *    - To present the results in a compact form, we use an aggregation
> + *    called syscalls.  Otherwise we may get several screens with the
> + *    information.  Plus that we then can't easily count the functions.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +/*
> + *  Store the information in an aggregation called syscalls.
> + *  Use the predicate to only allow non-zero errno values that are
> + *  within the range for errno.
> + */
> +syscall:::return
> +/ errno > 0 && errno <= ERANGE /
> +{
> +  @syscalls[probefunc,errno] = count();
> +}
> +
> +/*
> + *  The printf() line prints the header of the table to follow.
> + */
> +END
> +{
> +  printf("%20s %5s %5s\n\n","syscall","errno","count");
> +  printa("%20s %5d %@5d\n",@syscalls);
> +}
> diff --git a/examples/getting-started/errno1.d b/examples/getting-started/errno1.d
> new file mode 100755
> index 000000000..c8fbf8d44
> --- /dev/null
> +++ b/examples/getting-started/errno1.d
> @@ -0,0 +1,145 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    errno1.d - list and count the system calls with a non-zero errno value
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s errno1.d
> + *
> + *  DESCRIPTION
> + *    Trace every system call that returns a non-zero value in errno.
> + *    Show the process name, the name of the function it executes, the
> + *    user id, the name of the error that corresponds to the value of
> + *    errno, a descriptive message for the error, and how often this
> + *    combination occurred.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The value of errno is available upon the return from the system call.
> + *
> + *    - To present the results in a compact form, we use an aggregation
> + *    called syscalls.  Otherwise we may get several screens with the
> + *    information.  Plus that we then can't easily count the functions.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +BEGIN
> +{
> +/*
> + *  Define an associative array called errno_code that maps a value
> + *  of errno to an enum name.  This information can be found in file
> + *  /usr/include/asm-generic/errno-base.h.
> + *
> + *  File /usr/include/asm-generic/errno.h has the codes for calling a system
> + *  call that does not exist.  This has not been used here though.
> + */
> +  errno_code[EPERM]   = "EPERM";    /* Operation not permitted */
> +  errno_code[ENOENT]  = "ENOENT";   /* No such file or directory */
> +  errno_code[ESRCH]   = "ESRCH";    /* No such process */
> +  errno_code[EINTR]   = "EINTR";    /* Interrupted system call */
> +  errno_code[EIO]     = "EIO";      /* I/O error */
> +  errno_code[ENXIO]   = "ENXIO";    /* No such device or address */
> +  errno_code[E2BIG]   = "E2BIG";    /* Argument list too long */
> +  errno_code[ENOEXEC] = "ENOEXEC";  /* Exec format error */
> +  errno_code[EBADF]   = "EBADF";    /* Bad file number */
> +  errno_code[ECHILD]  = "ECHILD";   /* No child processes */
> +  errno_code[EAGAIN]  = "EAGAIN";   /* Try again or operation would block */
> +  errno_code[ENOMEM]  = "ENOMEM";   /* Out of memory */
> +  errno_code[EACCES]  = "EACCES";   /* Permission denied */
> +  errno_code[EFAULT]  = "EFAULT";   /* Bad address */
> +  errno_code[ENOTBLK] = "ENOTBLK";  /* Block device required */
> +  errno_code[EBUSY]   = "EBUSY";    /* Device or resource busy */
> +  errno_code[EEXIST]  = "EEXIST";   /* File exists */
> +  errno_code[EXDEV]   = "EXDEV";    /* Cross-device link */
> +  errno_code[ENODEV]  = "ENODEV";   /* No such device */
> +  errno_code[ENOTDIR] = "ENOTDIR";  /* Not a directory */
> +  errno_code[EISDIR]  = "EISDIR";   /* Is a directory */
> +  errno_code[EINVAL]  = "EINVAL";   /* Invalid argument */
> +  errno_code[ENFILE]  = "ENFILE";   /* File table overflow */
> +  errno_code[EMFILE]  = "EMFILE";   /* Too many open files */
> +  errno_code[ENOTTY]  = "ENOTTY";   /* Not a typewriter */
> +  errno_code[ETXTBSY] = "ETXTBSY";  /* Text file busy */
> +  errno_code[EFBIG]   = "EFBIG";    /* File too large */
> +  errno_code[ENOSPC]  = "ENOSPC";   /* No space left on device */
> +  errno_code[ESPIPE]  = "ESPIPE";   /* Illegal seek */
> +  errno_code[EROFS]   = "EROFS";    /* Read-only file system */
> +  errno_code[EMLINK]  = "EMLINK";   /* Too many links */
> +  errno_code[EPIPE]   = "EPIPE";    /* Broken pipe */
> +  errno_code[EDOM]    = "EDOM";     /* Math argument out of domain of func */
> +  errno_code[ERANGE]  = "ERANGE";   /* Math result not representable */
> +
> +/*
> + *  This associative array called errno_msg has a brief description of the
> + *  error for each non-zero value of errno.
> + */
> +  errno_msg[EPERM]   = "Operation not permitted";
> +  errno_msg[ENOENT]  = "No such file or directory";
> +  errno_msg[ESRCH]   = "No such process";
> +  errno_msg[EINTR]   = "Interrupted system call";
> +  errno_msg[EIO]     = "I/O error";
> +  errno_msg[ENXIO]   = "No such device or address";
> +  errno_msg[E2BIG]   = "Argument list too long";
> +  errno_msg[ENOEXEC] = "Exec format error";
> +  errno_msg[EBADF]   = "Bad file number";
> +  errno_msg[ECHILD]  = "No child processes";
> +  errno_msg[EAGAIN]  = "Try again or operation would block";
> +  errno_msg[ENOMEM]  = "Out of memory";
> +  errno_msg[EACCES]  = "Permission denied";
> +  errno_msg[EFAULT]  = "Bad address";
> +  errno_msg[ENOTBLK] = "Block device required";
> +  errno_msg[EBUSY]   = "Device or resource busy";
> +  errno_msg[EEXIST]  = "File exists";
> +  errno_msg[EXDEV]   = "Cross-device link";
> +  errno_msg[ENODEV]  = "No such device";
> +  errno_msg[ENOTDIR] = "Not a directory";
> +  errno_msg[EISDIR]  = "Is a directory";
> +  errno_msg[EINVAL]  = "Invalid argument";
> +  errno_msg[ENFILE]  = "File table overflow";
> +  errno_msg[EMFILE]  = "Too many open files";
> +  errno_msg[ENOTTY]  = "Not a typewriter";
> +  errno_msg[ETXTBSY] = "Text file busy";
> +  errno_msg[EFBIG]   = "File too large";
> +  errno_msg[ENOSPC]  = "No space left on device";
> +  errno_msg[ESPIPE]  = "Illegal seek";
> +  errno_msg[EROFS]   = "Read-only file system";
> +  errno_msg[EMLINK]  = "Too many links";
> +  errno_msg[EPIPE]   = "Broken pipe";
> +  errno_msg[EDOM]    = "Math argument out of domain of func";
> +  errno_msg[ERANGE]  = "Math result not representable";
> +}
> +
> +/*
> + *  Store the information in an aggregation called syscalls.
> + *  Use the predicate to only allow non-zero errno values that are
> + *  within the range for errno.
> + */
> +syscall:::return
> +/ errno > 0 && errno <= ERANGE /
> +{
> +  @syscalls[execname,probefunc,uid,errno_code[errno],
> +            errno_msg[errno]] = count();
> +}
> +
> +/*
> + *  The printf() line prints the header of the table to follow.
> + */
> +END
> +{
> +  printf("%-20s %-16s %-6s %-7s %-35s %5s\n\n","PROCESS","SYSCALL","UID",
> +         "ERROR","DESCRIPTION","COUNT");
> +  printa("%-20s %-16s %-6d %-7s %-35s %@5d\n",@syscalls);
> +}
> diff --git a/examples/getting-started/execcalls.d b/examples/getting-started/execcalls.d
> new file mode 100755
> index 000000000..ba829aacd
> --- /dev/null
> +++ b/examples/getting-started/execcalls.d
> @@ -0,0 +1,51 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    execcalls.d - show all processes that start executing
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s execcalls.d
> + *
> + *  DESCRIPTION
> + *    The probe in this script traces the exec() system call.  It
> + *    fires whenever a process loads a new process image.
> + *
> + *  NOTES
> + *    - This script traces the processes that start executing while
> + *    the script is running.  If no process is started during the
> + *    time that the script runs, no output is produced.
> + *
> + *    If that is the case, you can always execute a command yourself
> + *    while this script is running.  One such command is "date" that
> + *    causes the probe to fire.
> + *
> + *    - If you'd like to execute command(s) while the script is running,
> + *    execute this script in the background, and type in one or more
> + *    commands.  If you started the script in the foreground, type in
> + *    the command(s) in a separate terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + */
> +
> +proc:::exec
> +/ args[0] != NULL /
> +{
> +/*
> + *  This information is from the DTrace user guide.  The proc:::exec
> + *  probe makes a pointer to a char available in args[0].  This has
> + *  the path to the new process image.
> + *
> + *  The strjoin() function is used to add a newline (\n) to the
> + *  string that is to be printed.
> + */
> +  trace(strjoin(stringof(args[0]),"\n"));
> +}
> diff --git a/examples/getting-started/fsact.sh b/examples/getting-started/fsact.sh
> new file mode 100755
> index 000000000..48b8adc98
> --- /dev/null
> +++ b/examples/getting-started/fsact.sh
> @@ -0,0 +1,114 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +#------------------------------------------------------------------------------
> +# This example embeds a DTrace script in a bash script.  The bash script
> +# is used to set the variables needed in the D script.
> +#
> +# fsact -- Display cumulative read and write activity across a file
> +#          system device
> +#
> +#          Usage: fsact [<filesystem>]
> +#------------------------------------------------------------------------------
> +
> +#------------------------------------------------------------------------------
> +# If no file system is specified, assume /
> +#------------------------------------------------------------------------------
> +[ $# -eq 1 ] && FSNAME=$1 || FSNAME="/"
> +[ ! -e $FSNAME ] && echo "$FSNAME not found" && exit 1
> +
> +#------------------------------------------------------------------------------
> +# Determine the mountpoint, major and minor numbers, and file system size.
> +#------------------------------------------------------------------------------
> +MNTPNT=$(df $FSNAME | gawk '{ getline; print $1; exit }')
> +MAJOR=$(printf "%d\n" 0x$(stat -Lc "%t" $MNTPNT))
> +MINOR=$(printf "%d\n" 0x$(stat -Lc "%T" $MNTPNT))
> +FSSIZE=$(stat -fc "%b" $FSNAME)
> +
> +#------------------------------------------------------------------------------
> +# Run the embedded D script.
> +#------------------------------------------------------------------------------
> +sudo dtrace -qs /dev/stdin << EOF
> +/*
> + *  DESCRIPTION
> + *    The io:::done probe from the io provider is used to get read and write
> + *    statistics.  In particular, the id of the block that is accessed for
> + *    the read or write operation.
> + */
> +
> +BEGIN
> +{
> +  printf("Show how often blocks are accessed in read and write operations\n");
> +  printf("The statistics are updated every 5 seconds\n");
> +  printf("The block IDs are normalized to a scale from 0 to 10\n");
> +  printf("The file system is %s\n","$FSNAME");
> +  printf("The mount point is %s\n","$MNTPNT");
> +  printf("The file system size is %s bytes\n","$FSSIZE");
> +}
> +
> +/*
> + *  This probe fires after an I/O request has been fulfilled. The
> + *  done probe fires after the I/O completes, but before completion
> + *  processing has been performed on the buffer.
> + *
> + *  A pointer to structure devinfo_t is in args[1].  This is used
> + *  to get the major and minor number of the device.
> + *
> + *  A pointer to structure bufinfo_t is in args[0].  This is used
> + *  to get the flags and the block number.
> + */
> +io:::done
> +/ args[1]->dev_major == $MAJOR && args[1]->dev_minor == $MINOR /
> +{
> +/*
> + *  Check if B_READ has been set and assign a string to io_type
> + *  based on the outcome of the check.  This string is used as
> + *  the key in aggregation io_stats.
> + */
> +  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
> +
> +/*
> + *  Structure member b_lblkno identifies which logical block on the
> + *  device is to be accessed.  Normalize thise block number as an
> + *  integer in the range 0 to 10.
> + */
> +  blkno = (args[0]->b_blkno)*10/$FSSIZE;
> +
> +/*
> + *  Aggregate blkno linearly over the range 0 to 10 in steps of 1.
> + */
> +  @io_stats[io_type] = lquantize(blkno,0,10,1)
> +}
> +
> +/*
> + *  Fires every 5 seconds.
> + */
> +profile:::tick-5s
> +{
> +  printf("%Y\n",walltimestamp);
> +
> +/*
> + *  Display the contents of the aggregation.
> + */
> +  printa("%s\n%@d\n",@io_stats);
> +
> +/*
> + *  Reset the aggregation every time this probe fires
> + */
> +  clear(@io_stats);
> +}
> +
> +/*
> + *  Fires every 21 seconds.  Since exit() is called, the tracing terminates
> + *  the first time this probe fires and the clause is executed.
> + */
> +profile:::tick-21s
> +{
> +  printf("Tracing is terminated now\n");
> +  exit(0);
> +}
> +EOF
> diff --git a/examples/getting-started/goodbye.d b/examples/getting-started/goodbye.d
> new file mode 100755
> index 000000000..e0a1a67e2
> --- /dev/null
> +++ b/examples/getting-started/goodbye.d
> @@ -0,0 +1,36 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    goodbye.d - demonstrate the END probe
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s goodbye.d
> + *
> + *  DESCRIPTION
> + *    Demonstrates the use of the END probe.  Function trace() is
> + *    used to print a string.
> + *
> + *  NOTES
> + *    - The advantage of trace() is that it is simple and does not
> + *    require a format string.  If more control over the output is
> + *    needed, printf() is a good alternative.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + */
> +
> +/*
> + *  The END probe fires once when the tracing has terminated.
> + */
> +END
> +{
> +  trace("Goodbye");
> +}
> diff --git a/examples/getting-started/hello.d b/examples/getting-started/hello.d
> new file mode 100755
> index 000000000..454822762
> --- /dev/null
> +++ b/examples/getting-started/hello.d
> @@ -0,0 +1,28 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    hello.d - demonstrate the BEGIN probe
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s hello.d
> + *
> + *  DESCRIPTION
> + *    Demonstrate the use of the BEGIN probe.  Function trace() is
> + *    used to print a string.  The exit() function terminates the
> + *    tracing.
> + */
> +
> +/*
> + *  The BEGIN probe fires when the tracing script starts.
> + */
> +BEGIN
> +{
> +  trace("Hello, world");
> +  exit(0);
> +}
> diff --git a/examples/getting-started/readsizes.d b/examples/getting-started/readsizes.d
> new file mode 100755
> index 000000000..da2f43ecf
> --- /dev/null
> +++ b/examples/getting-started/readsizes.d
> @@ -0,0 +1,46 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    readsizes.d - show the distribution of bytes read when running find
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s readsizes.d
> + *
> + *  DESCRIPTION
> + *    Trace the calls to read() and use a predicate to only select those
> + *    calls executed as part of executing the find command.  For such
> + *    calls, show the distribution of the sizes.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The results are stored in an aggregation called dist with
> + *    the string "find" as the key.
> + *
> + *    - The results of an aggregation are automatically printed when
> + *    the tracing terminates.
> + */
> +
> +/*
> + *  A predicate is used to guarantee that the clause for the read:entry
> + *  probe is only executed in case the call to read() was issued by the
> + *  find command.
> + *
> + *  The quantize() function is used to show the distribution of the sizes
> + *  read, or attempted to be read, by the read() call.  This value is
> + *  passed to the syscall function and to the D probe in arg2.
> + */
> +syscall::read:entry
> +/execname == "find"/
> +{
> +  @dist["find"] = quantize(arg2);
> +}
> diff --git a/examples/getting-started/readtrace.d b/examples/getting-started/readtrace.d
> new file mode 100755
> index 000000000..c62da82b4
> --- /dev/null
> +++ b/examples/getting-started/readtrace.d
> @@ -0,0 +1,72 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    readtrace.d - show the time spent in the read() system call
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s readtrace.d
> + *
> + *  DESCRIPTION
> + *    For each combination of executable name and process id, show the
> + *    total time in microseconds that is spent in the read() system call(s).
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - An aggregation is used to accumulate the timings.  An alternative
> + *    is to print the results in the read:return probe and if required,
> + *    post process the output when the script has completed.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, the results
> + *    are printed in the END probe.  The format string is optional,
> + *    but is used to produce a table lay-out.
> + */
> +
> +/*
> + *  Set the base value of the timer.  This is used as an offset in the
> + *  read:return probe to calculate the time spent.
> + */
> +syscall::read:entry
> +{
> +  self->ts_base = timestamp;
> +}
> +
> +/*
> + *  The predicate ensures that the base timing has been set.
> + */
> +syscall::read:return
> +/self->ts_base != 0/
> +{
> +/*
> + *  Clause-local variable time_read is used to store the time passed
> + *  since the read:entry probe fired.  This time is converted from
> + *  nanoseconds to microseconds.
> + *
> + */
> +  this->time_read = (timestamp - self->ts_base)/1000;
> +  @totals[execname,pid] = sum(this->time_read);
> +
> +/*
> + *  Free the storage for ts_base.
> + */
> +  self->ts_base = 0;
> +}
> +
> +/*
> + *  Print the results.
> + */
> +END
> +{
> +  printa("%15s (pid=%-7d) spent a total of %5@d microseconds in read()\n",
> +         @totals);
> +}
> diff --git a/examples/getting-started/readtrace1.d b/examples/getting-started/readtrace1.d
> new file mode 100755
> index 000000000..6dc032854
> --- /dev/null
> +++ b/examples/getting-started/readtrace1.d
> @@ -0,0 +1,78 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    readtrace.d - show the time spent in the read() system call
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s readtrace.d
> + *
> + *  DESCRIPTION
> + *    For each combination of executable name and process id, show the
> + *    total time in microseconds that is spent in the read() system call(s)
> + *    executed by the df command.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - An aggregation is used to accumulate the timings.  An alternative
> + *    is to print the results in the read:return probe and if required,
> + *    post process the output when the script has completed.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, the results
> + *    are printed in the END probe.  The format string is optional,
> + *    but is used to produce a table lay-out.
> + */
> +
> +/*
> + *  Set the base value of the timer.  This is used as an offset in the
> + *  read:return probe to calculate the time spent.
> + *
> + *  A predicate is used to select the df command.  All other commands
> + *  skip the clause and do not set ts_base.
> + */
> +syscall::read:entry
> +/ execname == "df" /
> +{
> +  self->ts_base = timestamp;
> +}
> +
> +/*
> + *  The predicate ensures that the base timing has been set.  Since this
> + *  is only done for the df command, no information is collected for the
> + *  other processes.
> + */
> +syscall::read:return
> +/self->ts_base != 0/
> +{
> +/*
> + *  Clause-local variable time_read is used to store the time passed
> + *  since the read:entry probe fired.  This time is converted from
> + *  nanoseconds to microseconds.
> + */
> +  this->time_read = (timestamp - self->ts_base)/1000;
> +  @totals[execname,pid] = sum(this->time_read);
> +
> +/*
> + *  Free the storage for ts_base.
> + */
> +  self->ts_base = 0;
> +}
> +
> +/*
> + *  Print the results.  The format is tailored to the df command.
> + */
> +END
> +{
> +  printa("%-3s (pid=%-7d) spent a total of %5@d microseconds in read()\n",
> +         @totals);
> +}
> diff --git a/examples/getting-started/rwdiskact.d b/examples/getting-started/rwdiskact.d
> new file mode 100755
> index 000000000..5389270a1
> --- /dev/null
> +++ b/examples/getting-started/rwdiskact.d
> @@ -0,0 +1,112 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    rwdiskact.d - for block devices show the read() and write() performance
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s rwdiskact.d
> + *
> + *  DESCRIPTION
> + *    The io provider is used to display the throughput of the read()
> + *    and write calls() for the block devices on the system.  The
> + *    tracing automatically stops after 10 seconds.
> + *
> + *  NOTES
> + *   - The bufinfo_t structure is the abstraction that describes an I/O
> + *   request.  The buffer that corresponds to an I/O request is pointed
> + *   to by args[0] in the start, done, wait-start, and wait-done probes
> + *   available through the io provider.
> + *
> + *   - Detailed information about this data structure can be found in
> + *   the DTrace User Guide.  For more details, you can also check
> + *   /usr/lib64/dtrace/<version>/io.d, where <version> denotes the
> + *   kernel version.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +/*
> + *  To avoid that the carefully crafted output is mixed with the
> + *  default output by the dtrace command, enable quiet mode.
> + */
> +#pragma D option quiet
> +
> +/*
> + *  Fires every 10 seconds.  Since exit() is called, the tracing terminates
> + *  the first time this probe fires and the clause is executed.
> + */
> +profile:::tick-10sec
> +{
> +  exit(0);
> +}
> +
> +/*
> + *  The pointer to bufinfo_t is in args[0].  Here it is used to get
> + *  b_flags (the flags), b_edev (the extended device) and b_blkno (the
> + *  expanded block number on the device).  These three fields are used
> + *  in the key for associative array io_start.
> + */
> +io:::start
> +{
> +  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
> +  io_start[args[0]->b_edev, args[0]->b_blkno, io_type] = timestamp;
> +}
> +
> +io:::done
> +{
> +/*
> + *  We would like to show the throughput to a device in KB/sec, but
> + *  the values that are measured are in bytes and nanoseconds.
> + *  You want to calculate the following:
> + *
> + *  bytes / 1024
> + *  ------------------------
> + *  nanoseconds / 1000000000
> + *
> + *  As DTrace uses integer arithmetic and the denominator is usually
> + *  between 0 and 1 for most I/O, the calculation as shown will lose
> + *  precision.  So, restate the fraction as:
> + *
> + *  bytes         1000000000      bytes * 976562
> + *  ----------- * ------------- = --------------
> + *  nanoseconds   1024            nanoseconds
> + *
> + *  This is easy to calculate using integer arithmetic.
> + */
> +  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
> +  this->elapsed = timestamp -
> +                  io_start[args[0]->b_edev,args[0]->b_blkno,io_type];
> +
> +/*
> + *  The pointer to structure devinfo_t is in args[1].  Use this to get the
> + *  name (+ instance/minor) and the pathname of the device.
> + *
> + *  Use the formula above to compute the throughput.  The number of bytes
> + *  transferred is in bufinfo_t->b_bcount
> + */
> +  @io_throughput[strjoin("device name = ",args[1]->dev_statname),
> +                 strjoin("path = ",args[1]->dev_pathname),
> +                io_type] =
> +                   quantize((args[0]->b_bcount * 976562) / this->elapsed);
> +
> +/*
> + *  Free the storage for the entry in the associative array.
> + */
> +  io_start[args[0]->b_edev, args[0]->b_blkno,io_type] = 0;}
> +
> +/*
> + *  Use a format string to print the aggregation.
> + */
> +END
> +{
> +  printa(" %s (%s) %s \n%@d\n", @io_throughput);
> +}
> diff --git a/examples/getting-started/syscalls.d b/examples/getting-started/syscalls.d
> new file mode 100755
> index 000000000..365c99688
> --- /dev/null
> +++ b/examples/getting-started/syscalls.d
> @@ -0,0 +1,50 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    syscalls.d - show the read() system calls executed
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s syscalls.d
> + *
> + *  DESCRIPTION
> + *    Count the read() system calls that are executed while the script
> + *    is running.  Count by the name of the process and the file
> + *    descriptor used in the read operation.
> + *
> + *  NOTES
> + *    - This script traces the running processes and the probe fires
> + *    if there are calls to read().  If there are no such calls, no
> + *    output is produced.
> + *
> + *    If that is the case, you can always execute a command that
> + *    executes calls to read().  One such command is "date".  It causes
> + *    the probe to fire, but any other command that issues calls to
> + *    read() will do.
> + *
> + *    - Execute this script in the background, and type in the command,
> + *    or run it in the foreground and type in the command in a separate
> + *    terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The results of the aggregation are automatically printed when
> + *    the tracing terminates.
> + */
> +
> +/*
> + *  The file descriptor used in the read() call is passed to the syscall
> + *  and to the D probe in arg0.
> + */
> +syscall::read:entry
> +{
> +  @totals[execname,arg0] = count();
> +}
> diff --git a/examples/getting-started/syscalls1.d b/examples/getting-started/syscalls1.d
> new file mode 100755
> index 000000000..9f2bbe411
> --- /dev/null
> +++ b/examples/getting-started/syscalls1.d
> @@ -0,0 +1,62 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    syscalls1.d - show the read() system calls executed
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s syscalls1.d
> + *
> + *  DESCRIPTION
> + *    Count the read() system calls that are executed while the script
> + *    is running.  Count by the process id, the user id, the name of
> + *    the process and the file descriptor used in the read operation.
> + *
> + *  NOTES
> + *    - This script traces the running processes and the probe fires
> + *    if there are calls to read().  If there are no such calls, no
> + *    output is produced.
> + *
> + *    If that is the case, you can always execute a command that
> + *    executes calls to read().  One such command is "date".  It causes
> + *    the probe to fire, but any other command that issues calls to
> + *    read() will do.
> + *
> + *    - Execute this script in the background, and type in the command,
> + *    or run it in the foreground and type in the command in a separate
> + *    terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed in the END probe
> + */
> +
> +/*
> + *  The file descriptor used in the read() call is passed to the syscall
> + *  and to the D probe in arg0.
> + */
> +syscall::read:entry
> +{
> +  @totals[pid,uid,execname,arg0] = count();
> +}
> +
> +/*
> + *  The printf() statement prints a header.  The format string in the
> + *  printa() call is optional.  Here it is used to produce a table layout.
> + */
> +END
> +{
> +  printf("%8s %6s %20s %3s %5s\n","PID","UID","EXECNAME","FD","COUNT");
> +  printa("%8d %6d %20s %3d %5@d\n",@totals);
> +}
> diff --git a/examples/getting-started/tick.d b/examples/getting-started/tick.d
> new file mode 100755
> index 000000000..b1a2a9440
> --- /dev/null
> +++ b/examples/getting-started/tick.d
> @@ -0,0 +1,55 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    tick.d - perform an action at regular intervals
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s tick.d
> + *
> + *  DESCRIPTION
> + *    Use the tick probe from the profile provider to execute a block of code
> + *    at regular intervals.  In this case, this is the update of a variable
> + *    called "i", but the clause can contain any valid D statements.  The
> + *    final value of "i" is printed in the END probe.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Instead of printf(), trace() can be used and vice-versa.  The
> + *    difference is that trace() does not support a format string.
> + */
> +
> +/*
> + *  Initialize variable "i" to zero.  This is a global variable that
> + *  can be read and written by any probe.
> + */
> +BEGIN
> +{
> +  i = 0;
> +}
> +
> +/*
> + *  This probe fires every 100 milliseconds.  When it fires, it updates
> + *  variable "i" and prints the result.
> + */
> +profile:::tick-100msec
> +{
> +  printf("i = %d\n",++i);
> +}
> +
> +/*
> + *  Print the final result.
> + */
> +END
> +{
> +  trace(i);
> +}
> diff --git a/examples/getting-started/tick1.d b/examples/getting-started/tick1.d
> new file mode 100644
> index 000000000..244c79100
> --- /dev/null
> +++ b/examples/getting-started/tick1.d
> @@ -0,0 +1,56 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    tick1.d - perform an action at regular intervals
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s tick1.d
> + *
> + *  DESCRIPTION
> + *    Use the tick probe from the profile provider to execute a block of code
> + *    at regular intervals.  In this case, this is the update of a variable
> + *    called "i", but the clause can contain any valid D statements.  The
> + *    final value of "i" is printed in the END probe.  The printf() function
> + *    is used to format the output.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Instead of printf(), trace() can be used and vice-versa.  The
> + *    difference is that trace() does not support a format string.
> + */
> +
> +/*
> + *  Initialize variable "i" to zero.  This is a global variable that
> + *  can be read and written by any probe.
> + */
> +BEGIN
> +{
> +  i = 0;
> +}
> +
> +/*
> + *  This probe fires every 100 milliseconds.  When it fires, it updates
> + *  variable "i" and prints the result.
> + */
> +profile:::tick-100msec
> +{
> +  printf("i = %d\n",++i);
> +}
> +
> +/*
> + *  Print the final result.  Use printf() to format the output.
> + */
> +END
> +{
> +  printf("\nFinal value of i = %d\n",i);
> +}
> diff --git a/examples/getting-started/wrun.d b/examples/getting-started/wrun.d
> new file mode 100755
> index 000000000..3e242f592
> --- /dev/null
> +++ b/examples/getting-started/wrun.d
> @@ -0,0 +1,55 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + *  NAME
> + *    wrun.d - display arguments to write() for the w command
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s wrun.d
> + *
> + *  DESCRIPTION
> + *    Trace the calls to write(), but only when executed by the w
> + *    command.  For such calls, print the file descriptor, the
> + *    output string, and the number of bytes printed.
> + *
> + *  NOTES
> + *    - Execute this script in the background, and type in "w", or
> + *    run it in the foreground and type in "w" in a separate window.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - DTrace has a default limit of 256 bytes for strings.  In this
> + *    example, the output string may be longer than this.  If so,
> + *    either use the "-x strsize=<new-length>" command line option,
> + *    or a "#pragma D option strsize=<new-length>" pragma in the
> + *    script to increase the size.  The latter is shown below.
> + */
> +
> +#pragma D option strsize=512
> +
> +/*
> + *  Use a predicate to only execute the clause in case the w
> + *  command causes the probe to fire.
> + */
> +syscall::write:entry
> +/execname == "w"/
> +{
> +/*
> + *  Use copyinstr() to copy the string from user space into a DTrace
> + *  buffer in kernel space.  This function returns a pointer to the buffer.
> + *  The string it points to, is null terminated.
> + *  The third argument in the call to write() is the number of bytes
> + *  to be printed.  This could be used as an optional second argument
> + *  in copyinstr() so that only this many bytes are copied.
> + */
> +  printf("%s(fd=%d\noutput=\n%s\nbytes=%d)\n",probefunc, arg0,
> +                                              copyinstr(arg1), arg2);
> +}
