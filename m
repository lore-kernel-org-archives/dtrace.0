Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB519D880
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 05:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759469197; cv=fail; b=JASuMknt/z4qnvG830q9T0sso2RnQy6ogcgeNxvpEn9KbJXom60IvNS+fbNaVuBS2Bz79UhXY+ZL9DwS8guJ48wuiB2rPOXUVwIuPGAvsuXQgRHwkm3YENF/K7cB7lnovIvv69icCcbLqHu8+ZcTzVD0tYxLjPG/f5pryFR2qQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759469197; c=relaxed/simple;
	bh=GxQZxGnIkrfvZfGyzlNEAQH+wOsS52wAmNOJ3MJBiLw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KWISLRoG3lyIaKUz7F4xn3Ryq+HHbM9MNQ6XATQ8iqCke8RYdtHjVBWywwe/s1JB7dQ7lFydJQTUznKkG0qdnhp18P7zJZpxa6z17ELpRVKMHgM+bBc3PPEjIa9K4Bj70mwIW0rO4DvDPbJRbiifGe2PmagGwdPQCAW7VA9pjNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pGvtxlsJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0SiktVDt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pGvtxlsJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0SiktVDt"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1mSx015473
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 05:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NuY8pAWk7wgdFHIuI4AVVP0KQZ3Bh/iEdBdQy3k7ke4=; b=
	pGvtxlsJgD7eoPm4LJ5mcEIzLCN0YmoETYu1wpyjEbdrv1H7/zwJcIp5zlDFGv42
	PxISWad2fM7bfQ2Kd+pzlVax3EmnEcQW1ipXBXakYlhuG+ZhH3zgKs2qVh7teUPx
	vPCd0Friw28bXtMRqbt7i5IP3tEhAHNmZWP0+F68nDMSAD/BAL3d94dFay3aCl5W
	B0M5JQrERTMvsgjH7rSz/QWXby8oDKgdEfPFVeg1+m594ise13WBt+g/rCkFG4wj
	GHUHKw52hLEd1AvVYVAB2TDlY2X3FqgXgfr6H3U/Qrus9bcPRpbhWx3Yj/qn4s3a
	BB2z+y+U5zmmsrCVary+nA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmabmmh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 05:26:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5933tQpN017948
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 05:26:33 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49hw32ku8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 05:26:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vk1cNFNqblN4TGhssuI3zdWKObMxC6SZt9iSMQgz0C/43yMeYi20HU7DUQkYwilMT/uwbvarjNCNvBGG32WdYJZADilyiPDxniKD90xzCb0XlDjLpeBNCiSivE1+UEu9nBSUI1l7Vo2w0kbChiKl7MpSRj1JXAPO5cWRhks5DeqQFJg+I+lEBR3C2YQkU0fJkUZk1yCkjMplGx4k4nCiH0FaHz3m1W2PmdYexaQ0H9G6ewLKb1cn8wNbyAX+ZGluESFwsnzIycUkJsDsUD5TqquixuBl/I/mNeP1izgLZ8c952TiaZ20LQlmxpHg/JMLuWbHRSaWY2rFS6X+AXL05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuY8pAWk7wgdFHIuI4AVVP0KQZ3Bh/iEdBdQy3k7ke4=;
 b=ovlH1SSVgSzoW/RFZNLSTRFrlbhodsTnhrqFgjTecYq8DkUmfipYwJ67zxlOXWaNbLH/FZkzcjuG3X4diDSmjBv/YmSKIiF9f/plazRoBGsxwYlH2ItpIhgC8IeSJdcHg//cq90YP71WjJTJNhdxW/nuQhLMHYrLRqXFQNx+aBSzptsy35gTpHtHpbO+iNsAXZ5F3qPVpJjNWUwWharbOGescvP3iAUNEeyDM4P9gLH8VI++FggVr8G93cBi02olq9bzwvu/CQiqZwxhvnH4OV1b5BHRg62ZMIgs5zRqn9XmwUS1O5dbEp3wziVw6QUb2+KSNvcv9yc/RyumNiESjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuY8pAWk7wgdFHIuI4AVVP0KQZ3Bh/iEdBdQy3k7ke4=;
 b=0SiktVDtPvTV9dNAkIm9aQKZavMUY/V3wjds/vrfcPaLXrHkoq2CMy5kECZRm6p4XxZKB1Eqvw6AGKQXbrji8qN3Vkdr7tzpA+RdMzlau/vCk8WE46hFsNx5/JxTbaavBBhIQ8b2hueDGfrMTc/8mFdYxmgO3MJEJa75KReHJ9A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB4861.namprd10.prod.outlook.com (2603:10b6:5:3a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 05:26:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 05:26:19 +0000
Message-ID: <ae8fe2de-ec29-80cb-bdca-2358ed7db9c7@oracle.com>
Date: Fri, 3 Oct 2025 01:26:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] cg, printf: allow storing [u]stack() into
 vars and printf using %k
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672C09310C10847AEB00DCBC2E7A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672C09310C10847AEB00DCBC2E7A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0285.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 60abc073-c21e-4ca8-ca08-08de023d621e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUtjWWRpcDVBeVYrU3JCYndldU40QVh6aVhnY1V4NHV1MFZaY0t6QVJBbWVD?=
 =?utf-8?B?czFhQ0NrcXpGLzlFcmpIa0tmNG11TTZxU0NaT3hDUGRxSnp4ZWFWYmZvTVhz?=
 =?utf-8?B?bWtjV1AxRmh5R0ZhTEE3UFYwWFNnWFBsRURubWZUQU9yaVFhaEVkN2V4ZEJW?=
 =?utf-8?B?ZFNnQnhjczRGUWg2bzhrcXY3MTNCZjFTNkNKU3dULzE2TEgrWTdGNmxpaUxp?=
 =?utf-8?B?U3RJZmswcGxvZ0t1NkZtSWU3TVpVNlM5L1dORVZiOFl3TUxvcXhvdVNBcE5X?=
 =?utf-8?B?a1J4eFRoaWJUR056S1ZHMmVqejdOTGsreWRCTEtpaXAzWTd6TkJ4UDNFYzNP?=
 =?utf-8?B?UnNTYmM2eFBaVUYzL0gxaTJvdVJZSW9mcC9DTkpraGRJdlRvamV5ZWxFWU9j?=
 =?utf-8?B?c3JyS0xqWjdjaFpzYmx3RC9Od0Rhd1hmUnpoQ2ErTWcrWXRLMlZLZE90em8r?=
 =?utf-8?B?Z016SzJaZ2hzd0R2UzVXMVpwdEcvbUM0WTRDaWtuaXl2SzgxN0pOMlEreno4?=
 =?utf-8?B?a3h2MFExNmhWaTVBOTlwdUcydmRVMHJpNzFueklQTUo5MU9hMXJVT3djNFp2?=
 =?utf-8?B?WC92WlR3MVE3UzdJeWMzbHdtclVKSmN4dzJ6d2FLdVd0dG9BSlVnelBPc2xE?=
 =?utf-8?B?aXFsWDVsYmp6bGFhOFhIcUFETjM3RE9uak9Sbm1WeUxmK0VGY29maEhuTjFO?=
 =?utf-8?B?S0cxNmx0d2t1T2dpSGtoQ2dISFQ3ZHVlYTljODRHbXZyWXhJN3luSURpeFFE?=
 =?utf-8?B?bmhYZC8zUG5keHVhdmZqRU93UnhSS2cxS2tzVXc2N0FDaFVBd2pDL0xLQ2Jv?=
 =?utf-8?B?SHg4bXQ1Y09KMjRnM1FiTDJ0L0c0RkxsODlPeENMV2tNazMwbXMrR0xPRHZO?=
 =?utf-8?B?a256TUZ3Z3dPaEY0Znp4M1ZEWjQvckI2cUhidUcvbjF1ak1IbWVSSU9qTmlX?=
 =?utf-8?B?ZGZuekpyQ1pjZHlBdVlzTVBLWlJqS0tnWDJNenkzbER5S0dSK0IrMWc1MzFo?=
 =?utf-8?B?ZUg1c2VOanZXTGpuS0hraEo2TUsvazNZTHJwWWVYWUtzY01WTDFnSEJTemJW?=
 =?utf-8?B?WkQ0Ykc3dlNlaWJXM1JUWkEwS0ZzdGdtVkZUQkpmTFhzTmtmM09IYUVVSjUz?=
 =?utf-8?B?SHdiMnFhZVZXWDdNRTJFTmpQc2tMMTJnbjhFM2RXck9Vek1SRHlkMitraGpy?=
 =?utf-8?B?OXh6ZERLNHhBVEN0NnZKSlJSNzJmMUpmaCtzbVpPRmFEQURud0FiUVdzVkhP?=
 =?utf-8?B?Y1FBdmMxVmtIa21EME15emN2WkQzbzNTa1ZNTXMyZWhFNlAvYzdrVGtJTHRa?=
 =?utf-8?B?VnFOZFp2TmdNcjArRVJFQitaZFRMT0FJb3pIM2hlRVdUMWx5TFdaQUhDbmUw?=
 =?utf-8?B?dFpOWUh0TUhmQ29BUWg3QVVsd0REaElpcGJIbmZjZytDQmRUNjNpbFBSRmFz?=
 =?utf-8?B?Y1lkYTBNdTIxYmw0d1BrTFE3dU45T05jNzVNVk4vd2QzWVRXZmpGTXNlK1Uw?=
 =?utf-8?B?OGt1Ni96cWRJZENFT2lNbGk2ZHdEMHBjaDlIaDRWWnp6RDZuUW9UenppWEsx?=
 =?utf-8?B?ZWx2aWFjZHN5UzFzYy9aL1VzRmtMKzdrYjRVSEdGTVZSQzlTcGdmQlF5dHhF?=
 =?utf-8?B?TU9DNzRROGJLdDRTQm4wRXMzbmRKQ2RqUitoZXFlWmpiT0JJRlp3dkxabEI3?=
 =?utf-8?B?cjdLWll2VTVZa2xld2czcmhpVEtrMExheE9pVzBCa3RoQWpzcEdTaFd0ZDBT?=
 =?utf-8?B?YlFJRVhRTkdaaVpUdDUzNjhIdWMycnpyVEx6OEl6UXU3NjBxalV0MGRBWDZ2?=
 =?utf-8?B?c1cyQ3NQSG5CeW8xNzRvTWZXbTBoaDZ2N2h3WDBMaUdQL2V3NnVXN1MrTlF3?=
 =?utf-8?B?SnhGZEVJajVKVUxFdUJ5VUE3UVB5Y2h5bjJFc04xd3NCZkNjbjQ4MXlaZjZ0?=
 =?utf-8?Q?zzkZWyjgOwiXOTQ2dRBVrYWhuGVPITLc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzcyUm9KVGh1UlRUQ1FSYWg3QXdBTDNUMGxEdCtDdkdlTUVKMTlrV0FNdEgv?=
 =?utf-8?B?ZXE5SFVVMnExTkYvV3l4T1lLN2twbjY4ckhEakxJUGFRMjV2anl3RFBMVmVY?=
 =?utf-8?B?WDhraGxDKzlpVkROaEtSOGZqNjFQVnRmcStEMlJTUUd4V3UxV2YyNnlReThC?=
 =?utf-8?B?YlFTUC9ndmttSENxcUI5RDVMK1l6VlVxQk1Mb0xodkJJZWVDUStZN0RHdkJJ?=
 =?utf-8?B?ejFEdWxHOVNwcW9tUi9Pc2Q0cHlVcWdIZHJHdUVEYTl2WUZ1L3VYL1RiS1NW?=
 =?utf-8?B?OXQwaGd4YjV5cHkvcFdtWDlKaFhxQUxJY2JsbHppSWZZUFp3eGxvSUIwQ1Q3?=
 =?utf-8?B?VlIzUmNvMWNpcWpoVHNHNGRhNDJxM2JrTDFFRElVdkRoZ01PUkhIRU90dW9C?=
 =?utf-8?B?eTRCb29UL2JtK1Mva0Q0eDFEdk0vREVZbUFsZWw0SnVZV1dSWUR1aXpkelhE?=
 =?utf-8?B?eC81K2k0MURDcVRSQ21CZG1tVU16MnhCS2NUR3pzZHREb3lwRzV4b3Z5a1pS?=
 =?utf-8?B?djJoc2lRQlRsT3NpVkxuLzd1dVBocDhoQ0VMZlNNcDNUSUk1WFpRUm9qWVhB?=
 =?utf-8?B?MlEvOHJqS3I5Vnp1cHRTVXF2N0xReU1XcDZmRnFEWGFQbmNZT0pBZGFuSlUr?=
 =?utf-8?B?emN1VDhXK1dZWlVqNk81N25CaWM1dmxKNVQ4NU1FNXhxUVZhRi9EZkFQYVpR?=
 =?utf-8?B?Wk5yZFljSld2QWtOLzAyaWVUYndHYmdCbEhScTZ3c3l6T3cwZ0pOOTFwSTlQ?=
 =?utf-8?B?bWRxU2NFeWhpVlRKNm5naE02dkxvaUozOUlRMUtnNG9VYjhvTVBVQWlVSmZU?=
 =?utf-8?B?ZGd0WExadytuZWtnR25yT3J6SGptZ0lobEV6eGFGYTZ2QUhWWTVMWXI0dUdZ?=
 =?utf-8?B?TDYxb1EzT1VZSG9uV0hhemxBRkkrQXIycFM5V0VlMG1OT2hOenpWeEF3V09U?=
 =?utf-8?B?ZDlyYXZ4VzluNGZsRWoxZkl3ZG54ODFZci9vU3REdXpFTmd2dEh0UWJrNTdm?=
 =?utf-8?B?TlZ0RktvTGtkNDBlcW5DOXlWVStNVHFaMUdZZVBldFJSeWNjaElYRENTOWxP?=
 =?utf-8?B?Ykt4SURjeUpSWlZvektJOEFhM0RHNG5Vb1pSWTEwazIyaW9pZndLdFdjbU0v?=
 =?utf-8?B?ZUFPemt4WjJkam85OWx1bFl4MmlmeEQwY2xlQzB5Q0ZVRHZaRnVPT0VuTjM5?=
 =?utf-8?B?MExPNk9UejJRWGp5Vkk5SGpKTUxFYmpoTkZ6Z1hPNTA2NUZwSkNuU1Y2YWhi?=
 =?utf-8?B?NDdGeUFrc0l4M28xUFhsdWt0Y1pLZk0wM2VCQlU4MCtKQU1DUUhnZHYzT0pV?=
 =?utf-8?B?RXVXbVRqaU5GUktlQkRSd2gzWU1tejhDang4RXpVUXNHaVY2NjN2L2JxbXhP?=
 =?utf-8?B?R2hTNnFWZ0IwWG9zUVArLzg2YWtNUzNpelBsaU5OM2gyMjZ5cTRGSU5CaTh2?=
 =?utf-8?B?b0ViVWx0akQrYUJMVGw4Szc5NTdKSHBOSU1mTjFYQ0VGTGtFejlTaTRsQ1FS?=
 =?utf-8?B?UHBnYkZFc3B1Yzdid3QzRlJGYlNtVDh2WHp4djM0SllPcVM2Z2lDM2t5b1ZP?=
 =?utf-8?B?Tkd1Z01kWWVzT1ZIQng2U1hjOUNTb3V5K1FwR0hZaHE4VmpIRU9mT29NWnI2?=
 =?utf-8?B?b2VzaFM0NnBwL3V4L2pScDJXc0xvamczKzZicFpXVmZzZVdyRmhmd1R6RDZH?=
 =?utf-8?B?RXM4NkRwdzBqUmo5TnpCWDFaMm5WY2ZZczBUUmo3NzlZbjN3V2U5M21QV2sv?=
 =?utf-8?B?M2YzMGRQalZaeUpiVTVJWHFldkZJRGk3dGVKdDBSTk1nRVhpR21xQ05nbFlZ?=
 =?utf-8?B?T2hFbXV4Z0NubWlabk5wbWMwM3JhT1Fld3R0QnBhQk1BY0ZlWDdSUEtxR241?=
 =?utf-8?B?SjdGaVNJS1hjb1JsN040eWFJcmxBWWxLc090ZFZnWkJyQW5Odk5GWnpPSVh2?=
 =?utf-8?B?UEgwTWpyRmhWUzIweXFOeVZQNnpmWkRGZkZybEU4ZmltanY1eGRQeTc5N3pF?=
 =?utf-8?B?UFlSc3hEc0w4UDA3WFV4c0xranQrbVp5alJ2aWl1aEdSODhIdVd1b2puditl?=
 =?utf-8?B?TWpZOW1YSmk5dzFTNEdGdml0V2ZmdGpNZ2JLQkhFQjdNeUJGUzdrZFV1aktk?=
 =?utf-8?Q?phlsf1XwtnEKLFO76giIFKPJP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BL89UW+LKHPdPJK4VVwJTGoNXdL8S2G9vG5v2HiO6/LofIFkaYdhbYK9I2kA+7Z0QXDMRL+giPXgKha3Jyqzl0L0UIjrB/XQ1BG1PZAhhx3lNOlfDX4B4dyaLeCSMl74kqQEufLeafD9aEp/p2MvjOQpUKCZCkIcoJzX+TftKl3pJ7Iup71YUNcNxPo5Y1KIndmSMjmKMGf7WiG9tUZhTYUXN3Z9TEJxqgUiPbqtB9TY16P1DC6OKG+76KfXUiKRaXUzBzufR3PGpFQVKD5IIPXvZiwY48f88917kgZrII5PFZDoyEggdDf0IEmThqAwr2SJeEYsxMSi5PZkTgr/nwe1FNwJkqstC2yfQM1kqz9hF84LseuG5YlEH+2oTbwowVfBwbbCyWwpt3ZHtU6oG9HPiONorWThLCsly98dXRl4+8Jaz3+LKq/NBlQvL3OwAnUX2ms1L2BFoP05jLswNmfF/jQ9/zHIKEuRgw+ZXmlyva3e8IL1fm2COpycEIG+dgBCnebkxo/npEOaRjksBwdtLZkavwEgfU9+cgP/lrk/wUvxHMDGzXzoighpbWm6uSLIuBOsoDgZsURzNhea11fUWGLmbsdzBzZbi60MjTQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60abc073-c21e-4ca8-ca08-08de023d621e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 05:26:19.7017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpau4VRwwZwUL1uwHacnc5z2NhLDUUEWdKKnq+wUMe7vKzV4qmOF38OngetuXX3AoJItWGtppxkYr3pFHh8VvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4861
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510030041
X-Authority-Analysis: v=2.4 cv=SI1PlevH c=1 sm=1 tr=0 ts=68df5e89 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=2RiTFBpAr6-w54AhfncA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12089
X-Proofpoint-ORIG-GUID: EKXts6FVBe6r2DXr8qqUocm-qas7i5HZ
X-Proofpoint-GUID: EKXts6FVBe6r2DXr8qqUocm-qas7i5HZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfX08HBcVaMprqf
 C56CSng4xI2syKVaYj3WXCPgU6zHaibgTa2RW21waW89Sp/CgiMGrSB7+JtGJ9dNT9Bx1BD7DYa
 05Ldkagl/ujz8/YMPXLEtYjsI4k2ciGc1oVtnEl7LuNs/0GLuAQvVXqWM7HVW8B708/nk7JQtCz
 25XFMMYmPF0lsBtinwJPIu2EN6Bhup1UAWXynPRib29yZmQ8im6dZwaXF7SpLMI8G2eIErzAnsX
 xtX4qAcJmBFonNq+XeWOPRkvC6TmC2ekjQDm3K2db+P5QIQUTiTHRVOeaRGSeh90CK5984mpl8J
 9dYGxdiP4nrmwm1HQJOvGM1hk5D66i+8Y63BgUG5d1wST2E0QTSBA7IGHUzXW74mQ9zvQBwETKG
 RVV4KfizNbbSQQKRiEI6us0dNCLwQUldtSow53da10ASQyDce3w=

