Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121917A583
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731602771; cv=fail; b=jCFqo/4pfwthNgKqRSIclYXHNaWodRlrW8Pjqsv5NOX4+EtI0StQ5+NkUZ75S9gjn3NdbXWZAXgNHFYwJWQF+j0CKFPsDkGjIUY2lnuD13bv1vlNhDZHGkKHPU0abZV1JHtPkndQOjyN5OZRUwAmvLrWXhbvXHUAK4SVNcd0eXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731602771; c=relaxed/simple;
	bh=VNcV2eLSoK8NGDefcZjfb5ZUojPiimkFRhyxuvTN2tA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pAyxH50stm79wdehgY3chxna3Hp+mFLszOADFXBEYXlR79uu9Kwo4DVG3D9ybrY6MXuaeKlOPEJ3ttUtf2I2kVWkmrDLk5o1VEGjRS+uEAlosrCqGwWGaQkL6z/uXRUkJ/TzATAVy3SoF8+Mcz0cEcPhCOpA/9LCZm9J7DWgbm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G99jK7wA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w6MkjXd+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G99jK7wA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w6MkjXd+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AED8Qxl025010
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=hBDzcgf94rpKUrrJuAxEQBRhU68sXxG7zRg6+QB2hZY=; b=
	G99jK7wA1qr35eAuwRMyyhxjAXAwAOpACafZhOHbH18JUOHLT6sgp3CUGrRDHlGN
	00RVQf8Xh/JRKlUejZ3dMAq9zaH7IQ3pf8meCahZyhocVEASrUxqqF0nH1+4JewD
	PiLnBM8OTNlHZLPkozJk+m0G0Z3nWSAkEhtrbt0n1WBiWTlfLzLqApX2xjoVQa9Z
	MvYx2Q8sI0jTzCEHOC3lbjQk3jM/2Hn9dby2yzGrKv10Pqzl/Q7vf6+mP93ZJ2nm
	7HMJuKtV/+AwQztls7LWwsTpi/21sYJf7Ad9mPlBGWhLepeMrEDIY7EL1wboZGRZ
	upAOdC4gbFpR5WCOWwHtzA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0hesjjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:46:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEFAR65035973
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:46:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6b2j0a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CemhryHndfQfmg+5EXfITQnMGhRa4ODnsyQKxgmbLGx6NfkisCVSJ9xxHVJudoQCwJe+FWu4jMUuVH783rVvKrnN6EaF6wyK7BnVFUNKxWYwYIr72qIASY5R4rshvQNXlvL7n9gcUpvp3AvmMCre+kt8VMU9uIf4avW9jUbtl5/XfTM5E4qS8as2dC2E/QzAC0/qhr85plExAXLeqtF1dGaWDorIvZFw+wJAHVKXNy74QhZi48+LbPEJMrY9H/PmsT/Rh/xJmdx644Ce2ZXhK1ZU7RAXgkVM1BjrR1U5DDjieWUeZaLRnXmAhM845tU8WEl/P/nXa1wlG/PfELu2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBDzcgf94rpKUrrJuAxEQBRhU68sXxG7zRg6+QB2hZY=;
 b=Zzldvu9BUDjgazB5b0rcPqnJEEn0/ZarGd+4sor2HIqlysXXeMcblIwnUq/iP07RX21fBkcGr2aCsU6C8GgGICMhyCDr6AN70ZCH49PK8+5raOUbFZpHIKC+bUhtQV8LyBHstVGvvMkgs3Lg0mIdUQNEbvlMr0vdCWGLUv2pQbNPbu9zv5ozPbSgb3EK4u6Fj3Rtce3gs9APuCLg25ganh/ObTEtsURv2vlyZpgGFFgtVJR8c1uKHoIDAfYM4t8DotaVioGVEMkU28CtYcaYmjf1ncIfR5MBSAPfNIjl2yBU1hjCKMEiNvKPEOHdCLi+KAmxKuNHLL04Sm7mkvh4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBDzcgf94rpKUrrJuAxEQBRhU68sXxG7zRg6+QB2hZY=;
 b=w6MkjXd+Z+iy0DKqUizB4mCzpbSjnb1tYlpb6K8saipFhXq2GiPrLegbWGEP803K0uLwVodhOFsvrD1yahHn+MdDGR0cAb+p5Ep8r9TjDPZfNalb6z5RZn2skdFEuEMaM16ZqDhHvroPkYtAUSWovnH0/Rytu3KzXHQYW4l+z2g=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by IA0PR10MB6866.namprd10.prod.outlook.com (2603:10b6:208:434::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 16:45:57 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%3]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 16:45:57 +0000
