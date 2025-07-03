Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29F52E339E
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555003; cv=fail; b=Q4zCQMrWGVIdXW91bnKHhfaXYpjd6A96IjBoftUUjQ+112B9sh5P4CkZSiVc0gFYqrf17XmZXOFuYVC5RFeaapo3VS6K/lAQ4hJcVkH4U9CkWZ4VNV1THLMkg8IIAnR8GSDVI/Nq+sCZllIVRMQpObawmyet+xY67K0CqLmh0ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555003; c=relaxed/simple;
	bh=HlRzHcMd99E9QFJGG1E/a2ri+3FANJGVUGmKCcLzl30=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vvmv8DT+IPEZcWUyCz8DNHeMhvhpYMdA0lgi+R22NeCOoTjX/E2tiAlAatbJHDX3zjW7lblf51ss4GAtBRe1kRQ7l1VSFZYuukObdELjTi45TuMQs8+3w+4TAGchxMYrvNOGl7+YLgvB2EwSPGowdY4JSc9NMAg9LGDVOe9ebRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XvmX1EEs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MGy5es5V; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XvmX1EEs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MGy5es5V"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZldn005351
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 15:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dS4RedImgNmI5mJ8oezee6iMuCh+7ccyaS4+ZtfOvL8=; b=
	XvmX1EEsNq35NJghw1leHiNpVX5Eg0e+3UpjzhrJmBmUVTdPkdz+THgAx2Ufj1ip
	kkJd0TEIoPNaOFUDf25Lq0C7cFGEUwHAWvw5u81v+g1T4vDzO2WFVCwYlchjYH6d
	rXourVnQ7nQDXT7QU1kJQUErAL0N323mp6+94w844jQjs9z/El2Y8MxsJzdtpF0f
	yY5B1bHSVpwMIwb7AIxSOn2CQ0503yTCvUX4i/p8Z7j5kechOE2HuaGxpcONHmkc
	hxqcTou/3PKtNrpJ31346NjiJfUDWR1GAf0Y7Cu5KqWeRfeopAkIRqYZp0oKVZvd
	Ukqa/Qw4pMQ66Cl5UMsp2g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfh519-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 15:03:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563Dc7FT025014
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 15:03:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uctbpx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 15:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kyr2Aje69Q5wtsM2XlWo8InsSuZRHNdIMpu1SC4OcQcrMfBJxU1wZ6BawMCWgfGF6NqmWFB+esrHhBH1nY+MuiqY/3Dmduyu9j9ayWyXBoTgwn02O8o6ERdzYBpsXIPGCLAuHBZdtvKr39Lmv1Cc8Ww8Z/GDdeLn7D41MiNZkkhTkdG7GslXLyHaTvqptLeFo01dssOfMfuRhQYkP4Ojfpf44iuCkhBZ0ecVIlb/q/hVqLQ+HQOi+U0FxKoTmXMKfCf30NQ+vMsMl+a/bALmPqJITwy1GHPnGxAD/eO2uryclFToacr2Gl1fvxO+/+YXajLp1AykxMIuZeHU8EstdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS4RedImgNmI5mJ8oezee6iMuCh+7ccyaS4+ZtfOvL8=;
 b=cNGvGnMkSfq+3APk37ZKUInej53tZnEtO710NhgnkB1fcugYxy2gup/CfVfmSUL11/qzsO8uY+NLE6rkPQW9HpAS/97qUMrKOh7mmslm/xt2Uhd2T/w9WQTOoWfldEm9y7FwZK5a3CCd1aF2SkwqNeYLB+SMWcwrU0oJ7U8uNhtCaHbyz52J/mhuPFfGJmvaFNVt9ykWgawKeyi6WCUomYvbjvgc5SvVrrlex4jutyXjpueX+bH1TO7isEj+ct7R6iwvTZNSxDopVjweSNB+pdZQNQQeRCmstGeK4Vq4MbzECO4bwFrcVKPweD8ZXbwTyevVKlH7vAswEPFWNSh5Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dS4RedImgNmI5mJ8oezee6iMuCh+7ccyaS4+ZtfOvL8=;
 b=MGy5es5VVFI3zjrdr2S5XaTkbJuacz7sDjkmn42VwZIqnSAGOLNXMQN8/71Hoteo60L+rMv8u3NCT7yaErTN0NAodMG6XECUSlnRyrEMjpx5zwK76JJe0JPiEQ77K0rUaYTMVG7pVaT2OqKGt3qKVMMGPK81OhUF1oY0j//Zk1o=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 IA4PR10MB8469.namprd10.prod.outlook.com (2603:10b6:208:561::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.28; Thu, 3 Jul 2025 15:03:12 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 15:03:12 +0000
