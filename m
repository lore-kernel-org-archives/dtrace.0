Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A6A1EDA0E
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750103038; cv=fail; b=B1ZzjO/qFfaEdA12Al0HRxCwwHQo5YucZ/rwcdh+ZcTD+9zWTJJR+osKpGLw/smuR8cDPwCzbFoBUce5pwttlmg6l+foPwcT3WLPd9RLzjO23dNMydaAxDYe/tjbHAhenfh43xVs8dCYDwnRaOCKJoKgF7PvFiaHlMdFgk09WtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750103038; c=relaxed/simple;
	bh=lx1tDPRqQX912LjIPEMJD71LoC9yr5iHMEJV0A6kfJU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aPyFOVX4vV4Ed4V/6o/phoGdRnCdMTeI+LNwkgQmqXhFnnnR3YpcyyOhRXCdqt5+rCuVAomvWtyX9KNBE6axyeZyBLeSO2FEUGDUZUjnmLTMPX/rY7FIQazSWi0vFIVCTusI1ngB8k0IEjKiaKkrLnZQQ6XD0EgWJ3XXb5G5VTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZmXX3i7b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=um7Ipa8m; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZmXX3i7b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="um7Ipa8m"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuUxB017647
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=QFGQGYET7tjJfapTkz4Lz9qGMSrzCZKe97etqoTqlXE=; b=
	ZmXX3i7bFCZ+qohVBIpVvqiucqTIdDfwNOprcEzm2wwQehCbdn+XXvWZxPjf1iV8
	Aq6ig9HD+0V6miZMI12rSfgO072wsYVZ6o7iYy6dejOMbWejtTkTorUlEMajZ2LM
	8jacv8+OBIQ2iqH5uXjOl0phCWRcrzSDQ4i0uF6e/EC0x/Rz7vjCVNgFsqvRwQsJ
	pskL/2N3aIyUsHnby8lMEaFijsbz6QL2b0Ty7XHRslZJigZoiEDgVChQaZaXmMy6
	DloDKn0+l1DpDO2w3h9nwq2r3CY0DADaQM0nfkgWB8i8oMKc3qYzmbG+RGUu1zqF
	EZ7exOIezsl6fLncdGe7WA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4kr1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:43:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GJAb4M000834
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:43:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8c1eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:43:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTKAMNsTOlvVNHD8gI6UAqwHj0kAtZtSwBFReEGbcnkCO8LVKjQVF5AHBAiy56CdzlW0rP//t90tMjmJs2IuS4GRQ2f5Iq69i3Z4JF41844Xim1lMD0XJ9qGf84v3CkZOYQvnw5cqkwMKB2IjTneOJp8BAEVqURmb8DEcnIu5WB+J/QK9Y0lmD1Q5JTJyX1XGx6rmtl3mT+OubD0K9om5jNo05YcXQoYp/UegE6Md+7/Aw6disY8Eo36trVFFsyGUocbocxy0Dn1Z/3m0ApjrSEfEsizb3yisS/tJ/MAREWy9Zrxz/zkOcM8E7fPGj9mMEtYD1/AQ44IECpFN0MxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFGQGYET7tjJfapTkz4Lz9qGMSrzCZKe97etqoTqlXE=;
 b=asYonUHPrp+WIQKCqXmqXGWls04OwqSkVIJdnK222FyBlu0q6iGfE9Wx0v7gTN5QuHCgcBQhEdS3rY6LxDzLrHyIBG38JRHUZAL+OSxYW7JUvGkYxXmT4+pb1kp/Ky8vPx6gksn87k8CgD0GIeLCyrpl7y6y+1bIdjJIcL+RLwm+UayvdTMwCb4QuTQQePcLDHmVLwolrFRoMBI4bjNRbnPzCLLnbCMx96Mw5oiVm58Drs+7MVIALH3dBRvdMer+/gS3TtuWikliTzVy95jJ9xZp5woXJ9nYKt+qnHqD1D2/GNUAgjmIvB9Q2mm4gHEpENP2vwDUOSI8eQq79u8ETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFGQGYET7tjJfapTkz4Lz9qGMSrzCZKe97etqoTqlXE=;
 b=um7Ipa8mFEojpvSci6ADETglvaw6/19q7v4Q4OFAx+iTR25BFk9qa/Ip+0lX+QmT2Wc6MTBoGJKU2cRZtjHIx2oefNu0MZnRiFpGGz4mXieh5t5m3U8Kf+3U6CAK/KKSZFDfiH91wyzNV4XI0TbVW2vvnHf9dSXmolJZ4E8IBns=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7713.namprd10.prod.outlook.com (2603:10b6:610:1bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:43:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Mon, 16 Jun 2025
 19:43:53 +0000
Message-ID: <28ab1e2c-d376-dcb4-bff8-4db5f1d12802@oracle.com>
Date: Mon, 16 Jun 2025 15:43:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 04/14] Test: caller and stackdepth tests
 for fbt provider
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <20250522180118.27343-4-eugene.loh@oracle.com> <87cyb7d7rc.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87cyb7d7rc.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:208:52d::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a10b885-6b8b-4dad-daca-08ddad0e1fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0YxN0lQdkZiYnVVMEQ0enFvZ2tUQjJ1QmZ5Tk5OdDdxK0tMdXNRRGR1S2lL?=
 =?utf-8?B?TlFpbytwSUw5b285S0ZNeFA0OENvdVhUSG5QWlhvY1dBUnBIU21QdEhZdHJy?=
 =?utf-8?B?MFdnSnFYRW9ROTR6ZzFHM1ZEYW44RjYrNXVGVFFZSlpXY2Y2R3Z1RGhkTXRq?=
 =?utf-8?B?RmxwckZIU00rWnYvOUtBYWowdVlGVk9rN1lyOHVkb25hQ1ErTk5ObzUrbmZv?=
 =?utf-8?B?UnBBU2dSNm9XRHh4dmlhdkl1U1cwTFNTMExBNkczWXdXNWxpbTdYbURmZHhL?=
 =?utf-8?B?SmM0VGFISUVJNlhVc0d4ekV0TktXUW05amU1T1FjRlpnWGNlakdBRysvOXE1?=
 =?utf-8?B?Q3ZScGhXNWNDQ0xsVWwzMm4wMHVUZjlXTFlVcEE4NXZZYUFSR1FpcFZaNVVl?=
 =?utf-8?B?VzJIeEhjSnZSU091enBRR3NLWkw3Mm05a2cxelBaZUNaVURFVDJCdVF4M0xC?=
 =?utf-8?B?TXFVY3NxN29vWXo4Mkg3UStSTFhCdld2MGZqRmpHeUZnSlBDZHJCOG43NzlI?=
 =?utf-8?B?NXYrblpaZi9XWWh1OVVKN3VnQjNsZ1labUh3em5xU0tXR3hycndMWm10ZitW?=
 =?utf-8?B?QzZFQTNwWmNLYTdON0Y5aHEzMWR1YmN6Ni92MitWY2xQQkdYeXRrQmpGMk03?=
 =?utf-8?B?RG9LZU50L05pZThlUjFwNGtnSDN6aDdsQUhRSElXUm9Cd1NxZllHT1M2WVFT?=
 =?utf-8?B?SmZrVHAvUDRHZnc5U3U4U0ZWTDRRQXYyem9pUUprTmdBTUlGT1Y0eEt1dHpo?=
 =?utf-8?B?RVdnZ1lHYmlFYzdlSVlMTlJLM1Z5Z3hGRnpQaVdhNnBwVWNOY2NnQ3ZLNVNK?=
 =?utf-8?B?bElIMU5sWkQzOWl0NUdzdE8wRVh0RThndkFoOG9CbjJ3RWdTRHk4ZkVTSG5T?=
 =?utf-8?B?ZnNwUk5aK0dwRHF2R1UzU3VLOW1ROFhQbzJXejdQNjdFVDU5VytScXV6eVI0?=
 =?utf-8?B?ZURDWmNLcEFUaU41cG5nUy9YQ1JyNWhQU2w4azE5L0lIZzdpQmRwTVNmT3VS?=
 =?utf-8?B?M3lPcmZvUk51d1hLVGt5Y1VESWduU09xZlh5bTh2dHd3YWxSekZBejI2RWlM?=
 =?utf-8?B?c3NFeGxxWXd3NE1CZWpwc1B1eDd0RlRTT0ozekphWmR4cGE0aG5Sei8wZUMr?=
 =?utf-8?B?VnZmSFE5MFlqVUhZemI0S2FVeTdUa2xTcGV5MGQ3NlkxR3NYdUNnRkM2RXY0?=
 =?utf-8?B?ckNaNDJhS3p4RHJMK1JJU09Nb2V2SlgxOCtDOE1Nc1luaXBJQlRLZUZrWlFI?=
 =?utf-8?B?eU5UTlNmTnRtaVdVbzdnOFZvb3dlRWMwMDVDYWwzYXhvaUJXcG1XOG1DTVIv?=
 =?utf-8?B?bk8za09uS3hzN09GZmI0bTl6cS9TQjlsRmdoemJsQ29wQXlvSUV3SmFJd0pC?=
 =?utf-8?B?WFBrQjVYTVZPNXJEekRxRFVZU0tGc0JybVlyL0VxajUyckVxTFlDY1M0anBi?=
 =?utf-8?B?d0h6YWF5ZnNET1Q3R0ZHdGVXNGJLSWZKeDNJM0VOLzNNbDJPU21SMVY4aEp0?=
 =?utf-8?B?TXJXN0ZLbkhldzRaakZjSlMwQks2azF4U2hIeG9EMWN6bC9oUGx0Mzc3TUV0?=
 =?utf-8?B?YWQxSUJNNXl4TXBtajlUSnZDZUJxck1qNlora0RJbkxzQW1TaGZPQ3R6VjN6?=
 =?utf-8?B?eWZ4TlNSUU1iSGJDY0wxWUdpSUIrY0NaZTArQkhhaDRYN09IT2UrT0hERFZ1?=
 =?utf-8?B?WHVyYkg3SU1lMTI2TXBXbEpyVWsxMzlLaWcycDJFN3dPdHRBd1BVcjg0UjJn?=
 =?utf-8?B?Z2cyejkyQ0RRZ09YK1RtMU42VGU4MjhETTdOYVNVWUFGTXNQY1VtZFRRSWJp?=
 =?utf-8?B?anFiRUhCTytqUmhaVi9wUEo4bnJqRUhJcG51TzJ1UFRBdDlVVUNtc1pVaVpO?=
 =?utf-8?B?Q2RTZW1oZStmSG1Ud055ajh4L0ZCNzdRcmk2OFY2bjlid1lpeWsyYkJ5UUlj?=
 =?utf-8?Q?yGBGwaQ+q88=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEI1czRGZ3IrTlU4K1UxbjU0a21FNUxscHZVYnlSYXk5TkVla3RLV0NrMSsy?=
 =?utf-8?B?dE9QMDArQjRpNDlQc2ZvbnhhZWQ4N25xdng1b1gvejJ5T3AwMVk4Q1ZaWnR5?=
 =?utf-8?B?T0tHS1JaUTZtUWtnNlpGbmJVVEU0a0VFZXBraWFSbHBZaG14ZnFJYysySlVx?=
 =?utf-8?B?V3hscVVWL3ZwWUt4VXJmQlhlOHI2OGZyN1M5TURNbnY3MVNWcDlBcUNCck5a?=
 =?utf-8?B?aG11R0gxVFNQcTY0b3NjY2VQdWpMYjJ0Qkp4VTRJeU5FWHB0cVpsTVlIZlZV?=
 =?utf-8?B?OWVpZFljVCtZRzE4TTJqQUNQTTVJclVObklVQVVSbVVlQThmbEo0cTRGckxC?=
 =?utf-8?B?MitXdGUvL2YzaTRQNTlSbCszTnArVE0vYkU4dTI0aFVLRnBZY3VuOFF5a0hR?=
 =?utf-8?B?MkhpcituMzhsRUxwR1lxL1NTMC9DSFFGdy94T1FMT0pkL0I4eTE1dVBvc09G?=
 =?utf-8?B?a2l3Tm5CWE42SEVHWHVnMGpSeWdlaEhxdkJ4T002aStGbzVYU1ovVkZpUlM0?=
 =?utf-8?B?bDREZnFvWktlVTdtQ1dnVE1sRHJzTHRwUlJJTHd6YUt4VXc0Qk1kdHRiL0hh?=
 =?utf-8?B?K21EVERndk9EcVYzb1Z6cVh1MDlyNlpPTWQ3T1FmYjhyNzllVjBDckExVlpq?=
 =?utf-8?B?VmRQVjVhSGhBeHF2bXVMaWpFSjRnT1B3a3ptdFpzdnVrQ2tFM3RKMjNPbVZj?=
 =?utf-8?B?TFM5TVREc1FIRm5KaUJpZUt0SFdic1ErVjRIT0hoay94eEhpTUJlNTF1dzhP?=
 =?utf-8?B?QXNQN0s2YmhFODlFTy9QMWpkVGhRSUNObExWcEhuUHVMUzN5T3hpWCtweHFq?=
 =?utf-8?B?WndTM2dybHdRa3orbHRnUXRmQTVFYWwvSktldWk2OFpPRzhiNXN4cldzTE5w?=
 =?utf-8?B?YWV4YkJSa3JiTmZPZFdmQzNvRUkvT3poUjBwUUxQZFRCeTZpVXY3RjBhcVBB?=
 =?utf-8?B?RmtTMkZjVDlwY05sMnBQc1MwOXpoZDdudzdiempKUnpOY3gvK2Nqa0FlWUtk?=
 =?utf-8?B?ZDhhTUZvOHRCZllhdHNWVDE4N1VCS2FPSzFhRkIvODZQdVZ4VmdtYjR4V256?=
 =?utf-8?B?a1VCdmVoOWcveTFIZUJEMW4yUCtoOHMwbEcwNFdCalRFeVRybFI0L0xmRUtF?=
 =?utf-8?B?eTdaSlNLdnZrRlZYMWR3ZHQyeStia0YvNHppaENyNkN0YTFHaXdEUG5KbDE5?=
 =?utf-8?B?QWVQeExwWjZNSGM0MmlyZ1p1YldBZGNwUGlubUdFV1o3MzdDZzV4djRFcktN?=
 =?utf-8?B?djFtaUpOVzBGOWQ3SXZzK0FKRVZxalRoZkRKZVhwSXlha09tUXBzUmlkMkNw?=
 =?utf-8?B?ZVJENWVYdEhnTm1FaFMxcENxcVIvU3g2c2haaC9lUUV0YTJ6OVNFRTBXUHRx?=
 =?utf-8?B?NU80VkxBSy9Eb1AyU001eTlYdUJVME1TS254c1hZT0Fyd1RjdlY5Q1RDbHFw?=
 =?utf-8?B?aEpVUjVtMFkva3NjSzlkWFVaOXN5SGJYbGtFL3VQRHFUOHg5c2p5Q1Rta3Zt?=
 =?utf-8?B?ME5YNFI3TGl4cGtHcktIa2ZjSjhxUVl6d3VCcjYvSER2ZlptbkNFczdQM2tp?=
 =?utf-8?B?MG1RWWNDUG13VUdKTXdqdHNDMlJjYWZzRkNtOVNPR2NHRUJpcDJPZGtOYzJq?=
 =?utf-8?B?Y08zNGxGMnMwajRFaWdTcEVDWGJXUU0vQ0pxSHpDRldRWXhuU2VRbjNBQWxl?=
 =?utf-8?B?OUh3YlJ3WGkyWGtIRHYrWWtjRkg2aTg5dTYzVS9GajV1aFQ2OFRoU0pCSWNQ?=
 =?utf-8?B?SDdCTHhqZzBKOW8rS3RKdWlCT0xLYUc2N3lPN01IdWt4MjArYmlvNGl2NVhp?=
 =?utf-8?B?bVNWRjkrbnFISkZ0cFZNSzcwMk1ZN2tWa1EySVRBYndpRndmc1pRUmRONDg1?=
 =?utf-8?B?T0N5MmU1Qmt2RVg1ejQyYUl0M0haSGxDc3FNSkQ5Z2MyOC9jSm5OWU5QbzNh?=
 =?utf-8?B?cm0wRjVPTFZOK1hpOE1GV28waFF0ZHE3UWpqaE9nbHozQXhHUGE0citsRU5v?=
 =?utf-8?B?aWltd2d4SDNCSEFsalI3NUh6MHhHaU1mb2pKbjZ3OWx5RGFucXJrNmpOZjcr?=
 =?utf-8?B?azJ5QklyZThNbmpZMk1yQ3JOUGhiZktJTlFVYjV1L2JuS3YyTThhZU9KcVY1?=
 =?utf-8?Q?AB15J7B660/cfjh+tL8+Si7r5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cppgXtYmUinjrZxsz4yZiMlz4Xl3IkHidAs0gwpbgjb2sv7eL79/RPgkbKWfKdtWYlfx0jYJf9fGXhRpXAxtrvXgJa7ESgE4Dqk1UM1KWykNFyfGWO3O8BhJ7gqGEeesPhOzTMiEyomI95C5oPeuZPLT7AtO6IeAba6TyjhlQqS/uHirWI63HXu/vEGI3hlpd7ClLzR4c+dawx8Lyd1jv+4jyTcoN3Q0/FaVlz/QSAxEbDJiF9byzoS1KKfQTHWPaZBt5DFu2g5hnOfbTD1LSI2Q+t8689a6bSSp9s3ekkmBg8xvieFkYZXN+A0rdp2supgqhk+sPjkIioyRauOWSwKGgJRQdLenL3P+MMGo6/WVhes+L2HRLC7PUcWbMUIagKBBQyJTxe8Inp4YLf+4Ei+XNHgnsMv2JFV8k3j2kj1Dj82vP4p/N0zDbRQY25zU/hRRP2DBMm/XEh84oY6Hmzvz5kKNTldFrpECY5sF5Z/kCJ2TdkBZrlGYieTWQA5NHgcYrJodhJWrXvvK9DBkwbaVNNKZKBfEYh2dsuHJuZqxukW3y1UrzfHo3XZk95Z3Ji9qIhL/4rGw3swPZ9ow4gFo1fvt1ZmVf3nXnTKVUXQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a10b885-6b8b-4dad-daca-08ddad0e1fab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:43:53.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH3hHU7sCMl6DOrKARFaDljGFduvmDTtt2xNAJc7Ct8orWJyPJd/RtipPXAw+lvht6MF7iytVhloYI4qLOakRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7713
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNSBTYWx0ZWRfX8AIgT/efDJb8 T/UYWIMTwhdnYVkhbUEUFgIqehkucT2cJVLp5A5h3LtA1BclW52rnZLozHwVWw/YIg3MeIlUVw0 TwLoKNwmBTnmhUUkFOnVlJuoFrlL1t0D2sq+Z9W5/twpSihmoPBvGp7eVF6ejuiCmkrXWftDHcm
 aiXf3jb1T4toGJ56MaT9/1P3NYVIncy1Ffn5kIngkmUbc28D12XEYI6cWY104mvFwWYL3CUmTTv ntYUZoAEHZkmnA1EOQUu9tLdandTF0351PnnTOuarpjVc0qd9hRLDJQbOrodDAC5lHVkHZ/pv3u wtHo8lkT4jwDN/T199OWLMvzatyqh6X+y3X6vvnSObuMDsAVh9qs2ICdDZQrMLxEd0lFpWAMJET
 3RBB1MP6gTzC9ePX6pC8j7W9BNbzaPCufaTr2mg42l+yMlJJ6/H+X4e4JzIaa3iVm9lZ2OX1
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=685073fc b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=KRCkBcikugj3vKI2eNsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: MVurI5z5i68aIRW4Zw0pAQFCIG_TpEWH
X-Proofpoint-ORIG-GUID: MVurI5z5i68aIRW4Zw0pAQFCIG_TpEWH

On 6/13/25 10:40, Nick Alcock wrote:

> On 22 May 2025, eugene loh uttered the following:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> We will introduce a set of tests for the caller and stackdepth
>> built-in variables for a wide selection of providers.
>>
>> For the caller test, we will essentially call
>>          stack(2);
>>          sym(caller);
>> and then compare the caller to the second stack frame using
>> the new script check_caller_to_stack2.awk.
>>
>> For the stackdepth test, we will essentially call
>>          printf("%d\n", stackdepth);
>>          stack();
>> and then compare the stackdepth to the reported frames using
>> the new script check_stackdepth_to_stack.awk.
>>
>> In this patch, introduce tests for the fbt provider, along with
>> the support scripts they need.  Subsequent patches will handle
>> other providers.
>>
>> The old tst.caller2.d and tst.stackdepth2.d, which tested fbt,
>> become obsolete.  Remove them.
> Nice! My only caveat (easily fixed) is that the old tests had header
> comments saying what they were testing, while the new ones don't.
> (Yes, the awk scripts do make it clearer, but still...)

Got it.  I'll add a brief comment.

>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>
