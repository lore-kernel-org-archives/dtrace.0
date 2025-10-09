Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1191670830
	for <dtrace@lists.linux.dev>; Thu,  9 Oct 2025 21:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760044298; cv=fail; b=XQAgaQ2OqBvNB4viWeZNFo8ujFT5ldHkUxIVM6dxQGHQpTp+yk/4CKSUCciMMZzCqcGL15Mh94+IkP236q0Gtc0UxYI9PmJow+kWTyGRAnynOpUonFMMKdcsr7meA4tgO0d87Pa7mpmKapDHI+RhQm1vkOpijcW/rpg9DjRcqZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760044298; c=relaxed/simple;
	bh=Gu8KiHWYxN9GUtzkiaRQTz4Qydt3iOa5Hd/xxKV62Dw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bd2n+IaH/k5aecdXQ4RNP3f3GU1VHN42mbt+dMNKPyamtU/ttBNit0limm33LHOxWnC+0hOe51d9sAyCJ1PkIE1r7iYoa08gmj54I66HLSziCD7MPITrs8c+cBv7jMZL/Ly5o5t1I131Ycp7F46aHDAwuI62CyJQVO7hiFoTfIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pcO2aK70; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YtmTWyfd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pcO2aK70";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YtmTWyfd"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Kg7Ww005932
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PqPvth4Ntb0Jemesklf7EWG84TSlsaDMqaXJDOvOJXk=; b=
	pcO2aK705G4qnsMUC/i8C6LFvTFCfr8dAmZgpIW33CjN/sk6YmXukzqYiy/eYD8a
	k6fW91AdWnd6WMab/Rw+kGfdMyATJqkUriQl+U9iHyPN6UsRqHId00rfVRkL8zZV
	KDqUn33HcmsfyCDWlmjxmtKAE6aB41QVUeSmzyrO1QwVGo5zQt5tXHDVjcG7Isq9
	2Uiyu3CYc9HPkWgM9CMgwWexji0YPTBHxNe4lLhLs6kKVW4wC9/RLsxQGe8f/NNU
	M21leZBhw7UFt3P3/ImjspppVh1kZu71BE85yBzS3msxdjil21Dk6MLWmeu6KSvF
	IvKvkpZKwn/3iyS0NihTOg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6cajm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:11:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 599JoGJs010425
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:11:35 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv67etk9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:11:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yj0brHIKB9nddo07JVp/6yJ2bm9eYPd/Q/BmS2vXB391w/S8LNXnXkW8VQ5LSFe4XxcJ2oXcCPLPrDNeMVT1F8y9Cel/PphuGHiKhAR7uZwaDmNggaPKKVuLuPVR5mCJC6XiXHlCsqxtcsmtJNgxHPmfNiBRT1Ix78iFuVKHQAOVepzu7UhRwnRsDwEsTC8hdpNpGZ5CEywHz7ZmxOdxr7B3yf7uYxwDwYih8ReS1bmU6rfUk/XQNET+UjX+SOfN6zDLK5RcfBGpVFkl4xDDfiUMNMqSEJNMTnDNv4+FynmljyTHwN45NK6E1PkHtO9rPdr0f8RHBxdaRyWkPjhLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqPvth4Ntb0Jemesklf7EWG84TSlsaDMqaXJDOvOJXk=;
 b=hU0ofa7HRPoWuXzFw8vipG1v2Bk76m4512LhMAhzsQtWd546m0KFUPw+zVzaMtX2d1qMu4rqeay9exd6l/JjHDwm3LMgRxg81n59eJG0BLZWpAD2OntuZqDb8/WojCc/dr29LNMMLv3ikhahs+XHf5476YvOkGtpdzH8aT9QY0bKIgKespg97sGLjTuzTsVcAz5bBazIHhdIEjDClIkxPyyK7ysSGMzCd81xoehC9SRS9ISXoH9BhnyHyJfZ2H84Caoo1m44V3PFc6kPwvBykB1WRCAUb1RUHlD7Vmbv5On2x37onO5UkOGXVJn1XHhMfxJvP71WjW9mNdq1LkCRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqPvth4Ntb0Jemesklf7EWG84TSlsaDMqaXJDOvOJXk=;
 b=YtmTWyfd9910784MXZPswI+92gV/FDjW6vqi4AV+vdaG2r3x12xNfTiyCkgv+VRPCZhrfOiZfEP5kiHv8U17b3oWsKSag6CGBIizbKeA89sOrolLwEcLaCN/typ5sDAbqtSv5gv7KilQ1yFW37dtgL0WuCRgw/sBNsJXwvE7i2E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA4PR10MB8634.namprd10.prod.outlook.com (2603:10b6:208:56a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Thu, 9 Oct
 2025 21:11:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 21:11:30 +0000
Message-ID: <45d166d3-7a33-ca9b-3da6-8eb66048835a@oracle.com>
Date: Thu, 9 Oct 2025 17:11:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/5] test: Fix some ustackdepth tests
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251001062418.6902-1-eugene.loh@oracle.com>
 <20251001062418.6902-3-eugene.loh@oracle.com> <aN9L5MPaovKcMo7+@oracle.com>
 <aOfjAfXbxsUP7aeM@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aOfjAfXbxsUP7aeM@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA4PR10MB8634:EE_