Wow.  Amazing stuff.  I wouldn't swear to every detail, but it generally 
looks good to me.

Picky stuff below.

On 10/2/25 15:47, Kris Van Hees via DTrace-devel wrote:
> To support storing [u]stack() values in variables and as arguments for
> printf(), a type definition is introduced:
>
> 	typedef struct dt_stack {
> 		uint32_t	frames;
> 		uint32_t	strsz;	  // optional string blob size
> 		uint32_t	type;	  // type of stack (kernel/user)

The name is fine.  I can live with "type".  But in pfprint_stack() you 
call it "is_user", which seems much more descriptive.  I wouldn't mind a 
change to "is_user", but again I can live with "type".  Plus, changing 
to "is_user" means renaming the ref_type test.

> 		uint32_t	pid;	  // process id (or 0 for kernel)
> 		uint64_t	addrs[n]; // stack trace addresses
> 	} dt_stack_t;
>
> where 'n' is the maximum number of frames that can be retrieved (set
> with the 'maxframes' option).
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> @@ -2760,17 +2767,18 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
>   		dt_regset_free_args(drp);
>   		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
>   		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
> -		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
> +		emit(dlp,  BPF_STORE(BPF_DW, reg, aloff + 12, BPF_REG_0));
>   		dt_regset_free(drp, BPF_REG_0);
> -	}
> +	} else
> +		emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 12, 0));

