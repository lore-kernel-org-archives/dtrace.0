Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169BA25634
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738209575; cv=fail; b=Aoc4J1eQbsc9Z9fgGGvD04j922xqyKGn47yuVNQAcXKea3EEHVrVdKMbNkJYXsJAXIga+4UJoANWAde5UjgAuPOoLLiNFiC5JAdKUX2sXa/e+A4wYdl3BHFZaLnftFXLtl79d2j+2jPpit6nxU3r2KMF3pXv5uJxo/moDAdDH7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738209575; c=relaxed/simple;
	bh=CGo6lNIGTMqp43K6gvkVtaS3xwbcUXawcMPN868HnX0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DnAf0gYF0mpCiiDi8MZSwx9TyvZMzshagcnIYEDYwnN+Z+B0MusrXOY3ei7e7OEexqQBZrcWBu/utoaLpr6uqJdI7Cd09WHj6iWo0BSAyw/lPkxNGjIkrQRkwT/PT8jSPoQsLnXl5HeJpyJyfKGnQlZMRJpQfqxlZ8noCdf8et8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dSJxXMyl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h3HBBW26; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dSJxXMyl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h3HBBW26"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U27Fst017327
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 03:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=DVWOYjZKE/5Aj2D0CmypBhRse35us3oPJakQX6Ke6J0=; b=
	dSJxXMylcLReCThXFeTkEwdjIjQFK8e4sTgvO31HsjL2qS7o2I19iGj2MKzUqoml
	fNpLDoN7JUPDznc1JQ1Ceaq3GBCKuGUyR4gdrpxXKlXEdr2iuJ19YgnQawqpea95
	gqYAIHZzSB8vq6zbjy70sOgIxivtm+M9+PWSCWEzTxDROwQ0HBSc2cseKkxf5bBc
	/XCGAdrzSWwdviA/iC2TujecqnxGD9f6zeSoWmLx7ZgsNRBay3Y1N6EVH/wwjqNg
	gDxTyGnO+ME6if1JldebPCJlmAbB16U94PV/v0xJZVYlN1mMJEV7jmhrZ6mj5rXa
	h3kPdzjA5zd9T7Ol9vcChw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44g0bw0gyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 03:59:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50U2pWoE002827
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 03:59:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdaqe4p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 03:59:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+FZ/RjRQ/MatgF9TNqjRyo9gi9oDMbJTxAP8/2n4T3OQPxKt1OuJWpjYFAjrYx/vvbB31NnOr5HWa7HmwHikQBsGUlHMPPCbiRg4o+Iuwop3svtn53aKHw+CcoxSs4I2lhOdYrM406Vy/tfM3QM4lMeJf5VzyPBKJv60yZDLJkSxkwGaSOIwmP+VQSRaLSfO/5Ekpclac/iRzVYfy/R6QvDKHSLK30acld5y9Bn2gzlZs7tNGyGq4v2kfmTNE5LTkzTd8sRWFdxEHYDq1769YnRY7N5zGqVKACgoyiINvb0OIkcbpqpGKMS1trd2BbW3zHKkZRzi9gMrDm+8xnL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVWOYjZKE/5Aj2D0CmypBhRse35us3oPJakQX6Ke6J0=;
 b=mLWLDZIzOyagJrMz0Qodzqb7yEvTG2+n0Nn5taH5dyhAfAd36JiloDFbgdR9USEFyyoJ2Mb6MDuSLHLKRYgVcsIAQKzjNYtx6GYFfvUhxILnGB9hvIg/ez2GBT3dOJBElIZMJ86V/aaepI+KhfNAqFuvVvpMXrhWc3yq5Ps59ENc40Y3u20CozCqgUbyIxQeewx4uFaAQMptqgWmTTyWxO5imyvd49RS4uiMmkrECSv3s5153vlYO6HnJM7k+nbuxK3xVSY72JMZSdtMNY1S0oXJE9Ck378JuwODRQ9DvJCPB+n+HkeiStzp1JIHyj7f+XwLynIP/LZE5kJncb3/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVWOYjZKE/5Aj2D0CmypBhRse35us3oPJakQX6Ke6J0=;
 b=h3HBBW26ziicWrWOf2nfN+MYXgSp3GOwBlXRh3ZAUWbkJIDN6UtBLdD74VY8cCPk8dr4qU0RYserlVXp7y5viuaxfhIF8M8kqufLiVCDHI+MYHDlSDGBMc0KLDKd9QYH1kugVq0OwQn7G+yYY1JO5WiRa208iFwNqAM5+bwmEig=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6674.namprd10.prod.outlook.com (2603:10b6:510:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 03:59:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 03:59:26 +0000
Message-ID: <58ef1fad-97fb-c907-cc0b-fd29de5a58dc@oracle.com>
Date: Wed, 29 Jan 2025 22:59:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/6] procfs: add 'execargs' global variable as inline
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <PH8PR10MB63378175F68DB1DD5D55463FC2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <9164adb5-a6b1-a7ff-530c-6aa30fa57be3@oracle.com>
 <Z5mY0VUgun8jSNq/@oracle.com> <Z5nOoPF05zuDGWr2@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z5nOoPF05zuDGWr2@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL6PEPF00013E0E.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:f) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf36226-8cc2-432f-3c54-08dd40e27d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STUzdXp4Y05nMWVRWE15c3Y1MjVXNU96Nzk3WVE5N3l3cWRNSDRZc2FCWlpo?=
 =?utf-8?B?YXRYbTgrSm1WeFZnMHBwbHZHTENDa2R1bENWVjFyc1hhaDcrV2dxOGV5bkpV?=
 =?utf-8?B?VU5JcnlXUmdUWWg1dEU0eGFCZWVEbTBGK1hDWmZCdS95ckorY1hEY0NzUlBs?=
 =?utf-8?B?K3hpNWtmRmhXR0dpdFdjbmNsRlhtQ1FnRStuUE00ZnJ4STZxVEhuZW5iTlIz?=
 =?utf-8?B?aEU3L3IzNkthc0h0bWV0aytXa2NabldpVEFReDByYnZhbnhUSXFpREN4ZGV1?=
 =?utf-8?B?a05qZEYvTHN0Qit0S3RPK2RxNGgrWGhpcGMzaGxnemI0ZHgrSjZPRTNGNU95?=
 =?utf-8?B?RVVjcHNZVm5YenZ4ek1MRkxWV1dkWHl2UGpHL0g0aXJPRTNwWi85YmhiNkRh?=
 =?utf-8?B?c0ZWUmNxYy93TVZ2RmJ4bWhnSG1QczVqTXZEMm5CaWl2eUhpeUNZa1prUWhP?=
 =?utf-8?B?WGFLSlR6L25rZnhZQmFDdHZORXhqaUNYYTk3c0loVEpvL054Z21YNlpzaWJK?=
 =?utf-8?B?TkhjcHdXR2gzeUxaWnRqL1ZnbUkxV1FocS9PSkI1TWs5eDFjLzU4QXVHOENa?=
 =?utf-8?B?by9iWDBJZHNHYlJtbVJkd1F3U1FHNEJMbHRka1hSc0xFMEFSWEZnTmI4T0pT?=
 =?utf-8?B?RTJsdy9zQnd3R0M4dHp2QVpkeWZubUZqQmtiaEM4ck1rL0M3djBPZzdMckI4?=
 =?utf-8?B?Zm5WcWVXa2VkeDNiMW5kbm5nNERoSXk1ZXEzUmdCbTlLYW1DczJMZ2JCZXJ5?=
 =?utf-8?B?KzYyWjlMdU5wcVVBZkNtRTFOMS85KzlYQmFZQ3FweklCbWJpK2JYdVdNMHJG?=
 =?utf-8?B?aXpyYlNzMEtNb0pQZjdEMlkyckZ1YTh6SFV6TEJIVGVPL1B4b2cxU2xLVmpM?=
 =?utf-8?B?MW9zZFJEcnRYMXhvbjk5SlQrckE5emo4RERieHdKNytqWWlaRWkzWk9HSXla?=
 =?utf-8?B?M1NhdXI1eHF3cDg3bFlXWjcreUFtNzNRalBMMnZ1aU9BeEF0MlFjTXBpQTZ1?=
 =?utf-8?B?K2JDOEZYeWVxdGR6UUFscVoyczRKYXZ3ZFF3aFlrTGg2c3R1S0RjYkp3UENw?=
 =?utf-8?B?WmdLWnFLRUIyZUNvK3ozc2RQYjM4ODF2VzdIeXM4WFk0K2s5VVR6MDJKTGpO?=
 =?utf-8?B?Ui83cEdVRGpmN0FVT3hYc0lNZzhSSDgvK3VIMngzdmN4ank0N09zS2ZQYU96?=
 =?utf-8?B?NDNuM2orTGk0MC9EdU1hbFg0cTlMQll6dmhTcC9hOHFrWHRFR1FuZjh2SlJi?=
 =?utf-8?B?ZGd0cnQrM1BXelZHMnNnRFdLNlJpOWVGODZRTE1GM0phMkZxSkxlU21kdjVX?=
 =?utf-8?B?cnJ6cU5uT3RDSTMrNG1Id256TDlKU0V0KzIzREREcUdMV0ZiV1lzSjU5SHRW?=
 =?utf-8?B?elloSDJXMHJvOTV6MThxcC9aNSt5dXpSSzdRb0hpekJSdHd5ZUREVTU1QkFw?=
 =?utf-8?B?K2FSZnJsVjJ3SU5wUTZ5VkJ1NTlhdnprQnJlWDFHWjRDOCtnSCtDc1F4SDZp?=
 =?utf-8?B?Nkd4V250YTJuSzJ3dnUxY2NlbTBOcUVTQSs3d0FqQW1EWnZRU29EYU5uaFBN?=
 =?utf-8?B?bGR2M1dvdGh2dFBLeDYxdWxMaWZPTGF1UkdzTlBqWGlDaG5ZdW1OSGRUZFFt?=
 =?utf-8?B?SGx4aS9NSDBoYUs5YlROWUFacFZacUhLVlV4UExmM3RHbWI2QWxienFRUWNT?=
 =?utf-8?B?ZEJUaUFoVDk5S0U0NG5xd1UxeFVTaWE3SU1KbXFnZjJxNmtMb25QeHRZTW9a?=
 =?utf-8?B?aWltaG9lbmc4WERxb0s5QXdJYmZ6SEx5T2xsOXFnSEhDTXZ6cll3THlVR3Z2?=
 =?utf-8?B?NTNrdzJBSWt4U1h2QTc1TVBkR1hkZ0JlYmg0Sk5ZRGM5NE1CVGhmWHVGSW9x?=
 =?utf-8?Q?UjY57cRhEGQaI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um1NMU9acC9ZUTFubDJRZXVEaDcveFlLT2FoeE01YzJJR1RBNU9idGZobmtZ?=
 =?utf-8?B?QWcxR0V1VmRjQTduNnFBb1VxZngrbUtjMEc0K1BEd2h0WGFqWTJJbXJ6SUVR?=
 =?utf-8?B?SzZDR2J3azhudVU1RE5MMTNWRUhnTXFCQ0ZTQ1RpMkxtZjFvaFVyV1RXK2Vl?=
 =?utf-8?B?QWZqR0xOa2lkWkFFa0wyaW85a1pkWXQ1SXdFc3RKMlFOL0lpTWphSUVaa2ZQ?=
 =?utf-8?B?L2E5NlpOb2JBYnIyNm1RaWRIb3c3eFYzQ1c5TGtPVHRKODNNVjByamxaaU9J?=
 =?utf-8?B?OC96NDRvV2c5WVRMdkN1a2dCRkI5SzhMcXlEM0thUFluMm9DUkRFakZqNXdG?=
 =?utf-8?B?Q09VNVhSc3duUnRlNzhuUnV5dFBrR1dCNXpBSnlPRzNxcDhnN2hacDJyZFZx?=
 =?utf-8?B?ZzV1T2FaQlhTQUpKK2hTaVNUYktObEhzNDNjZlVTN29ZZWNaeE82bms0Q0pC?=
 =?utf-8?B?RE9oR0RONnpuV0NSdk5CcFViQnhUdE1HWkpibjJ6cUwzcTBpTnVoZ25ja3Iv?=
 =?utf-8?B?WVJqQmNqR05TWm83N0laNUJnTDFMY01nOTRxa0NjZjk0ZTR5bFJYa09TNjFW?=
 =?utf-8?B?TjdLbU5rUzhrbUlmMG1BQUowbU9FYjViZEp4RmkxQ0FvTGZFM3B4dCs1QWpB?=
 =?utf-8?B?cmhJOXZJQkRwamh0WGdlaXdUWTB2ZlQ5TzZOVERZaGcrNkRCYkViNHJOWlJk?=
 =?utf-8?B?QytYNUM1ekpSa3lFZ1ptTDJIREFKK1VNYWFKYTZWV2VaRHRXOWNtMlZDaElm?=
 =?utf-8?B?MVVlTjBwc1kvWGI4TlY0Y0VaL0Z0NjNoSVA3YnRFbU9uYS9DL25meHRwNFI4?=
 =?utf-8?B?UlM4REFRSVNvaXRTSjRuMXRPZDlUOEdxLzdoR3cvSDNMR0l6WkNRMVNpcCtY?=
 =?utf-8?B?T3NmMjFBcjFZemFoNnZYRTZ6bzVLMW05SXFoclRQLzArTXRQSi8yWTFjcVpS?=
 =?utf-8?B?QzBVR2JXK2JQQUFRVk9sZU03ZWVCdzVQWTYwTkkyMmV2emMwZFc2TzJBRW1M?=
 =?utf-8?B?Sm1zeitYL3dpMXBLdzFkNnRaN3VSNDZzWXhCdGZ3RGZ4bzhPV0NXTnV3WFZE?=
 =?utf-8?B?U1pDQks1aWtwSzNlNEFmOEhOc0hqN0paaWRmbnpBdlBkU1YzWjgyK2dmVm1M?=
 =?utf-8?B?MC81TzJPakk3THE5RmFBa2ZJRW1kOTgvL3JsRkJjcnJsUDFGWmZ6TWZHdzY5?=
 =?utf-8?B?WEhKWUduWlM5NCt5VldqdzZZSHVpNmNmMERKMVVLZGw0WG9qaUdxL3Eza0Zs?=
 =?utf-8?B?M3hxckhUcEd3NlQ3dTA5KzUxZGRtMHlYek40RUx2NkRMSWorNXArSnJlZUFq?=
 =?utf-8?B?NUh1eFVxMU5vQVk5UWJxNGtCWVRNNlh0QzVJYWNIQXlPbkwzQWlSTXJNQlR4?=
 =?utf-8?B?VU03c2xWNnBadjIraENmSGhZNkpPMitucEhiYzdKY3hHK1h6Ui9DN3pqdWJz?=
 =?utf-8?B?K0ZvMDErQ1FRa3ZQdVR2bDBvdVJsYXdiWjJDNlVOd2tueklDVy91TkFxSEhF?=
 =?utf-8?B?Ti9oMUwvcTNzd05rWElTdHhUbCtLM1QxUkhzL1dFZ3dwcTFYeE9YeTd6eHJa?=
 =?utf-8?B?VldvendQMEh3M0RVQkNidCt3amNaUXlxeE9NcC9abGlibjBIZzlTZzFiVXpZ?=
 =?utf-8?B?Tmxpbkg0S0M0UUNDZVVjc0JGeStDTEtzR0V3WTBWVXN0Ui8rSkxMbmNETXlY?=
 =?utf-8?B?OURlUG1VQkhYY1ZsUDczQUJwek9OclBKNUFMQW1mZVR2UHcyczh0d1A1cWpJ?=
 =?utf-8?B?QWs0aFlKZk1pdDZZcnhxUDhEUy9JWlBody96TFh0WFhwTWJ0QnZvbzRHUm93?=
 =?utf-8?B?L01vaW5WTWJHTC82bFcrTTNRajNqVkVWdkR2NzNnUmZ5Q0JDUGVESUJ6aGkw?=
 =?utf-8?B?RmY2emZNQllpVUwwcmM3Zkw5TVFRN25uZGVkNytDWnNFd1pqUWlQNmh0bXg5?=
 =?utf-8?B?WnJTZGxBdWR5OHc1bGo3Nkp0b1dabmVwSmRxdUR6cE54N2VWSWZiY0F0SDJT?=
 =?utf-8?B?M1hqeGRleUh3ZXEwa1FxVzVEdksyVldpbzYzVkJyVmgxNXVxSXYyOWJKYTlY?=
 =?utf-8?B?UG1yd3V2WDdoMmlSQUVNWE1wV1ZCOWw5MXoxR1hEWDFKU1RPd0hPdUZvVklJ?=
 =?utf-8?Q?yQDJd8rhzTxh22mN6WxrR1dIS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3AL+AJxkRRRztetfnT2ULUZ7PFoIG6QhUwT+4UvICIoB9TfEhA1TF3PWGh458A5inS8J8aYBUT8vvYoLcdXMuY5oJZjoqJgi/u1tx7+0MshVOydFbnlVPGe0T6rrXTWfzM8xQsZlx7TvStLyLirHVDfgpXM3wu6ZZB4WzY2qi5kOvky1WG3pPW2SicPMpj/+6Nl30/XWJrnrUHj8Ms5WvGVZyWsfOR8CD+saX4dQcYIoHzKa0KgvhV/S8JupwuewwtjxczSpy2lrS2YStyBGMsD+1o37rd8pF36DizFACjt1u0RHbLwekCe86qEaQO6P77huVm6KiK14Kh5F57DEBVJUJpF2QaEQP9IN2sseQdFJ0c5gas2SoNQ4qFYEIrkQ+jQqq4CTbRe7VLCUMeX2++OwFfeOiPYcb9ve7rz3Co4gNoPx9B8Qc4nueHtkNI/rmHK6S5t5akgHTp+n0fF3DHDKrdadIZ4qGia8I/tKnpOoBivsmHWufdrGYbXbfltbvSUgATyqVutcH3y/rC6tPlZAvzE37hD68XBkAnegs3/o2rZ76Y9tDVm/hk9uQYkulbLB3POcQzTV7j8KaCXhFzI6VRq9PqKxNbx5TKgB9aQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf36226-8cc2-432f-3c54-08dd40e27d3e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 03:59:26.5762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq1mXFs1z/7KFUd6wTMbOhFrf+EQsCt1wGwt9nCCHHPvybIJqNdfgc4NI5fkPlXjk3J0HKTGhMgcHDrXb5bIXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6674
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=895 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300027
X-Proofpoint-ORIG-GUID: yG1ux4iRvDZ79Nk8cBlqC8K4mCLJcbsn
X-Proofpoint-GUID: yG1ux4iRvDZ79Nk8cBlqC8K4mCLJcbsn

