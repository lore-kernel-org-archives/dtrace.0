Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478B152E0C
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732787937; cv=fail; b=kXuzNCA4q+NmW6D3QdCs+/xiDxT3dAyLSHwDJkXqKam8krA5wqsbuP4p4ua18zSyF+pwlhKT7y3vlWvDkQ0GRKUeJMax3cz93dBnB6K3BPH7vOyLOZoFOj8Hkb/v0vnYruyngQrlUlzOYYbxkXmTmhXhsJLlu6L7FMSLXaM63LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732787937; c=relaxed/simple;
	bh=ZOYMrCc/C/SorMQ80JlNIY3Mx7fqNKbd2CWVwUFf5Ag=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pq70t7NvIJZrV0xfOJq4sD6ps3AOftX0vXp1uLNXRR4CUczwJKVuYvI8rKGjPgo/5uFMgTGJTDNTIzea/YapXfKSDt6YW/iepktETSLlsM8XJJ6HzeCpvZ4ASb7fo2v4gOjRfHeXahKpeOZ7C9ZLxMTXyNjttvZflqhIfNNvB/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SPJq5VTI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vwb8nhL7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SPJq5VTI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vwb8nhL7"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS3taH7013517
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 09:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=tFdf7hNgncCimC28MWyyYIcXcSDbsPdge5YQ3hyhTvU=; b=
	SPJq5VTI+McVQDV2XoHLhIN/LIkRcxWFyfLtRC7yQ5dxQbzXgch+4iQt9WeEHeSI
	G6EorgpeowPtC7xzDEq1e17So6AqJ4kScJrqvO1RmAU5LmL73GQPYyxCuOK6tZ8O
	pw/+gZr3rdt4iS//S25DnzZGxGLulbbuUG+BQ8awJcnjaCDDrHflyKzEj2vtmhpN
	+W0hoFayW+CPnurXrjmCtWQ4wzzXnb41SIh8mLZlaPD+FLvIu60y74+qP8NDcOsH
	1BShEVUgqCYI8aSA0MCA0/gvQx8KY7W5Htp40QV3S56jk/QcHafMBeNCcRjPzhCV
	kBDe00vzWRSnVC062bjQWg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4366xx1jwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 09:58:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS9dFdh022487
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 09:58:47 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43670862p1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 09:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExDvvTyflOvon/xwLS+UzwbqYn8zHquuU75uBlwEZgzBbPOWPcf8h07KdbAVfEGk39dWTWLBMG/E+YX3ABoa96xGbjnv4S/RSx9HqS5XolrRh9igxQbzvHIrsCLuPrEMAKZlweiKn9wUL0XR0h6LvlD/Z/AA4b49RowY6SobmPHbYl1IbTintoZP4bFruiajnwxhVxLc+cFr8eCwAWcccaIKsfCx5+ojO2k5x6/X0y8riNLVikpHtSY1GNEvue8sZbr7qCSEGSMrdeEdJG/BmbasCdks7fCUGukF6u55IAq44K526qnNVTjTCo/zySQjTdUPGGcEGUioVXsAuScbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFdf7hNgncCimC28MWyyYIcXcSDbsPdge5YQ3hyhTvU=;
 b=vDv8nmYGRM7n6aRcKLs02v5NNK3gW6fUildAXAeJH6xPmp4H2bUlPU7pzG4wSu2RfjgcGv9a0j4bF3fLTiWerfMYkSG/FawJts9XjmhKEexmDvdpQEfPUqcH7JgJByhFXU/yBKqu8zzNaThB9ifidtJQ0dgiNWJApOJPz+1FiRRD0JosjlYmo17MMiI4AJ0FWjQKDIcnCQpCDnJgSXRvNQeMtBJxGl8mPJUFzd3Z7uoYkk152Wg7j+t4xuhn3cCOzf2eA05xu075ssCGFt9MKt/bCkFQjuTo5gUfkT7nrq8CydGrGUI3mZTpSc17x3H7f8fyEP4S56/sNDrhoW4G8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFdf7hNgncCimC28MWyyYIcXcSDbsPdge5YQ3hyhTvU=;
 b=vwb8nhL7C8lhirj+53W76vohxIUkGRZAKd3AINPr7k6Gmn7rJhzic/A2UHLlkfX8Q+pJOwVxL4mGSheE9GLqZ9cRBXNtuPd0gh76ltOKSCBu3hP9AYEildbzI+WwpNxyfaX4cdC9uU+mGs3bvg+m48tYBB4odFLwH1LSIn3y3T4=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by SN7PR10MB6361.namprd10.prod.outlook.com (2603:10b6:806:26f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Thu, 28 Nov
 2024 09:58:43 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%3]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 09:58:43 +0000
