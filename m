Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D239A1DF273
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766089375; cv=fail; b=pPR01ruHm4eeX65/xBM/Ja6t8se8vpQ3vDDnJHRl0YqTwmaezZClGcjK5Dg76v/dQj6WNKEKI3NrZCP9klLFSy7itAEkoe5N34rqhP6waI8rOxKV8VJYJPLKeZRLNqbiRPQAJm7oQl8tff/vCgIANiWoRIUu7v133+Z4FPcZ+sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766089375; c=relaxed/simple;
	bh=Zs4N4xBHplhDHDJ+aoR3NmO9CMbtsaBeFlRLaT1sVGM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HAbsHnA8ZXGf4XpqxT6usGPoRuaQdW4WbOteja41OM1Avwi3yNfu1Oq3EQyALV0B3pzHUn8oa8w65hT+KHOgbVTXog6Sre8UICh6jGfB/eE+qih9qjUJ+60dDOa3D62GtNzppVTYwGoQAmq9MMyFAn7ksABLZQ2hfafwBta9vH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cqkapT3/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MzAQbD9d; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cqkapT3/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MzAQbD9d"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJjwqS2384593
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vKqnNewcdiwTSK4i3OfITFpAKNca92KE/z6R8RC38vU=; b=
	cqkapT3/twJiC2j4vy3Qi2vDeP2Z1INUwRNr7rLN9dj1cLDOGCjN667KAqwieZPi
	2LDoBqrhc02rNy7rtQcZxpkMofFzzAZcU1zsGDDwSbyUTprPo17KDP/ngwlhAs1j
	ZxnzFgw1p5a2f0UZvGnyXyu2PUY0Ze1ZFjmuMEwAUmM02+XihPk0jU5YjQCXHdv4
	BGD+9mT38XwDmDE1eRUZmBICNHhJgBKh5f9P5kjYpSH+2p/2U9kJWJfZDdK/IHSj
	CxxvoCtgeKHzgVjhz1I0/DE1X5fmMbvqUXUmp9lk2Qei89v6GF2vDqB1dHCbUCzo
	1ctosbQ0g8mKmKtHd5FV1w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2981x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:22:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJSgpm023460
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:22:51 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qta20nt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpLcULLG5VCUFYHq30vVsqehTRc23Ho+XBsqbyKTIcD5Kz6iXy4t6Cx7ufnkKpqrD58qQqBjmlZmsPcLZEm2FxlTICRBxwUFYiKoe42eLZYKzDPEW/khrJbKC494Rs4WWJ9c//FdiNkAJYf30KijPwOkrcLxsQ5ikJCEx/uSmpv9YGngdva3fXbozctw+H2MWyO1gWp3TpeVkCRYsb2ktrJVhT3C5vdXL3eylgBiiSnIC+tLiViaMy/gxCE/AOYcemoyTMcdvmoNKarJyMDZ9pxde8ooc76hAXLUWa1RgUXOQIDx7JXi0f38veMYi97qP/jymqndNXwaGaLyTZw7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKqnNewcdiwTSK4i3OfITFpAKNca92KE/z6R8RC38vU=;
 b=q6yHm268V19AKXY4nsihf3Uj0qSH7bZklUzs7x/hWPY86wR9lTeooj05WIiv8TxcZsBi6KIdcbkHXSLxTx+9+e0wWOpp7eUf/h6GXMLq54lhCwgRN/+Qsn5dGDAoEBhLPXZYhvvQC/Xj/aXEHipoc1AmtQnHvgXHdHWRlQvi1T1DFge1m5X177ne73XIdhBAGIPMp3OUFiBCdTiFN/qX3V94fuf3CiA0amVVqWU9RoqOgxjJmTcMq2gMoXsn4dMdNnUNdaEBAisI/r9MG4UgHnmxsX0gDPkuVXZG/iGshXvqS5eeoG01U9O3iXFXeZ0HTQDpkdNB7HFMohVZasmioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKqnNewcdiwTSK4i3OfITFpAKNca92KE/z6R8RC38vU=;
 b=MzAQbD9dFRwgVSn/CFjDPTcyeB2OD1l8vE95mKrsET0/6azzSUXeA+S/5K5v8xDmXinJDXZFGyX0xmm9p93sOWbeFqrvi6AYWRuxsdalCd6yUQ0x47TItvbfSaBu65Jc/yqnmaOFpJGP3rG0xjDuGuNRJq3kGiX0prCjJxnLZwI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB7053.namprd10.prod.outlook.com (2603:10b6:510:270::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:22:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:22:49 +0000
Message-ID: <ff96c7e8-da13-0b5d-5a80-7bd5ac690248@oracle.com>
Date: Thu, 18 Dec 2025 15:22:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] options: discontinue -xversion=V as a valid option
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752231FDE310C37F66EEEB83C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752231FDE310C37F66EEEB83C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1e9521-5d9b-4b05-049b-08de3e73369a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzFDOWE0Vjh3Ky9qMktqWDVSS2NiRmJQbVY2bDBDMHNHYkMwUTlNY0l3blNH?=
 =?utf-8?B?eXh4dVVLbDRGdzNUd0toSFZ0cnN4MkhzbktZUlBPNVhwR0pLMWwyR0kzNTRH?=
 =?utf-8?B?c1JtMGpvaFZNTkdLS2tFZ293YmMxTHlvVm82dUYzVllRRW5YRnR3SmE2NS9S?=
 =?utf-8?B?MlF6ZFNqZkU0VjE2SnFXRnl5SWdBdis3ZXl1U3BkWlJaTk1Ldit1VS93a00x?=
 =?utf-8?B?WmJmdml2MkZHQktNME9lcVBJMXBoRUF1YjhQVFlDSDBpQW9zQUpEVi9ScGF3?=
 =?utf-8?B?L0QrakkxWnBiQUNlcWwvejBKNjA1UlFoZXZpN012OXB4MERPTEQ5SnRWNFdS?=
 =?utf-8?B?eVlTM3BnMUxqbFdwY1hpbTlsZ3dDRnNBOEZyLzVVSUI0NXdpWGl6MDdkS2pI?=
 =?utf-8?B?ZFNBaE0wU2JtRE8rdllQWkxTOTZFV002Wk1rL3RWZWpva0VDdjIwYW91MXM2?=
 =?utf-8?B?K3BOcGdLYWIzL3hqV3N0TFk3VnQ3WGowdm1BZlFVNUZPWjBaUUQ1MUxwSkI2?=
 =?utf-8?B?TTlMSk0zRUNJOFRJODVicUV6cE9POHJJMGlDWi9yYlpMNEFKWDVwMXpOUnZC?=
 =?utf-8?B?OHkvc281TlExek8xSWhod1ZNS1Y5S3B0TFFDZXY3ZWFRaFpzTW4wdE1WNUFo?=
 =?utf-8?B?Ly9PVEtERVpSdTBpdmFMaXNtdnhyLzhJcldob0lPSFV3dCtnN3BkNTV5UGsr?=
 =?utf-8?B?eXlmdVkzUkVDSlA4QXhmWXdLY1hyc3VTdTdsUU5yalBmMUdHcHV3M2dKTFIx?=
 =?utf-8?B?a0RpUDRWVUc1S3hDMkZPcTlvZUVXTmU3R2YzeXZQRjlUc1EwOXFseHpnV1Jx?=
 =?utf-8?B?NnFMSUdCNHdJZU9tNml0R0R5NFNHUkIrQ2prODN3Y0FuYXd4Y3p1NGRKUFdF?=
 =?utf-8?B?aUU1ZXNQa3lOS2x5ZWw5aWpWenlPUU9xQVl3ZkhXb2k4VzZ6elpQb2llM09R?=
 =?utf-8?B?R3FpQTVZeTVuRGRtVDFpZERZdDl2aGUxVnQraElQSnB4TlphUFRZZURFeHZP?=
 =?utf-8?B?RUtoTVd5SWE4YkVubk5hMlRWbmxDcnU5K0JyVzcycnZpenZ6UklIY2JnR0Vz?=
 =?utf-8?B?anNjME12dG45UUU2UU04bVZtTk1ZR09jNXIyUEdXUFFoazZtRTFRZlFXeERE?=
 =?utf-8?B?TnlLcTNSWWNtNGtSK2xnSFQzU0hUNGpkU0hhdUtQcVZUOC9CTmRzQVhDVlgy?=
 =?utf-8?B?RGQrbVhiVGFUSzh1TmZPZ1VjV3JUOGl0eDNaczdRSjZQa0R6S1pxaXBpbENR?=
 =?utf-8?B?bmFmUWFNb1ZGZlBNQ25iMWkxdmR2QnQrUW1TeUJqZzdkaXZCZ1JJcG5DQloz?=
 =?utf-8?B?VnBNbzBMNUtkdzlwY3RzY1VqeVk0dXJQSmJYbTdVQ3JvVW92eitDcDNlRlFI?=
 =?utf-8?B?dUtlMzgvR0l5Q2M3aUR0Tk1VRFJDNDhsTXB5SHZMSk9VbVlkdWI5SGVteDR0?=
 =?utf-8?B?Q1duVDRzejU5Q0U5bUlSOXQ2aldESlAzR2FRUWJpMlVPbWMxT1h5MFlTTVJu?=
 =?utf-8?B?MDdZd0xmQWhIYU5lK3JWOUg4SUtHWHplYk5hS1cyLzk0dll5Y1B4cGlncFNa?=
 =?utf-8?B?bVRmQjJFd1ZYUHE4WExvYzk5NnBEdGZnZFo2cHptNFlUdHd0Rk90M2ozYzBE?=
 =?utf-8?B?UlNlUmlQUWZ6WlpBR1ZjN1hUeTNQaDQ3Vmo1TlJYbU96TDEybmc1UHNUTjFw?=
 =?utf-8?B?bktJM1U3amVwQ1BwS1owWERvbVVialRjb2RpTjdRQU93NzVoWGhQeUg4Tm1C?=
 =?utf-8?B?SytGM3NzMmRoemJZMldteHYwNmdOSW9iSVFvYlE0eGs0d0NHVitMUi9GdS9H?=
 =?utf-8?B?WENjWHU5bzJPYzNNY3ZlNGorUGszRW1VQkVQNXhHSklKeC9vdmdwOWVvWW1W?=
 =?utf-8?B?K3ZWemMzbGcxK2NyUmx5ZTZyaFZsS2JEMWdXRlJWbVBwenVlaXd6THZtY0tE?=
 =?utf-8?Q?fl8qCZ4uWMbLm+donrsfOA4pEoDQyF+z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1BpcnJLRElrMzZzZGN1dkYva2VMS0VNNTIwZHQwN2xGTWE5SGUwZHVldVJS?=
 =?utf-8?B?cmRTSEpDblRabFZTc0VybkRZekhndTdSdjhNVjJudTRDSlV3TG9oQmNzaU5u?=
 =?utf-8?B?YXNEWGREd2c1eThIOXlydThKR3poaHFkZW5vdElrWEVpSzMxbXhkbTIzTk5O?=
 =?utf-8?B?YmY3eVRDVXRPTDl0aWYzcVRpRm5DZE4rOVFvOGVjMzFnQ1BvY1k4WDVpMTdS?=
 =?utf-8?B?cTdvekdkZVNBdC9pNVlQTE41L0ljWWppT2k2Q2IxM0lUZXNQZFhpai9ZSHBB?=
 =?utf-8?B?R0lCQ3ozNDN3N0lXNlJVaWhoMVFZb3Y5c1N0RHEvbi8wajkvZmtjU1lyR2Ew?=
 =?utf-8?B?NU1oNUFoWUF0c25WWHc1WG5tZk5hS0dUeWtkcUp3dFZTbnhNbmpEb2VEYkQv?=
 =?utf-8?B?S0lkNmROZTM3RkVkM2YvQXlKcEwxSXpDUkRqdDF5aEMvUTV6ZXpyZzd2MGc4?=
 =?utf-8?B?ZXFpd0wyVGFjNzZaU0tYSGM3VkhhMDlhNFp4Nm5NTUZPSmNyV2NPR1V5TGdF?=
 =?utf-8?B?QlVFa0cxZHhVbFBMbStlbGhpWWtsaWtwMEk1aktxR3pnNFFwZm5MT3NZTlVn?=
 =?utf-8?B?YlJPUHZZYi9yRXg4NC9QMU44Nk9ZRHA0ZnVTd1FOTGttbGJTRkVQenR4Nnp4?=
 =?utf-8?B?SVRCUFNYSWtWSUlJelVoSmNzTFFDb2daejFVYzN4Ym5EVmI2NFBuRFdHVFZR?=
 =?utf-8?B?YkljQm8rTU9yVC83UFZuMFRMYnJNN3dZMnpxeVdXZ2huRU5WUjV3MG80dzNJ?=
 =?utf-8?B?eDBWcGtTSjBxaVhwYk9USVc5R3FHY3N6MlNCYlRyaHU0eHZTWEdla0loRzk2?=
 =?utf-8?B?Ti9DNEU1ZTQzMmVGVzZzb1lvanR0TW9MM2lhOFQ2dUF0R1gwUkVzQzF4VkYz?=
 =?utf-8?B?aHp4R1pYbjBDSnAzTWpoZ1FFMm1yUXNBSlhxLytJSHBFUGtSWTdDZmdqRjd6?=
 =?utf-8?B?c1VNK1JLNlpqbnN3SE45TXoxU2daRDFCb1N2OFFhcDZvbmo4K2F4cDJkazFQ?=
 =?utf-8?B?YjBGYlUxZGRkcFE2SU8wblZpNFdDQlQxOFM2K1dxUDlxT1V2K09jdlZFblEr?=
 =?utf-8?B?ZVlJTy9BcTU4TjZOSy9BNmNOazYzY0NIc0p6QWNRVVpjT2RnUmthQVhQa05k?=
 =?utf-8?B?dkIwbkdJSHRUVHJQemp4ZzZ4YVNtUG9MUzB2Qi91MTdyOXdzVVBldmh3aDBP?=
 =?utf-8?B?b3NGSkZVcFQrWUd3Qk1URkRYbUE1d0l2aVZhTmFJTU9LQkxjeXB3WWw1ZVhl?=
 =?utf-8?B?MnE0c2hFZ21DUWlxckVXWGQyb2o0Zkx4eWZLbVJ1WGZpNUgyTno0ZnBiNVBW?=
 =?utf-8?B?eXZoMU5nb293QUpMTldKYnJSWHRRTzcyeG5VWEE0V3gwM3BudmZBb2Q5NlBM?=
 =?utf-8?B?M21NL1JHTDhtTEtyeVNsakJLMFI4bEg3MC9NWDFxbFVUUjRDZGQra2NYRFk3?=
 =?utf-8?B?RC9Gb1lPVHpFOVFFSGxiVzN5TURIaE5pWEQ5WHNFMW9DbHlwOUFQTlFPazBK?=
 =?utf-8?B?b2RyRGJ5RDNLR0hCc0wyQUJ4ZFVvVHNwWjBiejZKU01FOXpjSEhSenNzV0NR?=
 =?utf-8?B?Z01YbnpTM1gvMElEWDdzU0MzN09tT3dRQVpaeGp0eVBEZnpibWpaZ2ttdnlR?=
 =?utf-8?B?cnlYdS9idFJhbHhrUEExSUxVK3hMb2pwdzlSclNYQmUzT0JjN3NhRnN6Mlhq?=
 =?utf-8?B?enV4MGIrQU43blpmcmozNmlLeGFtSVI3cFRUdFB6d2NkK3RlRUtPQ0VKM1pD?=
 =?utf-8?B?Z28ydlFCcldrWC94N0FGWG9JVzRnZG5ZZU1SVUNsNm95dE5MaDhCU2JSclY4?=
 =?utf-8?B?U3ZJZERISUwzT1ovYVVkZytaK3BLeXpmS2RESjF5c1JNTWFCQ0w2Y2lwSXFX?=
 =?utf-8?B?aVRKM2MwVDdyM2ZrUUY2OTFDYXY2QkdSWHBLWmIvanJzbHlzbHlzS0FFYXpL?=
 =?utf-8?B?N0c4bk5oRjdJSjNOUDVhUjByUjVCR0lNTE5hU05HeHJUS0lNMkJNVWVxOTdn?=
 =?utf-8?B?bGdkQU9EOTd0WnNjcGxBZTlhdmxPT1lSaFhuNE56blBFRmVRbXN1ZlNLOHBP?=
 =?utf-8?B?dXVITkpNYm5NVVA1VXl3WlU1dnR2U2RhdHhZSjZnTkRNL0JNUXpUaytoNS9Z?=
 =?utf-8?Q?4I5y25EtMr8mlBiiIXkh4z3NG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UxrSg/CgLqquHQ8ArqBW9em8oUCrTkgnfKxi5zdlQf03ZyPthXbv8IYcrQYRVXGFm4qPXY+NUlhnlP9Bi71pv+4aiu/riL0tHID+S6r5a5KAVeDUaRmeKBCxFEZ1rqiAnLiYtL+zzZCEJkzgp8Qn+UBizPp4EFK+H3taHOdC3oobPMV5wcZWV3oDx4WvBoGqBTp7cIhNvu0QAEGu2U3HOg1C21QKtM8EFqo3rc2RFK1Ofz+G9EIbmykS1rcc9A8SAyeH07zA2X1+Kk0iiKtq19GmuNHq04VqcpbkfMuwLMaOqdulVgp+COIfR8UrO75D100VrNASISFAUocbSARzy7Jar8PFE5n/XMlLWooieSlL7fExX6qGZrJd+jgFH3IMEAvZ6uggPrxTXGpkLiLXBLoAwtjmny5OmeL2Q56+MnGNwGjFk7LUEWwAYdupA8pOOCagDN3tzpzejzfiMe3cGfEYNJ9gHnYjj6nAQj72ZMTWdzzgOqLQBe9U75GMZ4Iq6xmjGq9CMy9ocdfQPTrLOjvenfGeJkPe6ccqgz3dPp8//KVzITCOn35mwUvN5x9Z3QeSKxG6ypeY9tH5J1tsOXBYweMI4J2+KEMJfanIPZ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1e9521-5d9b-4b05-049b-08de3e73369a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:22:49.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDZojoRcarJyW+buQRGMlNabH73KO4b6cj/A2X7XwoETCUrqfuTUvTJgsIY+fqXl0gyYfeVZlyF39MmkjnE14A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7053
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180168
X-Authority-Analysis: v=2.4 cv=Ib2KmGqa c=1 sm=1 tr=0 ts=6944629c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=cNOeK5UMLfZoZ2QzniMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZuNDdInumJmEhRJ6ooXVjWjzXgOfob-p
X-Proofpoint-ORIG-GUID: ZuNDdInumJmEhRJ6ooXVjWjzXgOfob-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2OSBTYWx0ZWRfX8Y8Uhvz+lkYr
 TnQoxGHvAcTArX+dvfsEJc7AQnjAXfnHoeMCnos3pts6N173XCY3jHdHlGv/LYvZFZSOsdo5oX+
 ybUeNdmn7tDxSbEbWFrXZs60l03xR+B2jBekLZs0x91WgaNtTXDKCSWxf1YjktMlL1sD338eltw
 qgWi9jOKpuM7FfQMug36Eud/v7tSUrtinl3c+7gM89HNXCqQlLCdI8g0WCipPtbMrF1sLKo/Xq5
 JjlBEpaZl0EgG9XXZj3St0bmsOzgDOFEiTnQ+riBtoBK9OADdp3b7ht6W8vi5+e2Lrv1bSIgAcs
 QyGnzg65jUv1hPPcekeAh9o+vFbItK2T3boq+kHA91UPe7XhTmyjEEKVmt7DYojFyJ9PWepjVPw
 BSWPBDYVfDIqVimuot5Rj7DLLcOrCvJwqoy6C+hQSGkwS43b86N4QzTK811gDHJGKHSLmo3KFRx
 1++VHqziwhv1hKTE4cg==

