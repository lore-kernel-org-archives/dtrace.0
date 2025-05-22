Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C219ADA4
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936909; cv=fail; b=q4G29vSoCJIxtI4GT8Th2xLDGDcqZHhZWD3olZrvHl6FMYDBpkCLvIb3TpI62Lsm0Vj13H0B92+Lqf/hRpUFezF5CqEFEhXciFmKsJM5S9zKECSlfp89WJ3XOICNpjI85wLWmw8fhTPKgiV1RlPPOQKlsW8r7Y0E/feS1t+eStg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936909; c=relaxed/simple;
	bh=q+9FdKkPtojmDX8ilNcMyhKBSaw62yZ8NcfRbwfZYog=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZLx5O8HhEtRd7T8LXqXSMjatkwOy3zxzaPu/d2ZupEZQqYlpGE5uEtvh919mnYqwolgcrNuDzswpZLcEeRFJ/le3FEQ1BO5uQLABkpl5zB34RqbIB8qpvSEyGTZSG7RqNw2zffr3Y4squZCdHa+H5vNdBlzdbKBJMPLwBS9WtaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q7j7bU8J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W6R5acEv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q7j7bU8J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W6R5acEv"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0vL9014504
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Hc83rkvtQH9hgc0kWU
	wlmPv1LTMIcgzL8AQcIk68cew=; b=Q7j7bU8J+wgNcYbLpiI4hK5SqkPnEknZup
	jPwojbp4ZGcZdHtnJErUxLqaYvfgY5IdKPYN5RKTJfbDSS0oaNJm6QTw0vlVwhzp
	ZdjRh8et9fJ1geyV35WEtq3Ly5AUIzb+W/5yMDH6tNJzi6aRhBQrT9RuUcoYahVL
	UbMvtnLOyP8EMhHb4ObgSGKHjO0C94X03QTjh1pEU9EvndGkpO57PwMHBMVzcwx5
	9FAU5oF/Ddd40kkshqKGDOVn/VzVc0tKI7DjqhQ73Dq808aetuA9lIOBasPd/SZN
	Nhi5LFQNMcX59dY6/1gJWl1WztTigG6MND6pFU8rvoQbu47NcGgg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t78389xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGovpB011350
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:43 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rweprwm3-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpFVsmhm7PYWsHF5oFBwVVt1vjzm/qKftAQ5OJROnt7JkC2/plwlRwcxW3biLBjoxbV0S1uMSZJetLAwC+g5y8YBAybqC2tM85w7kp7CQU/auNjTfWgRuwHJ8lA3WMqHw97ldvm2hytwKnM656gLwcweaOaxGf6qrZEAlVh5fKeR+pdBIgyWhxqGtnMIsJyv7X2mVwXWHZfWGpMmRSVlyGPInrN/IZU2npwk0wt8nZOit8PLgpbc2lGlMqW0oscGPEzxfCybm2PIKrraeRVSSOZPLl0MSsDgQlA5yNpicHswunxtSS+0kwHutHaWWisTNmhujhLNl/Jjjw67CuBifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc83rkvtQH9hgc0kWUwlmPv1LTMIcgzL8AQcIk68cew=;
 b=QLDiVxyE5GMoVAUDGG1xz64xkNz4uGOMM7B1NaaK2mph65kS4TknD1Q3foc4B5mAP/S/Ult6uUApupAfTA31szb6XMHJL3yNDa17hlIS6nQ2AURNs/mq5BAmajtUvwRiQHQhlDmwe08IWxS9ZArw5qMhkRjAgLjRv+J6ggFz2qBlF2k4mD1nXRbtnqZK2/ZHMsZ0bh4TJFLsrkpWw8SNJhG7qsZIrLP92HO+ilr7/Uo2ALPrpgjq5wGtIWvwYOuix9Wbm289Md7eqHJsiqQFQY2xGBDPutgefzHoWK8URBMi4tdCXwsv0tPre3F50wWz3WgWdcx7NoGspwfa8hX8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc83rkvtQH9hgc0kWUwlmPv1LTMIcgzL8AQcIk68cew=;
 b=W6R5acEvVAY1hZUgDAE9M/hmoS6+inBIjL16wCD3KhgCKGo3lWHmnXrPGCaaAk89LIJIqqyB3Lx2xc0PYaE3JJgp/ewZlllZM7eEmhXJmfTghDyKM2hmQGQYMFMnMy6BKVRcBtSPYkiIyLIqNZc6dkQXeMhXyEYFNGUARY5+aqk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:35 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 05/14] Test: caller and stackdepth tests for dtrace provider