Store BPF_DW at aloff+12?  Shouldn't that be BPF_W?  And then maybe 
don't need BPF_MOV32_REG?

> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> @@ -569,18 +570,41 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	return err;
>   }
>   
> -/*ARGSUSED*/
> +/*
> + * The data at vaddr is structured as follows:
> + *	uint32_t	depth
> + *	uint32_t	strsz
> + *	uint32_t	type
> + *	uint32_t	pid
> + *	uint64_t	addrs[depth & 0x7fffffff]
> + *
> + * If 'depth' member provides the maximum number of addresses in the stack

s/If/The/?  Also, "maximum" in this context is a little confusing to me 
(since maxframes is a different concept and we're just talking about how 
many frames we're making space for), but it's okay.

> + * trace.
> + * The 'strsz' member provides the size of the optional string blob that is
> + * appended to the stack trace data.
> + * The 'type' member identifies the stack trace as kernel space (0) or
> + * userspace (1).

Again, the code goes on to call this "is_user", which seems so much more 
descriptive.  But not a big deal.

> + * The 'pid' member provides the userspace process id for userspace stack
> + * traces and otherwise will be 0.
> + * The 'addrs' array provides the stack traces addresses.  If the stack trace
> + * is shorter than 'depth', remaining addresses will be 0 and can be ignored.
> + */
>   static int
>   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	      const dt_pfargd_t *pfd, const void *vaddr, size_t size,
>   	      uint64_t normal, uint64_t sig)
>   {
>   	int width;
> -	const dtrace_recdesc_t *rec = pfd->pfd_rec;

Well, if we no longer use pfd->pfd_rec, then the caller dt_print_stack() 
no longer needs to set it.

> diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.d b/test/unittest/funcs/stack/tst.asgn_dvar.d
> +	assoc["a"] = stack(5);
> diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.r.p b/test/unittest/funcs/stack/tst.asgn_dvar.r.p
> @@ -0,0 +1,35 @@
> +#!/usr/bin/gawk -f
> +
> +/ksys_write/ {
> +    # check probe
> +    if ( $1 != "ksys_write:entry" ) {
> +        print "ERROR: expected fun:prb = ksys_write:entry";
> +        exit 1;
> +    }
> +
> +    # check stack(3)
> +    getline;
> +    if (index($1, "`ksys_write+0x") == 0 &&
> +        match($1, "`ksys_write$") == 0) {
> +        print "ERROR: expected leaf frame to be ksys_write";
> +        exit 1;
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing second frame";
> +        exit 1;
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing third frame";
> +        exit 1;
> +    }
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(3) to have only three frames";
> +        exit 1;
> +    }
> +
> +    print "success";
> +    exit(0);
> +}