Message-ID: <e176658c-2e71-4faf-9229-e9d26305d3d7@oracle.com>
Date: Thu, 14 Nov 2024 16:45:53 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH v3 dtrace 1/4] dt_provider_tp: add optional
 event data, freed on tp free
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
 <20241016155409.4038017-2-alan.maguire@oracle.com>
 <ZzWKCN0qYvtBhx8D@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <ZzWKCN0qYvtBhx8D@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|IA0PR10MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bec0721-ecf3-4b67-58d2-08dd04cbd03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RllXS29EbUpTUEJmQlJvK2RlZWpQOHpyTW1vUFJyQUdESTNoM3lPNHJvbWEv?=
 =?utf-8?B?dmh1clVqckg1SWxNWmd4cW5hamQ0Wlo4eDdadnNmQklHMFN3R3M0eEtBdmc1?=
 =?utf-8?B?Wm0vU0xmK3ZzYkhla3YxZW0wM2x5NENndXVmcm8yV1QyYmxYRlAxKzVmUFh3?=
 =?utf-8?B?c3NrRUJ5NzJFUjlUaCsxaCtpaU1FTFhHOHNaWUgrb2d5R3grSGE4aGRCZ1o0?=
 =?utf-8?B?d0xyL2lnTDVtWk9CVEdpclpENWE2VVNhTHNRUHBIbG9TUE1kOXVQa0M0ck9v?=
 =?utf-8?B?U2N3d0Y3S1ZJSXNyMDZ2S2R1djY0UEZyWVJXYjZpb2llLzNVT2lhU2d0Z1hN?=
 =?utf-8?B?dEZRNFZXY0ROSC95SHZLRmRMaUQ3akFCVTRJVm5QUWgzcWVyckQzWWhxcVhH?=
 =?utf-8?B?dDJZOXZiemNvb1o2STU3dnRqRi8xN1dBVUEyWVNBWTN3Q3FKTURXbHA3Z2k5?=
 =?utf-8?B?U2dlWTI1L1YxUWtReWdCS0x6UFdXWUs1dXFZWlBLVmd2T2w1TmY1YmxqeG13?=
 =?utf-8?B?aG4wYW9Vb3NZRjVNTVowUGVVZDRIRW13QzJTajBFbHFwdDRpWmN6SjAreFRT?=
 =?utf-8?B?elVzRStWU3VYR2JnakRtY2ZIRjdKVVpaRFV5NDVpaDBCSitFLzh2TUdWekxR?=
 =?utf-8?B?VC8zUG9hM0pJUSt0SkZydExaV0RIQ0FYTGg0bmRzNjd6YlVmOFZmZXY5ZEJx?=
 =?utf-8?B?cVlNbURZYnFmVzZvalJRUmpWbmdsYVNhTjhIakpXdnpUMU5qWXNjRTJzMUEv?=
 =?utf-8?B?TW9OcUFVbEJFdHV3aEs0UGs5ZFJLbUtWZHV3Y1I0T1hpQnluSk93UE0rcEt4?=
 =?utf-8?B?Mzg1RWxVQTRlUlNFMm5CaFNrK3dOLzcrbGx0TnNTcVZobzUybTh0emxwSVpD?=
 =?utf-8?B?ekhNYlBkWlB5K3duNENIRzF5K3hnMitzMkwyUVRIWi9kdkxnSVJneVVXajN5?=
 =?utf-8?B?Z3dZY2tsSUd0OHBJNHBiTmpWYnJwNUtPS2doR1N1cDBVUDJaciswLzVXNWR0?=
 =?utf-8?B?dTJCVHM2SjFpdjI0S0VTL3Ezei90N3VFYm80ejY2VHFIU1ozRmhNb0krV1h1?=
 =?utf-8?B?cURseUhtM2FaR3FpTTRqMVNZTlJ2ZjR0MGxqNkp2MEV5azJlRGdON0VKNWhB?=
 =?utf-8?B?YkN0bTZzT2JyN0lBQ3RrTG14aGk4Y1RmbEVVUVRTNlZnN1dQWTRRWThtWUND?=
 =?utf-8?B?d0xyMmtZL0FBbElmeEVHSG1nblViQVp1eDVZM2pwVDdibGNYRDk2U0JZcFJp?=
 =?utf-8?B?ZUlrczZpTis0MFkrU2Y5Wk1CNC9pRnRNVlZ1MlhNaVE5V3hVT0ZIYldNbE1u?=
 =?utf-8?B?bXdxeTVGaUV5SEt3VzZKY2FTL0dRQnZSY1Z3ZXgycUN6RXZXdXJVeXJ4VzND?=
 =?utf-8?B?ZVR6bm5KNFBUb1pFcXlTeGRqd0w1WjhCalg5bWltdTl3NGovS3VLUy9Pcmh4?=
 =?utf-8?B?a3BIb3FBWlpsd0N6d2doMjJVM1F2MGp6ZTFrT2FXeXJyMVRlYzAzUGp0RkZr?=
 =?utf-8?B?M0FzUGZ1Mk4wc0xaRGlULzFuMDJ3UHlNWUFUckE5eVdGWVFUZHRHb2F1K3RK?=
 =?utf-8?B?WFZ0RzFvRzBpemN1MFFERlpuOHVxcUV3MDZXZ0I2REhWRERNZVJwRW5pUEhO?=
 =?utf-8?B?V3FEaEJjTTcrcWYyL3R3c2dZTkFKbmh5WFExNzB2VWl0OWpyN1lTTjFHZE50?=
 =?utf-8?B?VzIrdGs3VklKRUp2cjRqbmt1OHdBYWhMWVdHcEVHMTZ1TVFocURJaUdEV1FN?=
 =?utf-8?Q?yDxfuzxuY5HqVdvMNWj9DnlpsM63+mGR3O4620T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFFvVmppVjFuK2F5RDJYNUdmei9IcG5rR0hITGViUE5TRjAvRUR6SW5mTFJY?=
 =?utf-8?B?RjkzazBkUEllTVpKTFJiY1JQQllXUGpzT3ZJY1NwSWswOFRuVkZNejBTQ3dB?=
 =?utf-8?B?U2dOZjYyYmoxM2pRSm1KeHBQM1Jia0pOdWs1dll3VGFLV0ZGT2NCR0l3OGdj?=
 =?utf-8?B?MHpuTENxSm5RMHdHREJOcERMNmdZS0R3ejRFU3RWZHVkWmt6K25OSzE0M3M1?=
 =?utf-8?B?WXV4NWFBS3NydDl6b3hkYW41R2FpU0hFSWpVbk5uWVlVcllyUDBCakVaVDVO?=
 =?utf-8?B?WU5XRDR1L0d4M1FzcUxGbGhVRFJET25saWtLZTdUeVJkZTdPejdWbVhMNjZo?=
 =?utf-8?B?Z1gzQ0dYWUxMUStrKzREeWdiQmVOUHB5VS9tYVFqNHpnR290ZGJqb3NVSm1T?=
 =?utf-8?B?ZWZNYXcva002ZzdOOG9CQUtKUVZ5VUdXUzhoQnFKUXpzclVYUFNWbUY4WVNW?=
 =?utf-8?B?dmNQdWlqMU9panBOa1V0WFJ1b0s5ZytEcWF4VmVlSUt5aUJsb0oyN21tU1RF?=
 =?utf-8?B?TUNTUUw3WG1NQzlZZ1p4aGV2cmIxbTIvNzd3MnNobS9ielErUWNtS1FWNTZo?=
 =?utf-8?B?N2d2ZGxteXJXK282bEh4NXJyOTJVM3cxVTRMajdOeFhhd1dscm5Ic2IwRWY1?=
 =?utf-8?B?bmtRWHY2RzUvTHhrZmZ5Z0M1YmVEVEZPOEFTUjB2WFVPYWNBc0NsbXozK2J6?=
 =?utf-8?B?WXI1b1dCWEFEdUFIVWI0ZlZOR2M3NUJCMkN4NjZxY3l1TEkwU0xKWGNVNVkx?=
 =?utf-8?B?bDJUdVUvUmtaSm5GNDJCV3o4U3gyM1dmQnBlSVBXTUp0RENGZFRFZ0R4VlBD?=
 =?utf-8?B?WXBZUXZVSHQzMFdNdXhwQTV2T0tONFlIQ1ZQTTlOYjRkNUpoTmN0bWh4YWNU?=
 =?utf-8?B?ci9Nc1FiVUZSMUp4ZXhVZG5SRW9GK2dsb291dnZ4bDRlaXR5Uk9pc3lkbkpF?=
 =?utf-8?B?T01rZVA2WXk1YTExaFl2ZWJVaHdEODF0TE5SQXA4R3BRZUo5b3V5aGhYN2VB?=
 =?utf-8?B?VXAwSHZsd2dFUXd1cVZaa0NQRVhTaWlMY3h5UW0zYVBHb3REaUx2VVdKeWlv?=
 =?utf-8?B?MTNwUDBmUXludlFDWlh2bXRoVHJ1U0R6bVdZRkNwMFAxM3B3ZWZZRGl4NkRa?=
 =?utf-8?B?UENxMXNwOXBqYVlnZ2VNN3RTY2l3R2xVTW0wVytqVUhZNjhtanloSWgrdWNS?=
 =?utf-8?B?YjZKR3hQMUV2TDNXVC90U0FDbVpwMzg5eWNCeHZwdUsrSzNVd1doYWtiUWpW?=
 =?utf-8?B?NURPOTVkYkdFWm5wWnRYdVJEeWFDRkgwUkhLbFhscUpyWldCTHFtNWNYUjlG?=
 =?utf-8?B?eVAzTFgycTFkV0d5akhLcFVRaW84VURwN2ErdkZlckpwcVpCYWlueEhwRTRh?=
 =?utf-8?B?NmVPZ3UxcStQc1FjRldWRi9CSlZWNWIrRHkvdXlYQ05EVWpuUlFoc1JRVWxM?=
 =?utf-8?B?endBbmNqYjJ3MjZYVUpuUU4zVG5JVnFEeXRkTWpHYUtZT1VpekxBVkhEaVlt?=
 =?utf-8?B?ckU4U1VHdDNmTjNvdmF6QjFVNG1jMU5qSkh3RENleklabEUvVStlcXhmcmg2?=
 =?utf-8?B?akZBd2tLZWcxa05RcjJ1L0puTWZBTlZaZkJ2OWYxWHc0N0YyTFd6T2NLVFJD?=
 =?utf-8?B?T3F1Nlo1MG8rRFJNb3JONGVaQWhHNnZ1dU43Q2VKUnpjWjlaSUQrQnNDVHZu?=
 =?utf-8?B?alU4SGkyVU5DdlZ0S0FWZ25ST3FiVVhaV3Zud01PeVFuUEREWTJFT1FoZ2lX?=
 =?utf-8?B?dnhtdnVtYmxkQXJYZDJxN3gxTXBxNytlandnU2cwd2k3bnVtQzJrQ2ErU045?=
 =?utf-8?B?d0tlVFRJOHgrMEZSekRYelFEeVpMZ1BJTFRQdXkvcjlmRXBtTW5URTIyenNY?=
 =?utf-8?B?TzJOS3kwU3l5OTA3WUE3R1pIamk3TldpQ3U5emdTaUJiaWUzU0I2SlB5NlZE?=
 =?utf-8?B?QVNBMHFIUTFjQitUMmpsK3AvSzZHZVN3K1F5VFNEYjdYUG5BTlNWWmV5SFVl?=
 =?utf-8?B?aW5NWldPWWdaUzhlSXVmQnZxWk9ORnZUcDIyV0pJUWNSeHo1UzRQNlJydlhT?=
 =?utf-8?B?Nk1CZ29aVnpjYlFpTnh0S3RaN2ZCRkk5SkprMU4rVjluU1lVWHEvRTREYjJn?=
 =?utf-8?B?Z2ZjbXpiYmZRKzhneCs4M09YY3JvZlArMHhWVVhlbTAwb3B5dVhGN01aaVV1?=
 =?utf-8?Q?6PObWSDqWpvZIfrnAWEZDLs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3Iql9vJIuc38TGQWRBUQSvSm8jmUcBnCM6gpq8BYPeAGYGk3welh0gPV5L3Yaj6pmifhkqnFJYHf7vcDNF7gvl4Cqc1WMbOE+PgSNK+Coo1QbghTCiLVNhfcLZsy0aED1CybZweemd0/6eD8lgndjwL3TD3MyD1FzAQjvbpQEc2dYI3visd0JYFbRJl0dZ/GHZqSxTJn7RZJWSdHa0g2sFVYat5TCo98gg8jWJu5JfGM6gbFSxgao7Ke1+4cTygs/il4mAuRbB4xaNbdwyvy5wrAyXtW+dqx8cPnYU9mgnfgOt9B32ZD87cWAvN5HZKRm6PrRbkW0DLXKoEZDCegLOvXVTBYohYCieml6yNBVELC+M6MJotUyhcs9mBY6G1dt+Kng7sYFIyXpncTtO0hDFTM1/edhEOk13NbEXWxGkXXFteVcd/pAtVGcpwnnLvf2r5EsAvbtaeAWyWzQcZKugek9iJ86ODPdPCjWyE5hYqEz+QHMUDtA/l6plAIlSvw+NqjSwlwg6LjwvRPZ+orOem9ykdFdPKKjfgzrsS2eutltIljOza1eWef8MLXs9JyBWqPKh7dwUiueJ3Qs3kLpGekpwL0oCWD4oeqG49oWjI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bec0721-ecf3-4b67-58d2-08dd04cbd03d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:45:57.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mSD+cZT0ju9L24Bn7/uP+rkkFtEKPiUEi/3RilWUHuJ6tkgHsQEAKDsu9U8G1q1OGkHg6088i3kLFiR5RN0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6866
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140130
X-Proofpoint-ORIG-GUID: 937p2MsBfsv3iK0ecqxYGRyAE-1dwzF_
X-Proofpoint-GUID: 937p2MsBfsv3iK0ecqxYGRyAE-1dwzF_

On 14/11/2024 05:26, Kris Van Hees wrote:
> I don't think this is the right approach.  At least, with other code (uprobe
> provider) we went the route of having the provider declare its own custom
> struct to store provider-specific probe info along with a pointer to the
> tp_probe_t (tracepoint probe info).  I think we should do the same here.
> 
> I'm preparing a modified patch for this as part of a small series to fix a
> few design issues with function naming in dt_provider_tp, to show what I mean.
> 
> I'll continue reviewing the rest of this series based on that upcomming change.
> 
> E.g. here we can use:
> struct fbt_probe {
> 	char		*tp_name;
> 	tp_probe_t	*tp;
> } fbt_probe_t;
> 
> and an fbt_probe_t instance will be passed to dt_probe_insert( and thus will
> be available as prp->prv_data.  Whenevef this provider needs to do anything
> with an FBT probe's underlying tracepoint, it can be done by calling the
> appropriate dt_tp_* function and passing in ((fbt_probe_t *prp->prv_data)->tp.
> 
> Anyway, series coming (hopefully) tomorrow.
>

Sounds good, thanks!

Alan