Message-ID: <c9f2698d-00b9-45fe-93ab-d030766475ac@oracle.com>
Date: Thu, 3 Jul 2025 16:03:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dtrace: add tcp provider
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-4-alan.maguire@oracle.com>
 <8ed88a3b-6e37-a696-d6bb-38745c144995@oracle.com>
 <fb5b1e66-a2a5-4dd1-8c58-2477b1ca6894@oracle.com>
 <148eabc7-ee00-33fe-b013-0f48fda0163a@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <148eabc7-ee00-33fe-b013-0f48fda0163a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::10) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|IA4PR10MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 898c6bd6-c4a6-4a26-c603-08ddba42bad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFdzVjFHekZDaGlHbDlDd0MxN0MwTzRwcDcxSWwwakpDblEwMTA0OTlTR1Jk?=
 =?utf-8?B?eFllVEJaVC9NU0l4QnNMTHpvSjZrT1FSYStDSkllOXBrcHBiOHpnWXFVU0or?=
 =?utf-8?B?Z1dNdVZRQmxNNCttSS9MdnBCZTFpOHB1NTYvcGhUMGNLbjdoajFoRUNNT215?=
 =?utf-8?B?M3V4NWZJSlZBd0JnbURKYkpSSkxqdGlXT2h5QU81WXZEYzhySXRoK1NsVHdp?=
 =?utf-8?B?VS9JRXdVbDBxWVRCR09LZTdQT25LQ052TEw2a1liRUs2WEpWekc5Q1JwckVl?=
 =?utf-8?B?VUZ3eUsxb1NTZ3I0Znh2dlJFMlJCRHBNSFNFYTMvcDZFMWFHSEhQbTROeXlF?=
 =?utf-8?B?T2xsN1BMNEZmOHdDR0d1RW5JcHlvbWwrd1IzRERXTFl6aGJvdiswN2xpY0xY?=
 =?utf-8?B?ZVh5OUMzVVdBTjUxNlNXM2ZvL1NBclpINkNiYngxanZSR25tWkVsOEtOYWxu?=
 =?utf-8?B?N2lFUWdLWG41UWdONWRUTDAxYjJFKzZJcjlpc2RoQ1JrRnA4QUJ3aytQZitI?=
 =?utf-8?B?UEhPaENpamdXSk9lZE1mdjlqYzVJV1dVaGhRYy9uZ2Z1Y1NIOFJVWGlZWnVi?=
 =?utf-8?B?L2JWRzVzcHdjWkRsTGM4V2JqM3JyV0NpWGhFZE02K0doNDEvY3pTT3JBZkVK?=
 =?utf-8?B?elRId01JcXFvcVl2N3RiZXVOWTd3eUdEOEJaRG1DeldrbnhDKzc5QnFNaVFU?=
 =?utf-8?B?ajByZHYyOWZhak1Vci82Z0s1aXFMd1FDUFArVE5rMDhjYXNOM0xMT29VaE1W?=
 =?utf-8?B?UGV6TFBCRGY3NElOMXovcUdHSGhTK1ZpQW1PNm5LM01HYVpPMFpBOEQrd1hq?=
 =?utf-8?B?ZVNBRFBYSGxrWDlzZExTV2IrVUFJTHJlempIM043VEpBWXJCNWVNV2hSWUVO?=
 =?utf-8?B?dWpEd2ZELy9JUDBIM2l3cGx2eTRFaWhtcnNhTWM3c0N1dXhrMExWUjBFdk1N?=
 =?utf-8?B?UTNxbnRjU1VHM3JDWFBCRzU4MmtGMmxRYUdlR2I3SzBLVkVxanpZVDZuUnJT?=
 =?utf-8?B?dk1Tak5CTlBnZXhQNk13MFE2K2lWYm1xcVlYMHNXT3g4ZktzMzRSbTFPSGUr?=
 =?utf-8?B?VVA5YmtGOHJFdGtIempveSs5L3R4WWtzL09CaFNyQjQvOVJ4cnBhQ29jTG1E?=
 =?utf-8?B?Qit0cDljV3BwbnFOSTg4SS9XY2VQNXNGN001NDRYZDJWTUpHOXg3dUR4WHk5?=
 =?utf-8?B?SUtiZ1AranRPaWZtQk52ZGtaWEdEcjVlSXBnQTJobEZJVC9jVmZQYjd4VkJa?=
 =?utf-8?B?T010QzRHN1NDN0phRVE5emhWUTVKamZvVTdXdmlmNzY3Z0lwNFZldE9veWtK?=
 =?utf-8?B?NU01OUVpQ0dkV0FUaHpGb2tZU1QrVlQ1aDNqUnYwSHA1MjFHRW1hVWFmODFM?=
 =?utf-8?B?MXFkdDlnaHJTNmpwQTdabDR5VzZqcHBCb3prdkdlODFNc3J4bE94c3I5WGRV?=
 =?utf-8?B?TUswdUhGbGQ5bkdodERjdXRMbU9oZUQ0a0F1c1YxcDVBb1U1REYvU3UxeWJT?=
 =?utf-8?B?ejZ6ak9aanlnd3ViWkJMTGRtNEZidzYvZVBUV0hBSE16WHlHZDJOd2F5SGpY?=
 =?utf-8?B?bVFSVzcwRmlXMXJ0UDB4L25EK3VHcWVPN2pLWjhRZU92VGl6djZkejhBR0k4?=
 =?utf-8?B?WUFFRFpOanRMV012Rmt5ZHJjWnRsYy8rUERuNWxSVGdsTGUwV1VSNkJxNGpQ?=
 =?utf-8?B?c2l5Yk9GeHY4MnFRRTBxR1hoMEUrcm1IMHo0bUM5bjVISy9jTmpYdk94Y1FT?=
 =?utf-8?B?WC8vL2E0VDBIdkV3MU5XdHlWMHg1UjczdlQ0RlNJSTBUK3hBaHZ2OTNUYVNT?=
 =?utf-8?B?YThiL2hISTVFbTRvSlFpNkV3TjFvOTNrOW9IMWZ6WWIwNGFMMWpCQm4vNkND?=
 =?utf-8?B?TEEwZXZLc2xBTEdybG54ZlhrcHVNUS9uSXNhWjI4c2VrMlpTdEQzcUhxblg3?=
 =?utf-8?Q?BZvAUI5HnsU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1B6M2hKQmQxeEMzUUc2aGJhd0F3ZkpVTU5sVHp1dG9QOUlGc21ZV2FXdXM0?=
 =?utf-8?B?WStkd3A2T2pIYXJMckU2UE83ak1lYldUN2xUaXRVOE1GNEN1TjhWTGQ0NGQ0?=
 =?utf-8?B?NVNnb1BGYkVvVm9XeC9lUVRwbk9tcTJubXlESHdKTnlySVphUnRlUk84K1ZJ?=
 =?utf-8?B?STh3QnFYL0JQMGx3TGV2NVg1UnU4RGZuajdLN2JRVUpzYnJZWnFXUTk3ZHJF?=
 =?utf-8?B?QlRQZlprQnJiZ0gvNFcvTzQ1V25GUEpJakcxYlptVWUwcVg1OXkrRTMyUklM?=
 =?utf-8?B?c29hSmhXRENVS3NKbGdpNmo1dDVHdUF5aDVkalRJdlpSOTZOTVJ6ZHlJSVNk?=
 =?utf-8?B?QjU5THp4VXdQcEdVSEplK3QvOHlDSG9UMXFrWGdkNmxReE5zR25ab095UDND?=
 =?utf-8?B?VlY1UGp4NE9xZVJudklaYXovYmJkWGF6Zy84am8rWHhRbHFZdVpoUzJYZFZT?=
 =?utf-8?B?V2M0VHJzVG11cEc0ZHRDdDJhajRZenFia0FweXEzZ2xTMnBFNExWWnBDOUpH?=
 =?utf-8?B?TzJUMWFYWGxXZnUvMnF5T0FYQ3NvTUk2czlTd204UlBKQWplV2FrSE9vUlMw?=
 =?utf-8?B?OW9Vc3EyRS9ubFdMenRWT0VmRmJMZlk0eEdpbFFCdnYrQ2lORVY1Uno2L2JC?=
 =?utf-8?B?d2pxSUd1YWMrQ2Y2cmVzUnhvR0tlK3h5TEZHekkwODZGZDlwRDJiOWZIQ0Ix?=
 =?utf-8?B?cFBXS0xqTkFBS2ZkbzFETzdZRWRVSW5IRnNrYlNMc0RlVVh5d3p2VStYRmN3?=
 =?utf-8?B?Zzg1TC9vbDJwUHBQUS9iOGo4N3VXemp3enk1RXFlYWhMc0tsM20xcmhFMXBx?=
 =?utf-8?B?cnRqOERWMFFWYzJHMUUydEd1R1NOWnVXRDhZVGJuckRscVAvbVdLR01pRGRO?=
 =?utf-8?B?eFZmREtoYWEvSmdBaE9yWjBCZWxsTEVnRTN3N2hXbHVqU2N6dEl2VXFwRXQy?=
 =?utf-8?B?ZURXdFZ4YUlqVUZMc0oyNE9Qa2MzSE5uYzFnU0RucXFkQWtwa3RxcVhTS1Z3?=
 =?utf-8?B?UU00aUFFalM4QjZTK3VLWmU3c05oRjZ1ejVzckVBNndwdjhwUC9BQnRNRzA5?=
 =?utf-8?B?T21wWkVDVEp4aHFpUDFsTDdpejBLaE1COVU2ZUYvaHI3dXNRWEx4dGFadHdL?=
 =?utf-8?B?N0lxYjNOQWxZcHltOGVsK3hGOUZNUlMzWkJ3Z3RVOEl0Zk9yUE5BU0VDaE9I?=
 =?utf-8?B?M0EyVGdhS3lBakhpVzFDZ2x5UklzS0xEeDRwYUJtcWdLYU9QdTYrVEtRMTRO?=
 =?utf-8?B?WDVaMys3Qm1jQmxLbUViU1FtcDY2b3ZxNFlKOFlpUktxQyt5VU13dnNTd3VL?=
 =?utf-8?B?alp5a2U4Vzh0NUMvbGMvNDY5aGhwekZGaUdxU0JSZTRQTTQ4TWI2NUNnZkNt?=
 =?utf-8?B?TjltQ0tNVWtNOG43YzJsV3E2dzhzNy9DUkVRUnAvcFQ5QkZWWU16Q2NIY2la?=
 =?utf-8?B?MThEamN4Wm00VW9iMTZTT0wzUkdIblcvZ1Y5TVdxSyszZG5LNWZlZjg0WWhT?=
 =?utf-8?B?eUtDelZVb1pzSGNnK0t3dHF5WnlnOXpsbFJGeGJvN1NqS0ZjRUo1cGRlSzh2?=
 =?utf-8?B?T0JDQUYrWFlpMGM2bjMzSWtCTnYrUkpTc215c1YrR1lBUGhkdjlBY1ViUDBV?=
 =?utf-8?B?T2hoMWZpSkFCblJIenpocThxV0JHREYzMnhOMGdndXFub25YQXBZdE9LTnFi?=
 =?utf-8?B?T1F5VWRhTVVlaG0rWmxkRVhpS2F2Sy85RDRxUWJSTVRJUEJDODkvWHA5WXNV?=
 =?utf-8?B?MGUwcHg3ckJnZCtVS2lDR3RwVUZZbHVDSDhOR2N5UGw2VTcvTFJ2M1dMRkZ1?=
 =?utf-8?B?eG5ZSDY5bEh1dGZka3ZvaWlFTklreDdZb1dEQlY4YzVGUTVVUUI3YjZwYzBt?=
 =?utf-8?B?ODAySFhXTDFnK09HeVAyN1MzYlplV3VUY284RkNEeVJ0U1VQRS9LZ3h6QmJy?=
 =?utf-8?B?bEhmUFBzbDBYOThHSEdmaCtQdUZrQnR4RjhtcXg5QS9DSm84bGM3WCtwMWdM?=
 =?utf-8?B?My9PNDRxQ3ZMQ091Tm9mVFovMnk2eExDUXprS2JRbVNMVW1XWUpFdlk0SnVU?=
 =?utf-8?B?QnpzK0pTYXA4eUVwKzdIUXUxQ3hwNllhaGRkMy9Xby91dlErMi90S3VtZTFZ?=
 =?utf-8?B?ZVl1a1dQQ3JVQk9uN3R0SkR5MWl1aE41R00zalNDWG9LdTV3c0ViZEdpOGxp?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dxOkYqOVlO6uTaV/VjYBI1coknuNtMuO9FLn4MRkpmjrQjqehLVE7m42+J0+jX1Ia59XsAf4f9vB8QyptkRAoLPZwMCvqAC3tULx8xsVHaoeE2joGIVNltK3UzJ+TyitqYNfETOG06OMpesG7O3DICfY0ilN0ZUoY8dpvZhgerDJkLm6wLoJ1U+NZBIq7R2p1uFsyNbiMGdNgEtvbkkdMIj6nVGqJHvh5/i+NxyRataKcojEmWQCT4kt484gHouUcOiwBcfdhqUrmohM72+TbO5ZDw+yh/0NuVztDj4sa1iAoO1OxKzOotcsJZBU83haSDIlymLn2Uzhk/wFD7KmGAfhFyNno5DdRhVniVqFbgO+4ElW7tG6AiuilbLM51pPmDrGmB12laW931sNjnotnZu4w1OPp0WIOlmi9HU/Oo6yvRsm56YThOrWb5HYcksWbGjluj5YK4yX5MbN2wzTVrswjFyXGqBF83DoKmrKf3Z6yZPnNO84Siy4LNGXEbw2OhQ8FQ62mZ6cpNJqWTkWafVB2SPeXfk//4k+NfTUeZI+gVv8sRD4qcX+1nSDvkm22Qbk4nEldVmp33WAxFsFjwhCn182osOBl5qUA9pyVwo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898c6bd6-c4a6-4a26-c603-08ddba42bad4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:03:12.4267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAYn+/rdpTGbEtLuxXjwfvJnb+2zVeOCh3rUhuWGzIcHw5ts0Lvx2OkrTF2OShM6kkgMWl5kDTGG7gP7V9WgFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030126
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68669bb8 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=-6bxpoeYeNNqKkBl110A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13565
X-Proofpoint-GUID: 4CMSeKEIJdhu__ACWaBPZ3Sz1D1FyGCK
X-Proofpoint-ORIG-GUID: 4CMSeKEIJdhu__ACWaBPZ3Sz1D1FyGCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNiBTYWx0ZWRfX7xyAD7NnvDWn VX+FUjf/fKyEbH/XBneIpVvcoapaZUG48kc3Tk0vAL3j0DvoSpTZ8xpAVhbqj49jBNM3l6cbZkU Nu6A5EPkKwDTeTI7NZiWnuLyuA1BmTXc6nughi7om/8Lig71jFsq+mVVvTzM22qgSdpVJJaijVp
 kiooE7h6tP8m/ndMp7UkAuvRdTKewEK2UQ2lwFXEHxxMk7LS0kXJtsDyRWAzzOCVKglQwRLf4QE rAlUiHq8/xJtsXisErX+nb0yzT88AIe04xWUjX0H4di4+Ak2iTUgApnYc1ijRFgRo8yTebnuFbf uNLT5iekcO9u0oBTnrsmgryXfBd702u2J4xh9zNNmc20Kfay6MsMQaea0fsykbpejLMMMCR9Sza
 TP+ZytPogstFWB3E9f0q0C7CSPUMySvd03TfUYe6xz1n8kU0GvMde3997g0ORbvMZ8CBcKJP

