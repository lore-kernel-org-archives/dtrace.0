Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B5433A0
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 00:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722473449; cv=fail; b=EmKxd2u9AKEeXchaACAXhYrBNS0c6L3D1n1vJgTOWJT5JxZ7+aHrwNPcKFEeA+u09O7SNJTZHL6eh+o4Z618BmN7xwZh2q0J2cJAdcVP3atCxkPpm3W4VyO8Ug7q5cMvsQJ7EZA7nBNjibCbxok060TZkMqH4JC69+B3+4YEMiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722473449; c=relaxed/simple;
	bh=pOazEoFsxae03totDP0iDf/zRTF8R++87S47cmMGkzU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fuJTFkd5+MHcHWXTyNKvE8DDrEQfNc7hkb4KhZMXQhHhEThk3if4a8u+j1ssaQWL8P0khuVopR6NPBee8Ng8cX1eEk7KuAxKJTJxU+h8ZqP6mGoVwIj2ErPBq2BmSGHPho6Y/TYum3QeuCesotFWrK0gZyrsq0cnevPse9sPLKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UrBOJ+s5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KqSeFWcV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UrBOJ+s5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KqSeFWcV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VLHCCJ017706
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 00:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=B6naLlvh1IP5pMjQ94l68SRuYz/E63Lvx1g2bQTv/hM=; b=
	UrBOJ+s5lIrf44U0vgx1o/YUCXpXjMkqvs6PMY4ZRtz9f34CVsdT+FGi+f6ZKgaI
	qr3hA/n6KyW+FjvmoMjmXI6WRnmGhlqiWOkhJuShbU5yWtOhpyAlUnIFLKt0NvtZ
	cW9/kHP6W6y0SlYCZ28Vo+OaS6zGhdEPS0hwAlt7O09VRL6KoZSZwgp150IwZIWT
	LOYCc6eFCEVw1nedJNiPX7gVuASGGCPRSg/qkVVoe2Lm9r1gXaoPhhvvJ9XoR+d6
	IYrQCKco7S2WWGisHyrhg9MFEqmlZ86SjCosHNxJn4sOARloX/00K1sJy34Cw8bp
	A9XKCf1rSCYOpqxLTI40tw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40msesrm1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 00:50:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4710cuRX030877
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 00:50:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehv5q9q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 00:50:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OottFoFIxHqEfRy2gdZpQNe259085i+5XMh1YCVrV00RvdSJE7pdHAyCjeUJOHJRvHEKKvKwgCWir48EoxeGLeT9aur2Z3HboY/jivPrt9tWnJZHOlpYAJiLWUdf02pZ2Id7LVyIHDvprFa7JU35D682BQBO5EcEPtIPLhx3Hid6MTRpRM2ZfLnOQZX+l0NB1ITCx347QBbMhL8i7sFsillDYvVHR97j8ig9ByTcTfRwD3+U5F8y5hROq7lDlPItF/37DN4kSb/Te/EMfD8+Cf51HsA4syOM+dyKQPGEjibTsNwMlwU1sMDRgYlrA8VlZhr1clZe878ORu2tHjzfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6naLlvh1IP5pMjQ94l68SRuYz/E63Lvx1g2bQTv/hM=;
 b=n3POm9Si9pQP5xdLmDspn05/xsFc0pUsw6jiiep2yPxwSEwiMb9MGUlssTOFokxd/ty7RyVgObpTsRu6cR567buF5H+Jb4iDM5Wlg7OahS2mJGQ8TuZdFS3UfZRpCaFEF5BSzA/Hn3LBjYJZvik08kIYYQ+fPtmE2GudB/yr+AsZ/JTglsct618JCeaSIKR58O2EA9PmoLlJu7nx8fwbAAYhqO4zKKSvLCvTEoVOJ77/qen2sa7y37sSkmCV3triwI6dk+qIZvpd3tx2fiBeooJcS8m/15/ypgKHRnA/3lQJLlQkMrWBI56uxFEsKGBkXlpUpxJrnNUp8HgR8WxXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6naLlvh1IP5pMjQ94l68SRuYz/E63Lvx1g2bQTv/hM=;
 b=KqSeFWcVj+EmUBvGeDXzUxB6PHiEjdWfclODjonBgcgY0a0GV04UUqpm2Tgko8w1ox2DaG7LBpSQui3Z7jj6Qdj7deJRO2yLoFvP68NVUBMEcnNG4TTwanVvjNzpLL3Gm8CXAaJDfC4f5evb9DFld94u4fVMRag5SsR+gKLn/0M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5722.namprd10.prod.outlook.com (2603:10b6:510:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Thu, 1 Aug
 2024 00:50:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 00:50:40 +0000
Message-ID: <ceaa8353-48a3-5757-9604-8a66fda7ff46@oracle.com>
Date: Wed, 31 Jul 2024 20:50:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: skip tst.symbols.c if no /proc/kallmodsyms
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287B34CE377B4B80C34B2BEC2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
 <2612a5e1-eba9-d6dc-023e-3f505e797985@oracle.com>
 <ZqqWsKcXMZ77kwcY@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZqqWsKcXMZ77kwcY@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0072.namprd02.prod.outlook.com
 (2603:10b6:207:3d::49) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f924860-dccf-40e2-addd-08dcb1c3f731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWJCTU5FNEtiNmt6c0txOWRYamNza2lVblVocEVCS3NKMlZWdmVRdHdoZkE5?=
 =?utf-8?B?LzhRODZaZnlnaXkvYTIvM013bWkrTDUzK1EzYkZVS3N3NzRoQWJ2Mk5pQWJu?=
 =?utf-8?B?T2FHUVJiZWVlREpCSFZkeUs0aWlNb3dXZkgzZUxlcjNQeVR0QzZYbCtxdGoy?=
 =?utf-8?B?L2VOZzdIVjY4WU1tNWVidkMzUUcrSk5Lei82QUpFSmQ5N3FiNjZWTWZJVzl5?=
 =?utf-8?B?bUk5Q2Q0RjN2a1VKUUREQW9nYVhTWFUvd0poakYrcHJ1MVVkWHdzQThURWda?=
 =?utf-8?B?eHZkTC95SGJrYXVkbldlWDlqVXpJL2M5WXc1NVVSaGthaFRlZTdBcTJFZTFY?=
 =?utf-8?B?SHNBbmFiTXlBbFBGeHlzSDg3SGhBMFRMc1VWZFdvT1c5Ymc0R1RWMit6T29r?=
 =?utf-8?B?cnBMZGFZNEt5NHE2MG9ENXFiRGNJWkp4eW5JL1JycDJXVkxTdWxrc3FIU3JP?=
 =?utf-8?B?WXFRVXlIdXNBOC9EcG5sZXR2K1F2SWFpMS9jc2dsMEtaUlhFV2xBNkJsYlNW?=
 =?utf-8?B?dC9LSEsvR2dYZXZuNllTQjA3STAvbm1iNnh1YTAzMjgzZkgvOWlub2JMSlVS?=
 =?utf-8?B?d2s1TlRTN0hyUjB1SFgzRmNObGZndFd5QU1NN253RHZ4aVdDeEQ5bXFuVEVn?=
 =?utf-8?B?K3c4YTFaTStCNjh5OXhZMUZCSDZhTWM1cDJ1Z1Q0S1hsdnFKelJkTllDanNF?=
 =?utf-8?B?dGYvMThFU1A3L1FPaStqZ0NJajRuMmQ4eFFyakJEbWpVSXB2R3JSUjlFUjg5?=
 =?utf-8?B?QkxxOWxKOXovS3JLVjBDNnoxRmJWN241NXhuQTNkTll2SnF1SzhOK0lMSzI5?=
 =?utf-8?B?Q3RSbitmKzFVSW1IVFVEU0FxWWFlenl1NndwT3BQY0E5R016TCtDWVpBdHRi?=
 =?utf-8?B?V0ZqcnJGVjlOeGJKQ25iTGw0aTUxZy81TXdwUnI2anN3NWlrVDhvZkgvdjNt?=
 =?utf-8?B?Z1pkY3VaZWVoZnZsSHhPRHFJSm55NGFzSkZMQkhKNkZVR0tKUy85cmNETHR1?=
 =?utf-8?B?Mm9xQmVpUHRjemJYeC9JaVN3RXhXcHZlN3lDazZraWNHQTYrQm0rV0tBMHdC?=
 =?utf-8?B?MDFEbUR4T3lKT2Q1QW45T0tSL3NwRDRDWmtZS3hmK25Tb291bFlDRzRhdUF3?=
 =?utf-8?B?SEtIdm15V2VDaE9QaW9NbE1QVUJUOEJBanorRmFReHI5YlMwMVN3WDdlUVhq?=
 =?utf-8?B?azFZS0pDck4yUk9PQ0cwQUNZNi9jYmR3Z1hlRXo4VERadDNTT1k1K09wUFdo?=
 =?utf-8?B?bHBiRWRSYjJGdG1DVzRGVEtuRFZlQ1Y1YmhUSTdHb2lpYzBvYStRVTllRVQ3?=
 =?utf-8?B?S0ZOaUU4bXBWTnZMSGpMdDNycDdCdzc2QUZURnorRlFpN3k3QXMxWEpYUU9G?=
 =?utf-8?B?MENkamI0VXdqcEkrUGEycnp6b280TXdQdjkxUnp3MzBHSGxPYTBOYXB0VXpj?=
 =?utf-8?B?eVQvT2ZMdUcxTXV6SWFmSlJUTTlURVRrb3FYclFRQ0Q5eFpRTXZpd2srOE1k?=
 =?utf-8?B?NThuUThrN09CL3lWZXhYa1dzNEp4dEJPamx0U0dWQ1A0dnNFQ1UrN0JDRGR0?=
 =?utf-8?B?Ykc3emx1cXc0cXlWMVIyU29YSFFjam4ydzM0NVAvZjhvWEl4dkJKVEtBV0Vt?=
 =?utf-8?B?ZUsyYkNXYUdKU0pab25UTTQ0eDNpbnljQUE2bitRa2FYL2dKZjFCVUNlOXp0?=
 =?utf-8?B?eGlsdWMxVmwrc2NrWlhKK2MyQlVKTHdicnJBNWhCQmNMaTh0TDAyWTViMEFn?=
 =?utf-8?B?NmxDL1J3QUpwaUxWVmZ3YWlueDlDdWpVUzF6b3Zwc1ZrR08xZFJyck5NcHJo?=
 =?utf-8?Q?4cb3grNRqyWer2uAjSXeVRbF3V0AZ7NI+wneI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0ZZVm5ac1lZYmN0ZFhLZ2dmcVNUaVlTMjJxTzBocnFvSnVoMXpUMWp1T21M?=
 =?utf-8?B?OG9GYm1xRmdUNnNTckt2cXRoak54MlJGNmRxaElGWlE2R3B5RitGaVlYM3ZZ?=
 =?utf-8?B?d2RuNjJDQ1FuU1JraGVrb1lXQWhrUHRWRkY4eUJmT2ZueHdCcFp2VzZYYWQ5?=
 =?utf-8?B?cU5WRndGWHg1NWF3OVl1aFhNc2FvQUVaT3RFVWlERXhvSkpMUGp6SEZqMU9s?=
 =?utf-8?B?SC9NazkxeGhodnVYZUtUNDl4ejNYR1BIblh0bkF6MUc4OHo0cGk5NjlYWXZm?=
 =?utf-8?B?TDVpV0N5dVFETDBnVitzNG1idDl0Z0dlRjB1ekFUMmd4TnovQjVqYUF5TXRt?=
 =?utf-8?B?S3ZyMXRsbjVtVkZVbWsrVWVqLzdXZlNBWlYwMUhLK0d6Mklad2luUDBaSnJB?=
 =?utf-8?B?M1lJUU1DaURvbWdEc1pFdEk5SDcrRWhEaUNzWFJiNnFXUFVNYzJTYmUyUjJw?=
 =?utf-8?B?UEN5Vld2WlRPcUtPcVFVRzR0elVuZnFLY3VNMFFKQTFzQzd4YjRMbjVnaWJW?=
 =?utf-8?B?Tk93K0NzVFFxc1owUHNocWZKUmJLRXlmTGFSZmhvWDEvbFo2RlNpcm92OWFk?=
 =?utf-8?B?UTdYVEZaWW1mdm5jQlBKZkhlWDlocERJS0syb1l6b1BiaHZjOTBBWEhRUzJT?=
 =?utf-8?B?UXRMUlRrSGpYaElRenhFQktjaWc3K3ZTaFFQTUdPVlhsZ0E0V1BZV2VxcU9X?=
 =?utf-8?B?NDhqRFZYNEdYWVlDVW9ucVlVa0xXOThoZkVnNW81RlEwVVV2b1Z0VExVaTBP?=
 =?utf-8?B?R1AwS1pRMHE4bHBkc3J0TjZYMWt1S3ZHVjlDak56MGlsQ0wvTjZKWmVhVXpB?=
 =?utf-8?B?Vy9GWGF5V2RBWXZlQlg3SEJNeXJ3QlJ1WkpLRjB1UHJEc1BFNklCckZoZVpD?=
 =?utf-8?B?QnRsNXg2MGg1aDhLRXVDZ01oOUFYOEE5QkV4VmVjVnVLSFk2QzlRRkJFR2t0?=
 =?utf-8?B?b1REUEtsKzBZY2hNUGFob2MvTXpXcEV3WkUyZ01waCtYZUNDS2xUVEJNRURR?=
 =?utf-8?B?Vy9vbmovR040RGhiai92eU1JNDV0S0Vpb20rSWg4TVo3MkJnbTBlMlRUMUNT?=
 =?utf-8?B?TTJEUUdWV1NMVTNSbEZqTjEybnd1N1p1ODMyN1Rhc2ZNVUV5akltUHFxV1gv?=
 =?utf-8?B?VVk5VFpYcUhlNkJ5VDVmanIwYkQvSkxqVWNrMzVkVFZMZVdBY0liQjJVbE5Y?=
 =?utf-8?B?Z3F1T1N5d1ZLS0FnYUJDOFFpSXAxQ1dRRm1GUXlkTnE0YWYyYlo1Y0VydTlV?=
 =?utf-8?B?L21WeFBPU09HZ2FaSE03bVdzOURMTXZVQ1ZscXJJajlPeEdCR29MQUJQS3Iy?=
 =?utf-8?B?VU9iUzZxWWE3M3UrdlpjWjVIZEtWUkVaK3hhaldlMnJpT3Jlb2VLMWxlcnhr?=
 =?utf-8?B?dUV3ZTQyRTJhVTF2MGhMVzdRd253THdLTyszWCtYb2RqTTZBLzNaSjRNYXZu?=
 =?utf-8?B?M0I4dWJyVG5mT0FRM1BQdjZCeXI0VkhKc09CVlpsR1E5RENWai93MDFPclZq?=
 =?utf-8?B?cEs5UUFpTE1KSUJRakcwNVFnSlUrWldNRVhMVCtiTXlQSGtNOVhGL3JsRXUy?=
 =?utf-8?B?UWc1M09DUFlGdHVIelhBeWhrNFhYa1Z2RzFEZUR4TXc0OFQvdkI3N1BHbHpq?=
 =?utf-8?B?aXRsMEdmdElqRFBBQWt5RnF3cTlGekdiK29WbUNPSTdjNnlndzBLTnFlWFlR?=
 =?utf-8?B?ZTVCaXZkM1lMbTh6bmxpVDA1VFZ4bE1vUTR2OHNnMmJ5VkJGNnc4UDJoNWxV?=
 =?utf-8?B?dHByWE1TeFZ5NTNSRmw5YUl3Y0FldSs4SHJuWnljTVJaMDVEOExUdmlqRENY?=
 =?utf-8?B?TmtBTC82UWRUVnh3OXdpelMzVmJVaUhRQWU5REQyU082NU5MNW9jVjZRNXpj?=
 =?utf-8?B?Y0FyVVpzcU1UTnVFUkc2NlZJSHZWR2tFNnNVSjZMTDdtb0dqT3NOUUdvUS9Y?=
 =?utf-8?B?bU9JR0VJL1VWQ2N4end0NEN3YVllZHFsbDdINWkxeDlhNnBvNkxzZTUxelR3?=
 =?utf-8?B?ZlltWlRMWlVCa242ZTF6RjQzN3UwejlFZ2FxOEM3eGpqRVEwVDRpL0JMZHZF?=
 =?utf-8?B?MWZBRHRkSlp3YzY0Mm40M3VGbktBVGQrcWRrcG5JeUtSYjlnTmtaL1NGOVlV?=
 =?utf-8?Q?ivUEYNGulhjP3Pbxr0HWKTmh1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	enrbpQ1gh2RmczGsZCCKmQMeJytnhaH3qVEzDYXbykpJkAzombhisBJsyeLPGplG+0p7gm4SjEjMymo+BDe1TGI4Y8UKj9I28m3QvL413xdcTDPiGaiYQEXMPv4kfjeRwNTJp1pTUAlYwkOkVom6SyowT+N/29xXYAuYKtDBYn8DzOYNKp7cbfD9U2Ub5LS61zJHwJ6nuayirN6C+PtCz85WmfGiXcQpyPBhbx++ueBhNiJ9ZtVki6CopiQ3E2tuh0ncYRnF7SneT9u/kJheLMeC2H9LeAQT+dLXzixVCeERynqoa7ez0q6tJYBD02iDk8LrFesT89OIhCKAgcmdZX4tVXJbU4APVoBkJU1gVgu0RGp/tDCzSf219Ha4gmjdXFaRLCjPGBbROh2sh47hP/hlLLbdbJzAGjgkLhAlat52c6xD6H40isbn/aW1rAuTOm65Y53mgXN7Pez/kgDJfZ9x551jsucpvQaNywb7AoQi5rkEgCPzccAaKLlgtJBT7QJco+VOfASX/UHiDik04bFznllaATlG1h2K56oWsU98c+EiKW3z9Pgj+dQqaM2IVR1ejtomU+FoBAZbHchwTkiwVRB+bafgpHQtdGOQjoo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f924860-dccf-40e2-addd-08dcb1c3f731
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 00:50:40.5356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGoi0p1k5rPEXi7ZMwXgb+f0oJmfWP/WP+Tmeyzdo4IJZVdcqjy5DiBkWK3H1kD3I3Alh5aQbTNjgQK55oKc1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5722
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_11,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010002
X-Proofpoint-ORIG-GUID: tvW1psyLLV4g3DIzMNrqTuTJziXEq6TF
X-Proofpoint-GUID: tvW1psyLLV4g3DIzMNrqTuTJziXEq6TF

On 7/31/24 15:55, Kris Van Hees wrote:

> On Wed, Jul 31, 2024 at 03:36:49PM -0400, Eugene Loh wrote:
>> Should we be adding a version of the test that's appropriate for
>> /proc/kallsyms?
> I don't think that would make sense because this test seems to validate the
> kallmodsyms information against the information dtrace is able to determine.
> But with kallsyms and modules.builtin.ranges, we don't really have a good
> way to validate the module association because there is only one source for
> it.
>
> I guess we could implement a version of this test that merely checks that
> the symbol-address association is accurate but that is possibly not even
> really worth doing?  We obtain it using a straight read from the file and
> adding the name and address to a list.  Validation would merely mean that
> we validate that we read it correctly and stored it correctly.

Already the test checks admittedly little, but little tests do catch 
errors.  Anyhow,
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

>> On 7/31/24 15:02, Kris Van Hees wrote:
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    test/unittest/consumer/tst.symbols.x | 12 ++++++++++++
>>>    1 file changed, 12 insertions(+)
>>>    create mode 100755 test/unittest/consumer/tst.symbols.x
>>>
>>> diff --git a/test/unittest/consumer/tst.symbols.x b/test/unittest/consumer/tst.symbols.x
>>> new file mode 100755
>>> index 00000000..e83d97f6
>>> --- /dev/null
>>> +++ b/test/unittest/consumer/tst.symbols.x
>>> @@ -0,0 +1,12 @@
>>> +#!/bin/bash
>>> +#
>>> +# Oracle Linux DTrace.
>>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>>> +# http://oss.oracle.com/licenses/upl.
>>> +
>>> +# If /proc/kallmodsyms does not exist, there is nothing to test
>>> +
>>> +[[ -r /proc/kallmodsyms ]] || exit 2
>>> +
>>> +exit 0