Message-ID: <4dcc0709-bb62-4beb-aa41-13875f7a700c@oracle.com>
Date: Thu, 28 Nov 2024 09:58:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 dtrace 2/4] fbt: support "."-suffixed functions for
 kprobes
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
 <20241016155409.4038017-3-alan.maguire@oracle.com>
 <Z0fT74qN3NPCoyq1@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Z0fT74qN3NPCoyq1@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::10) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|SN7PR10MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b828eaf-9324-4533-1f63-08dd0f933e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlpPY3FtOENBeWMrSDlycGJpZHlNRXIvS3ViMEdqYkJXcWVjRlVrQi9aUzFn?=
 =?utf-8?B?bWx5UDRscXljREdjSEI4clFPdGJFbCtsRUNRNTF1YmQrcHFYNktndjB4WHBa?=
 =?utf-8?B?S0tRTW84V1dKeEV4U0Q2OUkxSkl5TWdKWmZ0Z0RGR3NuWFUzQVA2WUdLWkhE?=
 =?utf-8?B?Y1JTdUxxYmVLVXloOVFvN1FQbis1eEh4THdNNVF5V1B2NkR4SlZueG9SRXZW?=
 =?utf-8?B?emhSZDFZcFdjK1NNdVlOcjIxTkpOWDZ4Ym5sclVaVUtlcGw1NG1odTRhY1hl?=
 =?utf-8?B?SUdZVEtXYXNBbllVZC9ZVW9JYmN5cXY3aEZHak9aUnNuMGsvM25lRG1sdDJw?=
 =?utf-8?B?ZUpmR0U3dy90eVQwNVF1VllHTXExdnlYdkdjcWgvK1lTdW5DbFJmMXFsclcx?=
 =?utf-8?B?N3ZtWjNUemdFN1pTVVhhTjdRcGdCSUQxc3RkV3Fzd3VnZG9Kek1kZVlpWTh5?=
 =?utf-8?B?YVVEblkzRWkyUGRjT2E2V3A4SGFjVTRPdlU0VFVUeGVMOGFYWE1MUzlWZEw1?=
 =?utf-8?B?d1lYL3dqT3l1OWpsaGFNR3ZxTTF5M3d6RGgwazBYNlhLOVhrdEY0NG5EYjdj?=
 =?utf-8?B?RHFKdTRvNng0d2hYWU5mNUVxRGtTdHM4RnduN0RLTkMxTTdtMVE5WDdyZGkv?=
 =?utf-8?B?UHY4Q2NDY1dlNEtDdFVISGEySFg5czAyWEF5SCtWSTJrQytaMTlJSnBIc3N4?=
 =?utf-8?B?QWVaNlBMaW5kQTQ3V20vZ0dtd0NTcUtSWWhCbHlxRnUrS0FRRlVud2dUMSt0?=
 =?utf-8?B?b01JNnRVcHJEWTJqcktRVS9WbHQvUWUrZzhWa2laSGpHODFmSVJYN3lxb1Nn?=
 =?utf-8?B?MW5ySEdVa2ZIVkgwS29FZUo0MzRNM1FIb1pocDJZZ0x2RmJ2d1dXN1NKbitY?=
 =?utf-8?B?eER2Sm8rcFBoRlJXdjExWVM4V2drb2xRVUxzMy82bllMNy9zcjlyVjRmLzhP?=
 =?utf-8?B?RUF1Mk9GYWxneGxhVVA4SkF0Z1YwZWtxNHV2RVJ4SnRwVFZ3QmY1c1doKzBv?=
 =?utf-8?B?SzJ5VmErUTRIcUttRWd2S2VxVkFPbitTbDN5bG9Xa0pzMm1GS1JQNG5IbDJD?=
 =?utf-8?B?bGZxVWthTnlSbHdFUHpldHNKaTJsVDlueDU2R1cvNnVDa0pVUmQ0Q1VzcFlO?=
 =?utf-8?B?NFJTamt2WlhpVnRrOFpjOTZMaUxUcTVwdFNBbEp5UjlpWCtDMWpsajYvWnNv?=
 =?utf-8?B?SVBTblFrTVAzajNxSU9FR1dlTm5PNnNncmVtczF5ZHJ2OVRER1JPSHRQR0xL?=
 =?utf-8?B?YmRxODdyZFBrQkw5NWw5eDMvbWlVRVlQYmdPYlBSY2FKTFZrM1hhUEJkWXhI?=
 =?utf-8?B?dk5lamVoRDEyeU1KMjlOSWdvMzlKb2hpZTZZcFJUaEQzcDd2YkhHd1VqMHh5?=
 =?utf-8?B?VCtHU2J0em5ESGZjc1Q0QTVLNWxpeGs2TW1EcWg4T08xZE9CdkFhTVBaT1Za?=
 =?utf-8?B?YkU1VlA1M0l1Lzl2OXN0RGJUWG1KSXVzQThkZGZtQ1JvTS94WjVXN3hjUkU4?=
 =?utf-8?B?SEF0bklpaXljVUxHQ2s3THgybWdPaW04SHl1aExVQkd3cjFoanM2dDE5TUdS?=
 =?utf-8?B?c0QwdW5abmk2SjFadTNTR0lVQnBwUlIwZHpNZGdPbEp5cEIrM0ZpdVdOdEsw?=
 =?utf-8?B?ano5akdoZk1aUUthK2dycjk1dnBFRWZScDBoNzVOZmYrRmRuY05iaHdXcENk?=
 =?utf-8?B?eDlvVVdyMlR4TVlpeGZDQ2hLQi9wS1V3SXA5RXdQL3k1N1I5SG13ZFVDdk4w?=
 =?utf-8?B?TnhqS0ZTVDc0NTlrSlorRm9iNm04YkpkcnZpWVcybkZYMW8ycnJ1K3UxQ3ZR?=
 =?utf-8?B?M1ZSK29QWU9PWjNycE9tQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnpRMjB3Q05HQ0krZzYrUVdBbDRVRUoyUysyVUNoVkhZcWRBUGd5aHNlOVpF?=
 =?utf-8?B?SXFjaXl0WTVFRDUwUm5kTjlQZHF5T2R0WVFLL2g0TWZIeUw3STJMV1h6b2pF?=
 =?utf-8?B?N1VOb2FWemVUQjhLVDJ6SGNqVmE2alNuOUJBVkNIY1F2MVIyQzVTUVpwbGcy?=
 =?utf-8?B?K3B6YXhqUzlMd2MyVWZZVFlvZlN1ZENIWk1Ea3ZQbDY3N2NpN09WNi9jbG9V?=
 =?utf-8?B?M0hTK2kzT1dnRkZHRDhZaHU0ak9JaFg3OG41cHg2OWRFMU1uWTlvQlZjUm5R?=
 =?utf-8?B?TnBKU3lucFVnS2lEVjNYbFBJdUpuc2w1eURtZ2psbm9WaEZyTmRmTGFTanpV?=
 =?utf-8?B?dFJhZERCWTc4QUdwRSt5cE8vbVlOa3F2T2Q4VVBBcnNkMzBOaW1iUUdWeVFJ?=
 =?utf-8?B?ZGZwanh0QXIyRVJpSTQwSlEvZWQreUV0MHdkK3JmOGRJT1pMTzVkK1pqRnpt?=
 =?utf-8?B?RWhySmJHaS9Sckc3cXgySXgvaHowUWs0RXZwN2RGNXNnMHNDWFl6TUNybmNZ?=
 =?utf-8?B?eWhySGJXWFpiaE12bmlkeXNic2d5ci9nUjgrTVRmdHhiaDNnbHRTSU5nTkp0?=
 =?utf-8?B?MERCUDJPUW1mWlpZT0dzYXFUbVAxQ3JGRDNXTm9kOUZNcm92ZkcxUDNNQ0Ur?=
 =?utf-8?B?QjZNUmRsZjF1S1RaN0pmWTd1OEFqYkQyYkgva2h6c1o2NVRDa241UWY3N1FG?=
 =?utf-8?B?ZGdVbWt1NlYvT2FIMlp5eG1xWm5TcHRKNHZLK01wZiswZVErSWsrV0dsQVov?=
 =?utf-8?B?Qmk4TkQyeWJOQWFOUU9EWlo1QWU2RGRGV3hEWndLcXU2OWlSdmVoeEpoSGFi?=
 =?utf-8?B?NjM3Y01NZWpibUgyWGtuZWVzRXFFcnVNbDlvbTRWc21IRFNMRFBvKzBoT3Q4?=
 =?utf-8?B?ZVFuZE45U21UNGJyWDNuUTBUWXAzYkltMGJLV0NEQ005eWxoZndYNWZHNUhV?=
 =?utf-8?B?V0htMkhYYm9Bd1FqbmxPSGQ5Sk9TcWFsSXBEbWVpek0wdnowTDZNUEhsSm9O?=
 =?utf-8?B?RU5HeXV5aWJCZGZQUll2UnRvN2xhMGptSmJraWhYU0tpOG5COTM4ZklSSFJy?=
 =?utf-8?B?SEZFSXo3NjhQSmVFRDZpZ003N2lPSEpyYWVoUm5Gd3Z2UHJRQmJZd2NTT1Iz?=
 =?utf-8?B?WnBaeDVySnYxQ2lMSFNzZFBiTUtmMUFHZnpvNVRYWm5HZ3Jxb0tNUDlRWWNS?=
 =?utf-8?B?NVBTc3V3VzFzaHBBME41TGg5akdjcWk1SWNFeDY4SzYxSU1TRjMwN05aRHNm?=
 =?utf-8?B?TDJqUkw4NWRLbS9kMWF6N3VQVUc5WXVRZGtaQTdFalk4eC9VcHcwSE9zaUgv?=
 =?utf-8?B?RTEvTm8yeXpMUnFldWs2ckIxNC9CYzZEcGhoYU5rZ04xeFMyaUlSZE5TeDY2?=
 =?utf-8?B?RDlXVHZDL1hoOCtoenpNZFNyWmpQV09ZdVBJNWFrNW5sSVgrZk8rT3R0YWxF?=
 =?utf-8?B?ckFTZnNNc0ZSZkczaENvZktmWkpPMnpLRjFBS1pCcTlWVlRVbkJNQmlJY0RM?=
 =?utf-8?B?eHB1Y0hob1VYbW5rVTZuMzdKUDIycXNMd3ZuYWJ3OGF2T0QzdG5uVEFuNGcv?=
 =?utf-8?B?Qi9RYUQ5MDFwN3BRd0dDNmlDc0lVTEFJZEUrODlQdGdscHk2RGJRODZlek1a?=
 =?utf-8?B?KzVyNW93K0R6a3ZzalVZSzZoNkszNDdzMnoweGlxTWREWTlPaWdSelBvODR3?=
 =?utf-8?B?WnUyUnF3N0pLMHd6emREV3RGbTRYcDIzU24zSUZTVDZpREhpRUErUkxRZnlw?=
 =?utf-8?B?bHJLNHpWZEdLSkpUc1JxUUxzdFJSYWZVczNlQm1UWlcwcmFxYUVuM3ZubzYr?=
 =?utf-8?B?RnZLRnlZOWVBL1E3b2dLTUc5OXUvS0U1c0FCbnh4c3RCSGNBMlVkLzBmVWcv?=
 =?utf-8?B?UzkzSm5Ka09oV0JTbWhQZkVQOWNXL29GMFZ1eEhpVGFHQ3o0M21jZThlckwy?=
 =?utf-8?B?VGdCSjFPN3A5aVU2ZGJDTE5FWFJXOFdDSU5QRzlicDVGRlk2UU0vb2NGZ2JK?=
 =?utf-8?B?N2hsVUd1WWcvTytyVjVHa1RyNmMzUjZUQjN0ZllBdmJhZ042dUczazIxeml0?=
 =?utf-8?B?cFVHdWNtNHY3SkJRUGJJUWRzb3ppM0JCOU56SVplb3VkY0xkSVlJTG55cml4?=
 =?utf-8?B?KzhqTk90c3BGOWtEMmJUVHhHUEUrdUtiVjl5elY3VmFzVVkwZjFmVkpmRnNP?=
 =?utf-8?Q?fw4ZK3N4gXxnZyjsHBV/MAM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6JvNOO/uD9HTDob2SkCAZTQzl63IZeLMX1iYNuOLKfmJv0Uye2tosdO44N2cj5ueVYGd6qQu7jvOxERHhNmkbX0adwyCEYiyfAqSKJYXOi45xSTu+PcjS1rQEfnqR++OKi/0kd+N3LHmAvjY5EdcejS7EFF2izkk7jkwpwKspRopmUCQIbYZl2hrT9ct3xgNNCWXPW5XRtPFgIM8wQJaTJggyIVfqrt7RdPqOJL3EklSWK4ADEvY4w4kgHxkCm+xKHLCm89RdbuBDCc5rYp0xpxFlkNzGphSYBg68I/jflC20qmH1Aemh6x5ETTls/flDS9noPUGWFl7YR0AN7IKiE7RBBq7ASOmpPXM+6bBNoKPdyoxjwHBsrHN4rV9KNAuIQGrPaYm9GBf23kKcXRJPUE8xW+3JjUfksr73w/XHfF0BQmiDGXFcDvMo+VklrXTAeCXyC8CnhjtNbQ/cb6zYc4pTtRupf+2SPpYgeqZxL1NgA7xvxXrdwejAD8yJmoEdaZH2ckY8rDqC5poje8VAHuN7ALt3iM9qTNcG8wTEr5jeZbsgLInpAtuj9W1c5zz35tXDo39HMFS/j/QFWhIgskT0Zt4W9UtrM+OYBg5klw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b828eaf-9324-4533-1f63-08dd0f933e4d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 09:58:43.7317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05raZeNRS5T4D5I1o+DGoWoAszIKq++xNQjIuQGyXtAxQ3zpXzpDaizBSRvI3myV1c5UFqdyiC5Iu436Bl6sVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6361
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_08,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2411280080
X-Proofpoint-GUID: MTbHx4BEpupIpmIVeoKtJDmffgmFPGBR
X-Proofpoint-ORIG-GUID: MTbHx4BEpupIpmIVeoKtJDmffgmFPGBR