On 03/07/2025 01:02, Eugene Loh wrote:
> On 7/2/25 11:06, Alan Maguire wrote:
> 
>> On 02/07/2025 00:16, Eugene Loh wrote:
>>> On most VMs,
>>>      test/unittest/tcp/tst.ipv4remotetcp.sh
>>>      test/unittest/tcp/tst.ipv4remotetcpstate.sh
>>> xfail due to missing remote.  Are we okay with "shrugging our shoulders"
>>> like that?
>> Yeah, I don't think the remote test is robust enough. Specifically in
>> OCI it seems to always fail. I'd suggest we replace it with creating a
>> network namespace with IP addresses configured on top of veths to
>> simulate the remote case, the codepaths will be the same. I've done this
>> in other test suites and it works well.
> 
> Sounds great (if "we" is "you", haha).
>

I had a go; see

https://lore.kernel.org/dtrace/20250703113345.1273604-1-alan.maguire@oracle.com/


>>> Meanwhile, my one non-OCI VM ran those tests.  The first test passes.
>>> The second one consistently reports
>>>      -tcp:::state-change to time-wait - yes
>>>      +tcp:::state-change to time-wait - no
>> I hit some of these failure during development; adding the
>> fbt::tcp_time_wait:entry probe helped. Is that inlined or something
>> perhaps (grep tcp_time_wait /proc/kallsyms)?
> 
> On the VM in question:
> 
> # grep -w tcp_time_wait /proc/kallsyms
> ffffffff92ad25b0 T tcp_time_wait
> # dtrace -lP fbt |& grep tcp_time_wait
> 49373        fbt           vmlinux                     tcp_time_wait return
> 49372        fbt           vmlinux                     tcp_time_wait entry
> # dtrace -lP rawfbt |& grep tcp_time_wait
> 51079     rawfbt           vmlinux                     tcp_time_wait return
> 51078     rawfbt           vmlinux                     tcp_time_wait entry
>