Date: Thu, 22 May 2025 14:01:09 -0400
Message-Id: <20250522180118.27343-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d13b8f-a1db-4bc6-a7cf-08dd995ab142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?70bYCKvnAp1ui0NZB9m/D7UCprJVSX+UzbW/5BmHQvBvOIixyvm5cyKMUPEm?=
 =?us-ascii?Q?CYe6gCTs6i0rqzDhqJ5++jLG08awhIeNH2agGIDNmiZ7buYdNcd84pCviCcO?=
 =?us-ascii?Q?3lv4DEKXDS68W4EEU/zIlV7Qcl9bwYGvZF8jMwHbuE4g3VThqlzlhTUJZMXN?=
 =?us-ascii?Q?RawpQAbTtbrgy+gxrss0OIe+debSgQax5GSzXP5fGngs9tatMzsSwOEwF3yB?=
 =?us-ascii?Q?i42RszgkY1dtGdw+8wheIhf7SwVmuaCSoH3BOQ65HbrvW2t87l+M93ABg6GT?=
 =?us-ascii?Q?4xktec1boFLvhC8xIuCGcgK/iWnnVg6TL5xc46p2KLfydAfZHdkGxOVhkfPK?=
 =?us-ascii?Q?u14OItA5lL+nk+0UR0k7BE5OEmsYdhxLK6u2B9d+MuJ9AFgPksSUwH8oH+Zy?=
 =?us-ascii?Q?PQCFGF8hSEt0f2HmAE4Et4jHoIZkxo+SfVjWsWihvanB4wuvYHC9uUhpeQiO?=
 =?us-ascii?Q?0eRSvYt562lIYOhI8/dSFouvsRyrVQRHP2RBtXNoIO9FzUi86yzpbdm99FOD?=
 =?us-ascii?Q?S+V+aMBGQ6AsYyoOevV+L0G4w3WU2O1PN1RgDhUgt/QSteanN2PhXIIyIWp6?=
 =?us-ascii?Q?v0tyh4XX9o176WbbaLti7LdmbHIAvVYQvAKeMimg/Dmz4iHfKl/Qpo7DxCTf?=
 =?us-ascii?Q?5aK4QzhlW03CtqSfGBMcsrbTtbBrW+f7oCOnBnAjEaeQ0B1kPHC9LWoBXzuK?=
 =?us-ascii?Q?oI93aOn7V25HXUJNq7RwbVR/l0IeIlOL4IfgmU5yg2IZiyMvXT9kc0TUhDuT?=
 =?us-ascii?Q?9NT6e1oTZ86cPa3CZNH/czEvCWBQ6EAkiMhMzTEiHnPrLmFB6S687t1kTYPe?=
 =?us-ascii?Q?nNMellf1dKZl2rhp5xIG1lhhgZ4BKgUNI0YMqFbwzGoiXmzV3N4Jdyb5wzCF?=
 =?us-ascii?Q?We+WxOor/Jc5QhdBJQ96hSwmtdpdHQqlatu6SsY2f6jGamDPG3gPRdht/UKp?=
 =?us-ascii?Q?MCDEUw5MJG+mDXnfcY5EHCgcuUyzm6DTRH2e76vzEl8jyaRw5KaDyhljcV/T?=
 =?us-ascii?Q?pWyrfCiwiptulN4MlbO0QPPp98tucDy3aCyORime5K7zfYcAVVkD23xz4g5k?=
 =?us-ascii?Q?qlNF87dDkYW28OvMB6URWFf2OvruSBzU0d2A9taeQgZ7rK5XZHlbYxfJ4j5O?=
 =?us-ascii?Q?dtJBAOVHdHUhlSqnY8G1W2qq30NpBFPj321nq3UcPFLSxc+YYL+1V0p9Ypl7?=
 =?us-ascii?Q?vzKFeFYQ0vdmWQlMoNX8iz3+oUPeIvZ9gVfXlVqPIExy93Kv73QVOvIGuFnP?=
 =?us-ascii?Q?E3j5AM0X4jhNnZXwEqxZrhDEforywT6uTSN9B3wJJMcI9dU4DKiR5BNf4g+7?=
 =?us-ascii?Q?HCHvuhPnhywQ7lsDRhxGIMS8RMtLrbNBhEr4ZrPbtmcgLw7IS17QldpxllCd?=
 =?us-ascii?Q?4tOfrmtEjbRW5sZLIjudCIcJTB58?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HQkkH3VaNKvgfOC9AZ3rbM6ashMIXjmE0aFLzi+VbsIZUU8xKvg2D7QFe22Y?=
 =?us-ascii?Q?PavDSHOk+g3U7RESgHxWzGmeYddQaJd0orxwP8r91Vb9/jkIWOVe0WO8UnUQ?=
 =?us-ascii?Q?zwlJXUm4dIR6DR+uYjxMk6Y33wPm0lsD406UyJqtKxkoXcqVF2kauC4+7tRD?=
 =?us-ascii?Q?h2vUz/27wehUXukkTKaBWlD485Xyi05LwSySzzGtwXfNYcBRliNFROrIGZOb?=
 =?us-ascii?Q?amSgQjHnvOGM9yljDKcCzmh/v3f9QRq1uy3ycUtcBJ4NkY3fojBO48HTSHBh?=
 =?us-ascii?Q?bW3pVbiEANqgVlFnicXFG2meiJLwjUCNKmDu03QRErZwowCCaRefKb488bLv?=
 =?us-ascii?Q?yqv9jsJIQpZPx/6i/SJ242hzr1sLOim/NGSOu0skdmK0Wz5EY4lqKMWlMMya?=
 =?us-ascii?Q?oGpK7tGcsBlYnXv28rUQLJZ2TVPfh/idzu635JAp5WBK9PmyMo/OyjDlwJCg?=
 =?us-ascii?Q?kBnsc1wVtxcMznpuPxxn2+kTbDiazr77OS3JsDVFfpRBobrwDqejZNTniGx7?=
 =?us-ascii?Q?9BwJANO7FQbb+5lCBU9Dw0jGZqDiXRRIM/EUNi19HF/KHoe9AhL5B1RMWwgx?=
 =?us-ascii?Q?oB3dCWiB2mY4yecxEMvS46z6wvbyguEWA4+V+X/jqqRjga3W9WzwN6a7be+P?=
 =?us-ascii?Q?NA6G7v5d6FneCa6wvAkDxe5uqwfWG2lK5kx9ezoUoFAbKC/pLRB/sTwtWKac?=
 =?us-ascii?Q?2vTkMxc7+nToHLpxLGbEIFc/uB7byuH07H8Op6HFhJrgTu1IbY1yyBbPL/bV?=
 =?us-ascii?Q?BI28n6bOoms+aMPjtkaLZNl00ncHXMgceqQccIUbcwVqUiGoMWlc1uKDYZSQ?=
 =?us-ascii?Q?7NXnKE4D9up0NN3Js9KFDGo0lJhS745zkz4kgp5mctg5IiFxvRV9r5ZQzVqD?=
 =?us-ascii?Q?hgIe/CciWtsmh9vCINBer33GTh8i4W2jmjQbdLYR5NXMBOK5g00mHp/rk0qM?=
 =?us-ascii?Q?IJ2IWQ9Dnbv4rkeNHGjlp+0ig9xSzg0ud/pes9MjiWFDN4VnnngeK/Y5L8CF?=
 =?us-ascii?Q?zVC2nl3T2zN14lap486w/UvcOfWTquKsh3ie/ZUAc2oA6xwiOEZo6BSJqSIG?=
 =?us-ascii?Q?mfpbj1gfBJtxnt5ZpXgYeAkWxvzftWtOqw0ajRIo7pX5YK34yfld5ljblpNa?=
 =?us-ascii?Q?o3qD2SxRjoqDAJnhZGeOxoc2v0MqsfKoAn0xU5Wj6TDBU+r7qvMmR1Y7B9pr?=
 =?us-ascii?Q?VY+4h4H0EJrRbWxOKXiGxh4y3fJ4HeLnXELooJDbL3EZwUEByxrksgTuOb40?=
 =?us-ascii?Q?rAdTRqG+YLlPQQivnYtmuZhHEAvEZgNb6li/gJib0JpPwtnVd5Y6kPOXZ9E1?=
 =?us-ascii?Q?9q0fsUTOLUN4dVCT3SHDIcKVgpLKvS2cjw+hU9XDGG30hjEnP0sqOPIOviaJ?=
 =?us-ascii?Q?M8+CqSQIuLowgOT0hSw33OO/DtzZYO49qyIfUzGBrdK++2GGFYBuQwVdj+JZ?=
 =?us-ascii?Q?t735P8dfMLvonVq6onptTGBBB/tOujJvXLW7UdrcEBSL50MC9YCLHKoxuUkf?=
 =?us-ascii?Q?B3KKuCiuR8DisfwDXZ21b0kPpsGBzkWLNCpXEifzBf6O3SzdLh6ITdtAPF4G?=
 =?us-ascii?Q?9H9PrKwhDDfmuPby9dPPYcb1xqM/saHe+KD1kI/s?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gvjj91Znp21abli1y/V88ZvA2HDWN8S3Lb7czbS771del1M8vb+e/bY+Zl8T6xnAue3ZBEfIOU3t/NwGY64WZgv73KQrKH6fr7RqD/SLN/ktUR9TNZzedtr7TKf3d5pPft/Os5OQNGGM1pamXbebxQv7M0h31u0UqK6PDDx1E9sTO/QxIABnE2ug9zdhsgmUTiXCVW9ct2qQQSDDqC4p7vgc2OY+UjzAc0xgJu9sgpDA3oYTEmyc7XVpS//JSoCOI56WbMvukCTDacNkArprkFo2CWS43G+CmQBStI/Nzkgt9ORcme2hZDQtCYV4B6Qg9xiq1fcPJzMt1f+yAvVCITUI6p0FRuY1mkiwrM8ivNLVFEpjFgxFSNWweYwEL48MfWPQPXhFFmc1mW1nk9CZkOY+9OJoFdRxCnWQZf6oIouvGHtBHDcGNEcD7vIBTJZuPROGRRxfyKv3Dhz7ERHU4UwWnbQQVN0x45u5xZzulXmuXc8HK9ORwxa7alZNk0OWs/bfSYQGaV9mRiR/AfuAIxe+jIfKZ4zrVBZ2SyoLhONyiW5KfjKmZkenI/84gKXZqft3UiwTitVfzFV7lfs2lsM5RCnrVzCx+trNL15sxlQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d13b8f-a1db-4bc6-a7cf-08dd995ab142
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:35.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +m+kj0LmVuJiYrqcSebVVEnn8Q2Dl2+zeTAmeIZAz13b8+mX14IhdaOdAMq1fHAqRuaPStCaukCNErb1uyGoCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MSBTYWx0ZWRfX51xhKHTFZAkS v4WgcLU2+rup+TM2hMtWhbrCsGZwd96mwUSynbla9OrS7882/vxuCKPMZZ5njM4ARHFQMVGdNaG HRx6rvcKbKbhRzPA5z2EhdmA1W5Iy8ugkR89fqV1W01fe/JljjB/kH+Bi1pwaTtSjVg2oV9nbZy
 5ChqGhc3A7gBvLyJt9AAFv4WjiC3jbQHhznbjPLSqFdtN6ItqCXAimuzyRxztSG+W1204G1uJZh +2M/AL3J5DvXPf6a4hmhsVjWABI7IjdImz+BAGZ+ArYzl19qc0WQ4FQ/0F7y+p3yP8Y1AUO6dK7 MpBBz1O2phEI+XM4qb3NJtzVeMMmEbOtCQYy6JeAgEyA3nusp8GjvVn0uAjWOj9xT5MQpCT+jYr
 WMH2VKt0nXB5qaJbcauNR9YgueIbcEmheiHFikg1GMeJpLII5aaGGvIdTiSzd3vsRe4+IDAI