Hang on.  The test uses stack(5) but the .r.p file twice tells me it 
expects stack(3).  What's going on?  Well, I think the stack is short 
and so we get stack(3) by accident, allowing the test to pass.  So it 
seems that we need to probe somewhere where the stack is deeper.

Also, fwiw, all that nice diagnostic output emitted by the .r.p file in 
case of a failure will be lost.  We won't see it in runtest.log or 
runtest.sum.  Maybe that's okay.  Just fwiw.

> diff --git a/test/unittest/funcs/stack/tst.ref_pid.d b/test/unittest/funcs/stack/tst.ref_pid.d
> + * ASSERTION: Test accessing the 'pid' field of s kernel stack yields 0.
> diff --git a/test/unittest/funcs/stack/tst.ref_strsz.d b/test/unittest/funcs/stack/tst.ref_strsz.d
> + * ASSERTION: Test accessing the 'strsz' field of s kernel stack yields 0.

"of s kernel" =>
"of a kernel"
(Ditto for the ustack variants of these tests.)

> diff --git a/test/unittest/funcs/stack/tst.store.d b/test/unittest/funcs/stack/tst.store.d
> +	v.depth = 2;
> +	printf("%k", v);

Wow, cool.  But how about changing this to
         v.depth = 1;
         printf("%k", v);
         v.depth = 2;
         printf("%k", v);