I'm not sure if it's related, but in testing the IP provider with the
net namespace stuff I saw some weird behaviour with the IP sdt probes
that had multiple underlying probe definitions. If we had a program with
ip:::send and ip:::receive, we were often left one probe short (i.e. no
BPF prog created/attached) whatever the first probe point in the program
was.  So if I traced ip:::send then ip:::receive the ip6_finish_output
send probe was missing and the test failed. Reversing the order seemed
to transfer the problem to the receive probe. So maybe there's a general
bug around synthetic probes that's biting us here? Not sure but I'll
investigate further.

>>> and occasionally reports stuff like
>>>      dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
>>> invalid address (0x1fc0c0000000000) at BPF pc 287
>>>      dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
>>> invalid address (0x225b80000000000) at BPF pc 287
>>>
>> ah, ok there must be a null deref somewhere. Haven't seen this before;
>> what kernel version/arch is this?
> 
> 5.15.0-300.161.13.el9uek.x86_64
> 
> FWIW, I can comment out all probes in tcp other than:
> 
>         { "send", DTRACE_PROBESPEC_NAME,
> "rawfbt::ip_send_unicast_reply:entry" },
> 
> Then I run
> 
> dtrace -c "$testdir/client.ip.pl tcp $dest $tcpport" -qn 'tcp:::send /
> args[2]->ip_saddr == "'$source'"/ { tcpsend++; }'
> 
> The disassembly shows that I look up args[2] using dt_bvar_args()
> (including checking for a fault).  Then we try to dereference args[2]-
>>ip_saddr.  We first check the pointer is non NULL.  Then we call
> dt_cg_load_scalar() to bpf_probe_read() from the desired location.  This
> call is problematic.
> 