X-Proofpoint-ORIG-GUID: oUuYbnW8gQWqMkDNHv4b_PsczMQrT0bV
X-Proofpoint-GUID: oUuYbnW8gQWqMkDNHv4b_PsczMQrT0bV
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f6688 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ucXKd3twMO7rDMujzR8A:9 cc=ntf awl=host:14714

From: Eugene Loh <eugene.loh@oracle.com>

Also, a few old tests, which tested caller and stackdepth using the
dtrace provider, are now superfluous given the new, provider-named
tests.  The old tests were extremely lenient -- e.g., simply
checking that these built-in variables were not -1, even though
both variables are unsigned anyhow!

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/builtinvar/tst.caller.d         | 25 -------------------
 .../variables/bvar/tst.caller-dtrace.d        | 19 ++++++++++++++
 .../variables/bvar/tst.caller-dtrace.r        |  1 +
 test/unittest/variables/bvar/tst.caller.d     | 23 -----------------
 .../variables/bvar/tst.stackdepth-dtrace.d    | 22 ++++++++++++++++
 .../variables/bvar/tst.stackdepth-dtrace.r    |  5 ++++
 test/unittest/variables/bvar/tst.stackdepth.d | 23 -----------------
 7 files changed, 47 insertions(+), 71 deletions(-)
 delete mode 100644 test/unittest/builtinvar/tst.caller.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-dtrace.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-dtrace.r
 delete mode 100644 test/unittest/variables/bvar/tst.caller.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-dtrace.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-dtrace.r
 delete mode 100644 test/unittest/variables/bvar/tst.stackdepth.d