and then checking that
         the first stack is a single frame
         the second stack looks like the first one plus one more frame
Not hugely different from other testing being done, but since we're 
checking storing to a field of a stack var, could do some correctness 
checking and not just "well, it doesn't complain."


> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.d b/test/unittest/funcs/ustack/tst.asgn_dvar.d
> +	assoc["a"] = ustack(5);
> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.r.p b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> +#!/usr/bin/gawk -f
> +
> +/ksys_write/ {
> +    # check probe
> +    if ( $1 != "ksys_write:entry" ) {
> +        print "ERROR: expected fun:prb = ksys_write:entry";
> +        exit 1;
> +    }
> +
> +    # check stack(3)
> +    getline;
> +    if (index($1, "`ksys_write+0x") == 0 &&
> +        match($1, "`ksys_write$") == 0) {
> +        print "ERROR: expected leaf frame to be ksys_write";
> +        exit 1;
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing second frame";
> +        exit 1;
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing third frame";
> +        exit 1;
> +    }
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(3) to have only three frames";
> +        exit 1;
> +    }
> +
> +    print "success";
> +    exit(0);
> +}

Okay, same problems as before (asgn_* tests, but stack that time and 
ustack this time).

One "problem" is that the nice diagnostic output from the .r.p is lost 
when there is an error.  Oh well.  I guess that's okay.