Great, thanks for narrowing this down!

>>> The non-remote tests fail on OL8 UEK6 (x86 and arm).
>>>      dtrace: failed to compile script /dev/stdin:
>>>      ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>>> inet_ntoa arg#1 (ipaddr_t *):
>>>      Unknown type name
>>>
>> This is a weird failure; I see it on some systems but not on others.
>> In tcp.d we have
>>
>> #pragma D depends_on library net.d
>>
>> which contains the typedef for ipaddr_t ; it seems that's not enough to
>> pull in the typedef reliably. I suspect there is a timing element
>> involved here in when the net.d library is included. Perhaps there is a
>> better way to define ipaddr_t ; would using a builtin typedef in
>> _dtrace_typedefs_32/64 work better perhaps?
> 
> Don't know.
>

I'll dig into this further. If anyone has hints here it would be great.


>>> The probe names are
>>>      tcp:ip:*:*        Solaris
>>>      tcp:vmlinux:*:*   DTv1
>>>      tcp:vmlinux::*    with this patch (that is, no more function)
>>> I guess precedents have already been set for other SDT providers;  so,
>>> okay.  Just noting for my own sake.
>>> Meanwhile, the typed args[] have changed in number and type from
>>> Solaris> to DTv1 to this patch.  Does that merit discussion?
>> Hmm, that's not intentional (aside from the additional INBOUND/OUTBOUND
>> etc which we use to help inform translation).
> 
> Worth mentioning somewhere?
>