On 28/11/2024 02:22, Kris Van Hees wrote:
> I am still workimg through these patches (and writing some additional
> support patches).  But one annoying detail has come up...  kprobes do
> not provide argument type data whereas we do have that for fprobes.
> So, if there is a function (like find_bio_block) that can be probed
> with fprobe and there is also a find_bio_block.isra.0 optimized form
> that can be probed with probe, they *cannot* be represented by the
> same DTrace probe because one has known argument data and the other
> does not.  And it does not seem safe to assume that the optimized
> form will have the same signature as the regular function.
> 
> Even using the dependent probe mechanism won't help here because that
> is based on being able to convert the arguments of the OS level probe
> intp arguments for the dependent DTrace probe.  But in this case the
> OS level probe (kprobe on find_bio_block.isra.0) has no defined
> arguments (i.e. they are unknown - lack of prototype data) yet the
> dependent DTrace probe expects to be able to populate arguments.
> 
> I think that the only way to really get around this (at least until
> prototype information is made available for the optimized functions,
> if ever) is to have two distinct probes, and requiring the user to
> specify them explicitly, e.g.
> 
> 	fbt::find_bio_block:entry, fbt::find_bio_block.*:entry
> 
> Another option would be to introduce a fbt-opt provider so you can
> write:
> 
> 	fbt::find_bio_block:entry, fbt-opt::find_bio_block:entry
> 
> or even (although it might conflict with USDT probes):
> 
> 	fbt*::find_bio_block:entry
> 
> and the fbt-opt provider can place kprobes on any find_bio_block.*
> symbols and they all would get reported as the same
> fbt-opt::find_bio_block:entry probe firing.
> 
> Thoughts?
>