Okay, but there must surely be test-suite changes.  At the very least:

* test/unittest/version/err.1.1.d  The err.* tests should not simply 
fail;  they should fail for the correct reason.

* test/unittest/version/tst.1.0.d

Maybe nothing else???

On 12/17/25 00:10, Kris Van Hees wrote:
> DTrace allowed setting a previous version to operate in compatibility
> mode.  Unfortunately, it was not fully implemented.  Translators are
> not really versioned, and if a translator uses an identifier that does
> not exist in the version specified in -xversion=V, data structures end
> up corrupted.
>
> Since the usefulness of -xversion=V seems to be less than the effort
> needed to rectify the implementation, we are no longer supporting this
> option.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_options.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index 97516517..0a35e852 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -24,6 +24,7 @@
>   #include <dt_pcap.h>
>   #include <dt_string.h>
>   #include <libproc.h>
> +#include <port.h>
>   
>   static int
>   dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> @@ -676,18 +677,7 @@ dt_opt_invcflags(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   static int
>   dt_opt_version(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   {
> -	dt_version_t v;
> -
> -	if (arg == NULL)
> -		return dt_set_errno(dtp, EDT_BADOPTVAL);
> -
> -	if (dt_version_str2num(arg, &v) == -1)
> -		return dt_set_errno(dtp, EDT_VERSINVAL);
> -
> -	if (!dt_version_defined(v))
> -		return dt_set_errno(dtp, EDT_VERSUNDEF);
> -
> -	return dt_reduce(dtp, v);
> +	return dt_set_errno(dtp, ENOTSUPP);
>   }
>   
>   static int