I guess though I hadn't really considered the fact that the argN values
become args[] values unless we intervene.

>> Do you see other changes aside from them? Thanks!
> 
> This is what I have for typed args[] for tcp probes.
> 
> The typed probe arguments for probes
>         accept-[refused|established]
>         connect-[refused|established|request]
>         receive
> are the same as for send.
> 
> The typed probe arguments for state-change may be different.
> 
> So, the typed probe arguments are (wide screen, fixed-width font):
> 
> args[0]:      args[1]:      args[2]:      args[3]: args[4]:     
> args[5]:      args[6]:      args[7]:
> 
>             send Solaris         pktinfo_t *   csinfo_t * ipinfo_t *   
> tcpsinfo_t *  tcpinfo_t *
>             send DTv1            (unknown)     (unknown) (unknown)    
> (unknown)     (unknown)     (unknown) int           int
>             send DTv2            pktinfo_t *   csinfo_t * ipinfo_t *   
> tcpsinfo_t *  tcpinfo_t *   int tcplsinfo_t * int
> 
>             state-change Solaris void          csinfo_t * void         
> tcpsinfo_t *  void          tcplsinfo_t *
>             state-change DTv1    (unknown)     (unknown) (unknown)    
> (unknown)     (unknown)     (unknown) int           int
>             state-change DTv2    void      *   csinfo_t * void     *   
> tcpsinfo_t *  void      *   void * tcplsinfo_t * int
> 
> Here, "DTv1" refers to legacy DTrace on Linux.  I guess we can ignore
> that.  By "DTv2" I mean your patch.  For state-change, Solaris calls
> some things "void" (not "void *") and tcplsinfo_t* moves from args[5] to
> args[6].

That latter one definitely needs fixing; I think in the other cases it's
just that we need to fix up the provider description as the fields
aren't set for Linux either.