I'm sort of wondering if we go even further and introduce a separate
kprobe provider. As well as not providing argument types, kprobes also
have a feature fentry does not - we can probe at function+offset. So
conceptually they are a separate thing already really, and though we
fall back to kprobes to provide fbt support when fprobe isn't available,
it might be worth having an explicitly kprobe-based provider since we
can offer different functionality with it. If we had a separate provider
(which still hid the "."-suffixes as these are unstable) we could
support the sched tracing case stably (using
kprobe::finish_task_switch:return) while not getting in the way of
fprobe-based fbt, _and_ covering tracing for those cases that
fprobe-based fbt cannot reach.

With this approach nothing needs to change from the fentry-based fprobe
side; no program-dependent logic handling cases where an unsupported by
fprobe fbt probe is used etc.

> 
> On Wed, Oct 16, 2024 at 04:54:07PM +0100, Alan Maguire wrote:
>> gcc adds suffixes when it carries out optimizations, but often
>> these leave parameters to functions intact.  Many of these functions
>> (like finish_task_switch()) are important for tracing (and they
>> are present in available_filter_functions so are traceable) so it is
>> valuable to support probing them.  For kprobes, the probe name removes
>> the "." suffix, so store it as additional tp event data for kprobe
>> attach (attach time is the only time we need the full function name).
>>
>> fprobe does not support such functions, so the kprobe impl is always
>> used in such cases.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  libdtrace/dt_prov_fbt.c | 76 ++++++++++++++++++++++++++++++++---------
>>  1 file changed, 59 insertions(+), 17 deletions(-)
>>
>> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
>> index 21f63ddf..06ea78ca 100644
>> --- a/libdtrace/dt_prov_fbt.c
>> +++ b/libdtrace/dt_prov_fbt.c
>> @@ -21,6 +21,7 @@
>>  #include <assert.h>
>>  #include <errno.h>
>>  #include <fcntl.h>
>> +#include <port.h>
>>  #include <stdio.h>
>>  #include <stdlib.h>
>>  #include <string.h>
>> @@ -63,8 +64,8 @@ static const dtrace_pattr_t	pattr = {
>>   */
>>  static int populate(dtrace_hdl_t *dtp)
>>  {
>> -	dt_provider_t		*prv;
>> -	dt_provimpl_t		*impl;
>> +	dt_provider_t		*default_prv, *kprobe_prv = NULL;
>> +	dt_provimpl_t		*default_impl;
>>  	FILE			*f;
>>  	char			*buf = NULL;
>>  	char			*p;
>> @@ -73,17 +74,25 @@ static int populate(dtrace_hdl_t *dtp)
>>  	dtrace_syminfo_t	sip;
>>  	dtrace_probedesc_t	pd;
>>  
>> -	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
>> +	default_impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
>>  
>> -	prv = dt_provider_create(dtp, prvname, impl, &pattr, NULL);
>> -	if (prv == NULL)
>> +	default_prv = dt_provider_create(dtp, prvname, default_impl, &pattr, NULL);
>> +	if (default_prv == NULL)
>>  		return -1;			/* errno already set */
>> +	if (default_impl == &dt_fbt_kprobe)
>> +		kprobe_prv = default_prv;
>>  
>>  	f = fopen(PROBE_LIST, "r");
>>  	if (f == NULL)
>>  		return 0;
>>  
>>  	while (getline(&buf, &n, f) >= 0) {
>> +		dt_provimpl_t	*impl = default_impl;
>> +		dt_provider_t	*prv = default_prv;
>> +		char		fun[DTRACE_FUNCNAMELEN] = {};
>> +		void		*entry_data = NULL;
>> +		void		*return_data = NULL;
>> +
>>  		/*
>>  		 * Here buf is either "funcname\n" or "funcname [modname]\n".
>>  		 * The last line may not have a linefeed.
>> @@ -106,10 +115,6 @@ static int populate(dtrace_hdl_t *dtp)
>>  				p++;
>>  		}
>>  
>> -		/* Weed out synthetic symbol names (that are invalid). */
>> -		if (strchr(buf, '.') != NULL)
>> -			continue;
>> -
>>  #define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
>>  		/* Weed out __ftrace_invalid_address___* entries. */
>>  		if (strstarts(buf, "__ftrace_invalid_address__") ||
>> @@ -129,6 +134,31 @@ static int populate(dtrace_hdl_t *dtp)
>>  		} else
>>  			mod = p;
>>  
>> +		/* '.'-suffixed functions (e.g. foo.isra.0) must always be
>> +		 * kprobe-backed as fprobe does not support them.  They
>> +		 * are represented with their unsuffixed names however, so
>> +		 * the full name including suffix is stored as data associated
>> +		 * with the tp event.
>> +		 */
>> +		strlcpy(fun, buf, sizeof(fun));
>> +		if (strchr(buf, '.') != NULL) {
>> +			char *suffix;
>> +
>> +			impl = &dt_fbt_kprobe;
>> +			if (!kprobe_prv) {
>> +				kprobe_prv = dt_provider_create(dtp, prvname,
>> +								impl, &pattr,
>> +								NULL);
>> +				if (kprobe_prv == NULL)
>> +					return -1;
>> +			}
>> +			prv = kprobe_prv;
>> +			suffix = strchr(fun, '.');
>> +			*suffix = '\0';
>> +			entry_data = strdup(buf);
>> +			return_data = strdup(buf);
>> +		}
>> +
>>  		/*
>>  		 * Due to the lack of module names in
>>  		 * TRACEFS/available_filter_functions, there are some duplicate
>> @@ -138,14 +168,16 @@ static int populate(dtrace_hdl_t *dtp)
>>  		pd.id = DTRACE_IDNONE;
>>  		pd.prv = prvname;
>>  		pd.mod = mod;
>> -		pd.fun = buf;
>> +		pd.fun = fun;
>>  		pd.prb = "entry";
>>  		if (dt_probe_lookup(dtp, &pd) != NULL)
>>  			continue;
>>  
>> -		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
>> +		if (dt_tp_probe_insert_data(dtp, prv, prvname, mod, fun,
>> +					    "entry", entry_data))
>>  			n++;
>> -		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
>> +		if (dt_tp_probe_insert_data(dtp, prv, prvname, mod, fun,
>> +					    "return", return_data))
>>  			n++;
>>  	}
>>  
>> @@ -363,10 +395,11 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>>  {
>>  	if (!dt_tp_probe_has_info(prp)) {
>> -		char	*fn;
>> -		FILE	*f;
>> -		size_t	len;
>> -		int	fd, rc = -1;
>> +		char		*fn;
>> +		const char	*fun;
>> +		FILE		*f;
>> +		size_t		len;
>> +		int		fd, rc = -1;
>>  
>>  		/*
>>  		 * Register the kprobe with the tracing subsystem.  This will
>> @@ -376,9 +409,18 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>>  		if (fd == -1)
>>  			return -ENOENT;
>>  
>> +		/* If actual function name contained a '.', it is stored in
>> +		 * tp data; use non-suffix name for event as event names
>> +		 * cannot contain a '.'.  User-visible probe name does
>> +		 * not contain a '.'.
>> +		 */
>> +		fun = dt_tp_get_event_data(prp);
>> +		if (!fun)
>> +			fun = prp->desc->fun;
>> +
>>  		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
>>  			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
>> -			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
>> +			     FBT_GROUP_DATA, prp->desc->fun, fun);
>>  		close(fd);
>>  		if (rc == -1)
>>  			return -ENOENT;
>> -- 
>> 2.43.5
>>