The big problem, though, is that the test emits ustack(5) while the .r.p 
file is emphatic that it is expecting ustack(3).  Well, it says 
"stack(3)" but that typo can be fixed and wouldn't change anything. In 
the stack() case, the problem was that the stack was coincidentally too 
small.  That is certainly not the problem here. Here, the problem is 
that we claim we're looking for ksys_write (which is the wrong frame to 
look for) and if we do not find it then no checks are applied!  So, the 
.r.p file should be changed to look for a ustack frame and to complain 
if it is not found.

These problems appear in the other ustack asgn_* tests as well.

> diff --git a/test/unittest/funcs/ustack/tst.ref_addrs.d b/test/unittest/funcs/ustack/tst.ref_addrs.d
> +	trace("Expecting vmlinux`ksys_write, got ");
> diff --git a/test/unittest/funcs/ustack/tst.ref_addrs.r b/test/unittest/funcs/ustack/tst.ref_addrs.r
> +                  myfunc_z:entry   Expecting vmlinux`ksys_write, got   ustack-tst-basic`myfunc_z

Expecting vmlinux`ksys_write on the ustack?  No, as demonstrated by the 
expected output.

> diff --git a/test/unittest/printf/tst.ustack25_pid.d b/test/unittest/printf/tst.ustack25_pid.d

This test fails for me, but I think the issue is simple:  leading white 
space / indentation.  It might suffice to strip out the leading spaces, 
both in the .r file AND in the output that is fabricated in the .r.p file.