diff --git a/test/unittest/builtinvar/tst.caller.d b/test/unittest/builtinvar/tst.caller.d
deleted file mode 100644
index 19a4bab9e..000000000
--- a/test/unittest/builtinvar/tst.caller.d
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: print 'caller' and make sure it succeeds.
- *
- * SECTION: Variables/Built-in Variables
- */
-
-#pragma D option quiet
-
-BEGIN
-{
-	printf("The caller is %u\n", caller);
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/variables/bvar/tst.caller-dtrace.d b/test/unittest/variables/bvar/tst.caller-dtrace.d
new file mode 100644
index 000000000..d69386930
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-dtrace.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+BEGIN {
+	trace(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-dtrace.r b/test/unittest/variables/bvar/tst.caller-dtrace.r
new file mode 100644
index 000000000..573541ac9
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-dtrace.r
@@ -0,0 +1 @@
+0
diff --git a/test/unittest/variables/bvar/tst.caller.d b/test/unittest/variables/bvar/tst.caller.d
deleted file mode 100644
index 3d64fa98c..000000000
--- a/test/unittest/variables/bvar/tst.caller.d
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2020, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The 'caller' variable can be accessed and is not -1.
- *
- * SECTION: Variables/Built-in Variables/caller
- */
-
-#pragma D option quiet
-
-BEGIN {
-	trace(caller);
-	exit(caller != -1 ? 0 : 1);
-}
-
-ERROR {
-	exit(1);
-}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-dtrace.d b/test/unittest/variables/bvar/tst.stackdepth-dtrace.d
new file mode 100644
index 000000000..f0f828f23
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-dtrace.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+BEGIN {
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack();
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-dtrace.r b/test/unittest/variables/bvar/tst.stackdepth-dtrace.r
new file mode 100644
index 000000000..1afb1f057
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-dtrace.r
@@ -0,0 +1,5 @@
+DEPTH 0
+TRACE BEGIN
+
+TRACE END
+
diff --git a/test/unittest/variables/bvar/tst.stackdepth.d b/test/unittest/variables/bvar/tst.stackdepth.d
deleted file mode 100644
index ad728fd85..000000000
--- a/test/unittest/variables/bvar/tst.stackdepth.d
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2020, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The 'stackdepth' variable can be accessed and is not -1.
- *
- * SECTION: Variables/Built-in Variables/stackdepth
- */
-
-#pragma D option quiet
-
-BEGIN {
-	trace(stackdepth);
-	exit(stackdepth != -1 ? 0 : 1);
-}
-
-ERROR {
-	exit(1);
-}
-- 
2.43.5