Is d_execargs() supposed to be user callable?  Is it supposed to be a 
documented feature?  Should it be tested?  What should happen if it is 
used in a user's D script?

On 1/29/25 01:45, Kris Van Hees wrote:
> Actually, I am withdrawing this patch.  I forgot that we have curpsinfo as a
> builtin, so execargs can be obtained as curpsinfo->pr_psargs, so there is no
> need for a shorthand.
>
> On Tue, Jan 28, 2025 at 09:56:17PM -0500, Kris Van Hees wrote:
>> On Tue, Jan 28, 2025 at 07:53:51PM -0500, Eugene Loh wrote:
>>> I'd like a little more context here.
>>>
>>> Features:  There is a new execargs global variable.  I take it this is new
>>> to D or an extension to the D language?  Would it make sense to call this a
>>> built-in variable?  Are we also exposing a new function d_execargs()?
>>> Shouldn't there be tests for using execargs or d_execargs() in scripts?  I
>>> cannot tell if we are adding new user features (which should be tested) or
>>> not.
>> Yes, execargs is essentially a new built-in variable.  It is defined as an
>> inline, simply doing d_execargs(curthread), so it is a short-hand to get to
>> the pr_psargs info for the current task.
>>
>> So it depends 100% on the d_execargs() implementation, which is a function
>> that I added in order to implement the psinfo->pr_psargs translator
>> functionality.
>>
>>> Testing:  I see that the following patch (6/6) lifts some XFAILs on some
>>> pr_psargs tests.  Should tst.psinfo.d be added to them? And should the
>>> removal of XFAIL for test/unittest/builtinvar/tst.psinfo-bug21974606.d be
>>> moved from that patch to this one?  And should there be correctness checks
>>> for this output:  not simply "does this script not blow up?" but actually
>>> "does this script produce correct or even just sensible output?"?
>> None of the existing tests should be moved here because they do not use the
>> ezecargs variable (since it is new).  I'll add a few tests for this built-in
>> specifically.  I'd be happy to even drop this patch and not add a new
>> built-in, but it seems somehow odd not to provide it.
>>
>>> I'll look more but am certainly unclear if we're talking new D features here
>>> (and if so, why they're not tested).
>>> On 1/28/25 01:31, Kris Van Hees wrote:
>>>
>>>> The 'execargs' global variable provides the psargs for curthread.
>>>>
>>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>>> ---
>>>>    dlibs/aarch64/5.11/procfs.d | 4 ++++
>>>>    dlibs/aarch64/5.12/procfs.d | 4 ++++
>>>>    dlibs/aarch64/5.14/procfs.d | 4 ++++
>>>>    dlibs/aarch64/5.16/procfs.d | 4 ++++
>>>>    dlibs/aarch64/5.2/procfs.d  | 4 ++++
>>>>    dlibs/aarch64/5.6/procfs.d  | 4 ++++
>>>>    dlibs/aarch64/6.1/procfs.d  | 4 ++++
>>>>    dlibs/aarch64/6.10/procfs.d | 4 ++++
>>>>    dlibs/x86_64/5.11/procfs.d  | 4 ++++
>>>>    dlibs/x86_64/5.12/procfs.d  | 4 ++++
>>>>    dlibs/x86_64/5.14/procfs.d  | 4 ++++
>>>>    dlibs/x86_64/5.16/procfs.d  | 4 ++++
>>>>    dlibs/x86_64/5.2/procfs.d   | 4 ++++
>>>>    dlibs/x86_64/5.6/procfs.d   | 4 ++++
>>>>    dlibs/x86_64/6.1/procfs.d   | 4 ++++
>>>>    dlibs/x86_64/6.10/procfs.d  | 4 ++++
>>>>    libdtrace/procfs.d.in       | 4 ++++
>>>>    17 files changed, 68 insertions(+)
>>>>
>>>> diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
>>>> index 70a43ddf..9c06fe1f 100644
>>>> --- a/dlibs/aarch64/5.11/procfs.d
>>>> +++ b/dlibs/aarch64/5.11/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
>>>> index 70a43ddf..9c06fe1f 100644
>>>> --- a/dlibs/aarch64/5.12/procfs.d
>>>> +++ b/dlibs/aarch64/5.12/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
>>>> index ef27bb70..2824d137 100644
>>>> --- a/dlibs/aarch64/5.14/procfs.d
>>>> +++ b/dlibs/aarch64/5.14/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
>>>> index cad2d2c5..daf30745 100644
>>>> --- a/dlibs/aarch64/5.16/procfs.d
>>>> +++ b/dlibs/aarch64/5.16/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
>>>> index 6b1b1b9c..3594e5e9 100644
>>>> --- a/dlibs/aarch64/5.2/procfs.d
>>>> +++ b/dlibs/aarch64/5.2/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
>>>> index 70a43ddf..9c06fe1f 100644
>>>> --- a/dlibs/aarch64/5.6/procfs.d
>>>> +++ b/dlibs/aarch64/5.6/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
>>>> index 4cb7b77c..2d52f079 100644
>>>> --- a/dlibs/aarch64/6.1/procfs.d
>>>> +++ b/dlibs/aarch64/6.1/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
>>>> index 4cb7b77c..2d52f079 100644
>>>> --- a/dlibs/aarch64/6.10/procfs.d
>>>> +++ b/dlibs/aarch64/6.10/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
>>>> index c2be76d8..7679db2e 100644
>>>> --- a/dlibs/x86_64/5.11/procfs.d
>>>> +++ b/dlibs/x86_64/5.11/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
>>>> index c2be76d8..7679db2e 100644
>>>> --- a/dlibs/x86_64/5.12/procfs.d
>>>> +++ b/dlibs/x86_64/5.12/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
>>>> index 28fada6d..3a348ebc 100644
>>>> --- a/dlibs/x86_64/5.14/procfs.d
>>>> +++ b/dlibs/x86_64/5.14/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
>>>> index cad2d2c5..daf30745 100644
>>>> --- a/dlibs/x86_64/5.16/procfs.d
>>>> +++ b/dlibs/x86_64/5.16/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
>>>> index 08696cf7..6ad926ee 100644
>>>> --- a/dlibs/x86_64/5.2/procfs.d
>>>> +++ b/dlibs/x86_64/5.2/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
>>>> index c2be76d8..7679db2e 100644
>>>> --- a/dlibs/x86_64/5.6/procfs.d
>>>> +++ b/dlibs/x86_64/5.6/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
>>>> index 4cb7b77c..2d52f079 100644
>>>> --- a/dlibs/x86_64/6.1/procfs.d
>>>> +++ b/dlibs/x86_64/6.1/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
>>>> index 4cb7b77c..2d52f079 100644
>>>> --- a/dlibs/x86_64/6.10/procfs.d
>>>> +++ b/dlibs/x86_64/6.10/procfs.d
>>>> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
>>>> diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
>>>> index e9d50349..827d6b81 100644
>>>> --- a/libdtrace/procfs.d.in
>>>> +++ b/libdtrace/procfs.d.in
>>>> @@ -307,6 +307,10 @@ inline string root = d_path(&(curthread->fs->root));
>>>>    #pragma D attributes Stable/Stable/Common root
>>>>    #pragma D binding "1.0" root
>>>> +inline string execargs = d_execargs(curthread);
>>>> +#pragma D attributes Stable/Stable/Common root
>>>> +#pragma D binding "2.0" execargs
>>>> +
>>>>    inline int CLD_EXITED = 1;
>>>>    #pragma D binding "1.0" CLD_EXITED
>>>>    inline int CLD_KILLED = 2;