X-MS-Office365-Filtering-Correlation-Id: 356a3b8f-b08a-4bc4-f3d1-08de07786aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFRPNDdaVUsyNnBMV0dyckt1WDV1eXEzbFh0bVB5U2NGemZaS2xJdEtYOUxa?=
 =?utf-8?B?WTFEMWkrbm0zRGUxV2dPRmFHUzNqSHN2My9IWHhpZkRmUHNlWm14dTRjZGlD?=
 =?utf-8?B?clFWMTZPeitxL2k2akZtNDZTWVF1dTVuTWMyWVdrbVpZMWczY0ZaZUlQV3hD?=
 =?utf-8?B?eTAyMTNabTVmelNQZU0xeVEwNEx0UWM4UHhRYmRMSVFQRFRQMytCaW9UY2FY?=
 =?utf-8?B?R0wzOTR1NDFOdStyVVlKYUY2V1FrODBRdTZ0NU5UNm4vaS83TDFJT2o0Njc5?=
 =?utf-8?B?bUtReUlnSjlGVmozWWgyNU93UlRFV283VjIxWUhZRnpOZlFicExqMkZITDBj?=
 =?utf-8?B?Sjc5TlBqajN0YWlWVUowaGNqaUEzSlJienp2WGp6Q0dDNFVPQ2hIbkFKTEEx?=
 =?utf-8?B?R3IwRlZjUEJjdC95MEVTSzhuYjFjbjRIY3RINkp5bXZRRGZzTzRnODFXWVZF?=
 =?utf-8?B?czRtbWlpRC9PMVV3QXdHYnM5SSs2SzY5U3NXcktFMStOdVJXTW1SZDVGSHNm?=
 =?utf-8?B?SEVvMzdmSHVES01IMnNvWGlJclhPblRrdWdYeVZhUUoyeTgxNy9WMGQwVEMr?=
 =?utf-8?B?bXRjMkNVTko3K1JZTE9weXdxejFrVFByQlQ5dFYvMWR1Q0tNd2VZdFBQdTda?=
 =?utf-8?B?emxNajI4Y3NDU2MzVDZMWE5yYW1CVVN0TUlyRFQwREZudndLQ0RmK2M2b1FH?=
 =?utf-8?B?VStGclhIMTh4RVZZbDM2U2lrVGRDL2FnWmM1TnQ4blJjeEJCdlJwL1BsV2Vx?=
 =?utf-8?B?eVMrdUcyQlVLdWJEYWY4bDdIVkhaSzVaS2dVYU02Si9nTUpkZ2FvbEh0WlBN?=
 =?utf-8?B?Q0FKcVJWMlZUNFhlOVk5eFlKUnRwakd5KzFuTUFmeDZMcFRsZlpYRlBxdHUv?=
 =?utf-8?B?Z0xhOEtBU20wWmJqNlV1eHFrQXlkcDVpVXNacEtWdTZhYWxXM2JaMWNSUDZ5?=
 =?utf-8?B?T1JqQ2VBNklHQnI4QmNpV09qZXJDRnNVMHVpTEplSnpRZjVOZ0xlWjgrUmJS?=
 =?utf-8?B?NjJuZldLaHpwRENVOUE5ankxMHpMdi9xeGVUS2taUUE3amN0aGpwNWR0OHc1?=
 =?utf-8?B?eTV2bnJVczR4YWd1NC8yamFSMW1xVGMrcXROeUlvTkYwU3AvM1d4VlRiSXBy?=
 =?utf-8?B?Z2RnbVVFSGpxVlpkMkk3SWpQV3A1UHcwWlllT2hSZWNyUUx6eGVGVzVKYkNR?=
 =?utf-8?B?Q3E2dkp3QTcrUUtiZlBEYnFwci9RRytlR24yNlVDak1oZUc3WFJBMytVQ1lD?=
 =?utf-8?B?SXFqSHZrUHZGTDFOMHpxeVpKVXNtUkZ1aEJxVXcyRUNsMnJRZy9XSEx6RS9W?=
 =?utf-8?B?ZmxpR2dxSzZkeFpUTkk1MGp1ZFhqWkJLS1NGek0vZTZ0UGtsbTBOZjZ4S2tz?=
 =?utf-8?B?am5aRm8xdGMrSnluOUFJcVYzeHJPL0ZpeW9nMGoxQXF0OHkyV0s1RHN2bndh?=
 =?utf-8?B?LzlEYVZ1VkV4TkorZkFpRmdia0FCUTVDOE5JNEV4ekdGdlkwc28vV0NPK1J2?=
 =?utf-8?B?UzYwWEVOQ3BzTStyc3ZNUkRaZTFqVUVoYkJHWTlsQ0xDRVZHVFd2SHFVRTls?=
 =?utf-8?B?UFA2MHlNRGF4SEIzMmVvWW5jaHJoYllRdFZsMjRPWW1VNlM3NnA4cFdsbHRS?=
 =?utf-8?B?WC9RTEdsMFNLeUdFNU9vcVlKck1Cbnhlakdwb0lvbWV0ZThFcEgrV3pnaFZQ?=
 =?utf-8?B?MURjNWZTZkc5OXF5N2JFUGRib2l2VjRiWnRvYkFHM0xER0NWRnhNOXpUNnV5?=
 =?utf-8?B?OGM2eE9zUStwRmdpSUlCbHdzbWtNM2g1aUw3dmRMYUtFSmd4VmZGejhhdzVr?=
 =?utf-8?B?eFFkUVo1VUZuRllkU2EvR21GUnkzOGFTMVhnYlpPaDdmOW1MZHU2c0dpYXNz?=
 =?utf-8?B?UGFvbUNFVmtlZS81MTk2UUtiOXN3TkFRSVJ1aGtNWUk4UXlYLzM2Qk9XRGpH?=
 =?utf-8?Q?tBtScWJpQbtvLhnXv++Xfev314oEhbzq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEhQZ1R1Z29GWXgvTTBhWUR6cE4xWTIvSEtqWXBZRXpHLzdTRng3d2hWSUg1?=
 =?utf-8?B?a3lqZ0V2N2FDUmZ6WkQ4TThrNjhiNlhxMU5uZG1tQW12VHdzNkR6UTNSaTcz?=
 =?utf-8?B?NGNXcTAzTFVETVNZbVduN2V4dXVRNUN2eWZQWThHK0RNa05KSnVkVEJpT2lk?=
 =?utf-8?B?MmZZMksrek45bXYrMnV1MTUyR0NhUWFlT0ljMDFvMkFibGhSMFo4VlgraUQr?=
 =?utf-8?B?WTVJZGlzZlpQU09ZNXp4VlU0bTlESER4M3NGRVJMYzBvVkVBVGQ1TnNaNmU5?=
 =?utf-8?B?LzRwNmRvditzczJCeXBOY3NjWllha043SUJRS05QaWxYUW9sRDU5UjdmNVdC?=
 =?utf-8?B?NmVFdVBhYmszUmx0MCtpM3pWOE5HajZtVkJwUlVsRlFZa21FdmIyZnVtSjNY?=
 =?utf-8?B?WlZDUFVuVisyQTd2cTU0OTRBSGk4cXlaVklmWVBiRnVFZG82ZkNIL2hIMmE5?=
 =?utf-8?B?eUZMK2Nhenl4bDY4YThHMkgva1l4WEhNdnlxM1BXeFJtVVI4MjI0aU1CMXY2?=
 =?utf-8?B?TWtmb2lvU1lucGVSRnNMUzhJNXJZU3VKVEd2VDdmQjFmamhkdVVRaWZqTTNP?=
 =?utf-8?B?KzZvNGlUR1VNK3hoLzArOVNrQ3B3NCthOTVZdVU4MzI5dVlxbFhNOTZHR2d0?=
 =?utf-8?B?Rm1LMXRpM3JjbTJ6NEtRVEVVZDViWnA1VGFOL3RreE9JVlZyUVU2SXdlQlVq?=
 =?utf-8?B?a0RHMTd2WC9RbEJKSUJaZ1BhSXhUSmYzOE85eHJnMmpvRWNPS0hOc0NSSXNs?=
 =?utf-8?B?UE9ZK2JNYWN1eTRtclpicHlDNGdUUGkyb2RHUWdHQUtOQml0UGt3YWpLMi9v?=
 =?utf-8?B?L1dLNWl5WjVUUTh5QnY0cUVHNzlCdGdSTy96WmF5Smpxa1RiNjBOTlJaQTJG?=
 =?utf-8?B?VkthMjdFdzFyeWRXcHhoTXN5ZGhmZldwZjk3SFBlNDFTdjNrc3dtSWt2ZUQ3?=
 =?utf-8?B?S1RjY1ZuTzlKcVB1MFFxS2FidVFMbFRsQUF2dHdWSFpWREVZL0dJQ3hISkcr?=
 =?utf-8?B?TW9HQWtiVTVRaGpjS2lmZXJxZFpDT0hRN2p6dG1ueEczVllTQ1dIa2FYVE9G?=
 =?utf-8?B?akpEbFRFTHJrUWlab2tFMFdDMWFKME5EUUh0Y2JRaENScERPU3QxUW8xU3RG?=
 =?utf-8?B?NHRWMTlHcHdENTNvRDZqS09XY2puWi8zbUlKZlltdnJuYjdHL0lmSlZiRks5?=
 =?utf-8?B?cCtuOENqY2Jma21FOGc2RVFia0kvZGlFZUxLWUtGVmpMSDR1d2Y5dG5MSHlh?=
 =?utf-8?B?MnZjcEhJOGQwVlpUaGZJQjRMTkEyNUlldjhKdkU0bFhuRklIY0c1MktYazF5?=
 =?utf-8?B?MW9hTW10Kzh5enh0d2xXb2FLcDQ5dVZESDFNRElGc0VnUk5kNW93OFcvdDNS?=
 =?utf-8?B?djhVVTFQdnBWS3VRKzBtN2RqZXNmc3J2R1JzRHNFM21GZExVVzJOWnFaZUl4?=
 =?utf-8?B?WEtQZmZrSXVLL0IzTUdoS0krOXU4V0hmMGVtN3hPT0swcWdrWktBeHFqcnRG?=
 =?utf-8?B?UjU3OUdiZEd6NjkxUEs4eWZEZDI5bGp5N2l6MTU5QTlBZGFHeUR2b1B2NE5C?=
 =?utf-8?B?SVFUdkZFTDZERENHa3JmanpjemEyZVYyU0l1R0xyZUtCS3BjUHhaNzZncFRR?=
 =?utf-8?B?REttVVdEeGtYVkNoQUI2RkRIbWVueUVqU3hPZFJPNzRBZG15UDNWWlU5QnM0?=
 =?utf-8?B?YjVaSVFoRXQ2SmppYVZGRThQVDVZUWZGWVRYSWdrY3E2TnpyY0gwUEtJNEpo?=
 =?utf-8?B?QzZOWEdMUklLMXBDTmM3cnRHTnZjckg5MW8wOWJOMGtKVUQ0NTVOVGQwSjYz?=
 =?utf-8?B?TUY4ajl5VEU0ZDg0UDZ4WE8xVWNtbS9Ga0lCUGthWmR6MmxVRUhQL21mWlZJ?=
 =?utf-8?B?VVUrdzJjL3JNT3FMUkh6eVo4dkMvQjQ5VkJqQzJ4OTVxQmRWekVJVU5xU25E?=
 =?utf-8?B?ckdzT2VuVEd3dkIwK3luMGJTTDYzTStQNm5zR2wwd1hDVXRYWGtkUGEzSUwx?=
 =?utf-8?B?SUJWYUtMcmpuRnFHcXdrY2pkTzNTeUgvNWJMTTFabGZjWHQ2NUNadHk0SEJ2?=
 =?utf-8?B?YXRkeXR3RjYvMHpLdVNzampDbkV0N2tmaytFdXArclRTdm1RczBuNkY0cVpO?=
 =?utf-8?Q?liHGZJ9RmPaL6VGSMab1Cp8mW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8U+71qcNnM2OjnMnvY2skzZVKi/XObTeGVlDqwlkdMFYdZQQF71ooEcewG6CG1xIyMWETy2dMvvQDnIWGBcIXyVtSOwZjX3CAjoq19o8j2SCirmy6sTZBtELb1X0NLLpn3/BTPnky1bq2fMI+sXHjXQHv6mmtiZhZ6d25TJPW8cw5oROVvu3y29U4oxH049neXrEMlK4hL1H7hbOsUY10f6FcfJgXdAi4j4iZsvNaMiuFtcgPaq8kDFGtXxbMbhDl1zZDob3L9qYFc3RuzFUH4K8gA4NYJllQzCNxDGylqOOh6gFpiyEnYl3ghn1aFv8JjKAGLErsFu2twoDhDmT9lESBmE1yrxdIWrmRU4+01njLgq6qwgSgzrrAHc+vYSXNBKmFvbcTM2s7da1dEK+O8tiHT1V0pGWRleQDatohgBvz5gJ5ucCICF0V8ngtOLGexnqlt4kEsdCEhcKRKik6lfKfJRsa1EW2Ye2tRrNygxWq0Ty5WWLEKricFYfmN6G9FE/3gqJMPIdrFvfhNWpA6XtgR+AQzrmgguUjoSWRTjBbPNfX3GCqNM8eqPXcBZOVQ3lH3v4NFK+Np76GlXW8WrVN8fZMHQK/D6P2P7E2aE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356a3b8f-b08a-4bc4-f3d1-08de07786aca
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 21:11:30.4932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTLN7pnAKlfozy/lVBO4WNKYClx6y0RlSFgZWs3rCY0PS5MZhZkwEe2B56PLSjMVn6HIU4EHR7VMVVjNH3wXTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8634
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510090130
X-Proofpoint-GUID: XGhuIzwctGcbYIlmNHjV1jgmImA2rIK8
X-Proofpoint-ORIG-GUID: XGhuIzwctGcbYIlmNHjV1jgmImA2rIK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6hpHtSp6vwjB
 HXX96JbSR9MLi6RebvTnPY4yjbg49X8yjwaCoVC9Ll4SAJmwjASF3+hLNhmd0viykjCEGJhbiVk
 qXbgbdkK1a4k8kHvddUCg0FbUGJP2Q/ZxQdu19aS+x/fOjUu5ngsVnQokGv5Mz9PQqFHJKvl3C/
 eMjYI87MtIgoNBzK1/5faVauo7hnKlfGS5aFf1veR8tgid4FcHcKk5BK2JuJnpIcg6zmxhmyhe1
 Th8aj6fHwVRXSikBT7nAQBChNj1YYPfz0TEF2GydzGKXYmtvjdWy8FdBz6ql+07c+f819ENChVD
 6KHtJ+TYD2qIekw89MSm1up1RY2Yf2G0FBlMLFG5vX6mqmvKqAjIGL0TcpbOQoaepqeBA3adsww
 e1pyNhiVQ03vNPY/WFu7y9Z5vmwp6g==
X-Authority-Analysis: v=2.4 cv=FYA6BZ+6 c=1 sm=1 tr=0 ts=68e82508 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=varfc8s0h7zvhYTWU6sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

Hmm, yeah.  Okay, change posted as a new patch to apply on top of the 
older one.

On 10/9/25 12:29, Kris Van Hees wrote:
> This test seems to not work right if the system limit is already 200, 
> which
> it can be.  Perhaps it should first lower it to e.g. 20, then raise it to 200,
> and no matter what, restore the original value?
