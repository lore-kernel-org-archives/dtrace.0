Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F02621B8F7
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756404215; cv=fail; b=bItZJif/ebueJHUCN2e5bhaG8qx+uOXEbzsEdp0HfkCrm31XdSTGWLhDDlaF0eHXZ46MMOJUeiMC0IwMVzl8FLxtoefksYT7WZG9AN5Q6XR1CrlYFeiiVOUw5j+3COviSubzKTB5ZgjYys0mA5yZaVKH8Sh/3XlKy0Lztdm8DIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756404215; c=relaxed/simple;
	bh=lHFx2wv34BaFqSdg8/cBJ1+QA3uqAK3cx2T8cJoQIN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jJvBpSVmeeBzwiTzz+CDtATnQA6IXeScHRSFpjx2qrV8HQbmvVNQoDwI70b6Zo+dWclPrDIdEQh2o5nWAsJVK4Yo8LWx/K4wfJWxZrc/NYYkREnnl0wvjwpEuERoReJpzRHZUR8vGKT3kGs9JCe7wiH2GCsS09aUI43qis/uu0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b7aiMn6B; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y/nT9BOi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b7aiMn6B";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y/nT9BOi"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHNcCB019360
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=FBw+i7TlfE09c62WUGgHbAhSWlY52NVGQPKesQfVFvA=; b=
	b7aiMn6BYhuvXMYjWBmRjL/MTN2rc7BJ7GK00wFbwjn6ZpUsZTDTOcjonc5w8Iwh
	w3OHhjIv8MQxNcVv0tW5wPESiys7OTkYl3ceadMRtatzElK2Rm9NPSZV3up/9HoD
	lMbn2+rh9dCsRQk/MgMbZrmJBNFPIHs+2fkjZ7LWmJKmjGkTvYCccAtmLwEqkGVv
	/N0ZgZKzhwWuvbYn6CmrMVzrH3MoPM0EaxPU9XQsBJnPx6737JPmsMw6ir1DS1UI
	jREMs6hVPhbnCkQlrMNqwR0Wdg/ycHkwBT+ji/Y79sWu7H9f5SkgMMsVQRj11sIh
	kbB8tCBD/901/pTcSglPyw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4jas474-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:03:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHFg4g026697
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:03:32 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43c390k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:03:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elie6nFfwLTZK5qdxpdsTeLPYn1t96ncgIwE6VXY3jbZAWsBQlxw4cZJ4h285p3XbCSq/esvXc7P9HGgEoj07Jn9pnune7G9dniJjuwdm1qTtz5qK4GTWmVjtbazpW3nd0Hji9EYUn8OZj3UOSDeOsgrTCigZQzj3Xpm7+LfrxSKH5skTNYLW0KfMhYUP6ZJUOyY9RS7Zo/9ptZeAp+FDye9EUV/eaZkwof0Lwi8RBsCa9oT7xBuDJKMKuK45ZzLrlGrvI8nyAmIJZrlVMBqLMRqI4vZJW6Rr3QD1eVBN/juFFfPwcrqNFvn2Vll8Xvmk9yWvV2c/M4j4vxtdl23Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBw+i7TlfE09c62WUGgHbAhSWlY52NVGQPKesQfVFvA=;
 b=xNGPJeX49GcgO0xqfA9pFYAOSDcA+mueHqxSXxl/aQt4D0NPNH3u0TsNgFZqGJ/7C69FLKjsY6L07JBHLfCNQJjJ3s366AG2+1vRsjbZnrMQaFHaWLzAo6XGyGIFZLXj1SKa0tk087tk8jgIJXzXLS7b+NWcZAMVHA4bKdOcFw3LqIP8/X9PRcnaQJ0cIwmEfnsHzFZvVGM8DKfR2qRwEWnL6on9EWPHpjKMTwO8s7ChLi9IVpGwtWAo9duowy3tnHBX91viQiZDNPiJAdwyyH5UlHbI86vO5vFvBZ1latwvNmejlW5tsFl1AqNkj30k3gG5tvlJI70ehJ9RPfLrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBw+i7TlfE09c62WUGgHbAhSWlY52NVGQPKesQfVFvA=;
 b=y/nT9BOiT/YJWI7W7UQ48/qGzbSolUjPu1QXerpvZdO0edo3bE3RX+EoUEcUfsrhCsc3kqm4VYIPlWoEPhNRbORpQG/FyDK7UZycw0akmVSQ6M8/oOhvOh6+zjy7rGfmg8HFr+CLzUVhsL7MXKPaxz+VoKJPf3R/vCMXREC14ko=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4496.namprd10.prod.outlook.com (2603:10b6:a03:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 18:03:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 18:03:25 +0000
Message-ID: <f4673bda-6363-47ce-1de5-cd1851d31a42@oracle.com>
Date: Thu, 28 Aug 2025 14:03:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/5] dlibs: sync dlibs with libdtrace/udp.d
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250822181629.30972-1-alan.maguire@oracle.com>
 <20250822181629.30972-3-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250822181629.30972-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0699.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d16c2d0-7d91-4095-8f7c-08dde65d2ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bExLc25BdjVIdWNtTXdpNEM2dnZ1MDBEb1JxV1NKeGFxUkxLcUVLN1pCTGZa?=
 =?utf-8?B?QjNJbHJtVFlOY21QUmdOSEF3VFhHdit3dmtlUzMxd2d2U2tDVmRTVllkaisv?=
 =?utf-8?B?dG11anp4ZEptTllmVWRxdXcvS2FLK0E5N1FnZnpKVG44NUQ1bE5FQVFaU1l2?=
 =?utf-8?B?WUhxNnRJeXlUT2lyRUkyWmxtOTh2bUdMMVlNYnhYMGFTcm85Njl2TWprKzJs?=
 =?utf-8?B?dDlITlBESjVXc2dTbyt5WTlURDNRRWlZbGZKQldzLytCM1ByMVNRencrMHgz?=
 =?utf-8?B?REtqNkxTb1RhNWRvSFhGMjZoS1RQVjBNVWh4Y25mZGowdzhnMU5DMVVwTVFT?=
 =?utf-8?B?OW1IRjVkbGovSEw4TnVEMzRmd0VlMWNWQ2M1enBlZE8vNXJZMldwNk41OFNt?=
 =?utf-8?B?QTM1aGxTcXhWOFM1eWp5RFJQemwvYW0yRUhzekE3c3dsU01LOXVnVlV0NDBo?=
 =?utf-8?B?TlVLSjR5MWhNWFFBcGt1RmhtWUhycGxRdHYwc0FxZEZ0T0JNNWRHQWFNd2xB?=
 =?utf-8?B?NFFIWnorU2FHcG1LVEdJczh1UGs4eURobkhxRnorbkFISUlnNE5PNnRMVXBv?=
 =?utf-8?B?RWJTeElvb1FCUWNqd0RMYnN5NVlUSmhBZEJYYUVOTTZoR09qRVQzSVpwUjk5?=
 =?utf-8?B?Y3FLWTN6bnlsYi9NZThKTFA2aWw1MERDRGltTml1aXZDQyt5Q1lzbXk4ZHNO?=
 =?utf-8?B?UEt6Tm5oUzRYOVRwV3NuenhISlBDdVhyZzhZSXl5blJIYUdIWldRZm1pcDJa?=
 =?utf-8?B?WjhvMExRVHk4L3NsQ0RlRGZNL2l0RVdYUFdKa3VvWm1kb2tIVXQyVDB3Y3Nl?=
 =?utf-8?B?RmgzQ1haVElEOEhDblFQTmRKTjdMeWhDbDBnd0djbkQ1dkl3ZHpFa0RVRmdv?=
 =?utf-8?B?dlg4Q3l4UU9kWnBQZlBONEZ6Q2NUeVNSUFBlOXJxRkptc1J2ME5oTjREQWxu?=
 =?utf-8?B?bTVpaEI0aG83NlBDeEI2TVFKSU9RZk5YeHQyUDRKdUErcHdBQ2pPL01MOUxM?=
 =?utf-8?B?Y1pNUXVEZDRrNVhCeDlJSnVWSlRaQnVUREJwaWxjK0E1NjA3aDFQV2k1N21O?=
 =?utf-8?B?WkcvOEIvVkZuK1dVT1YxUi95MnYvbDhHZDVJQUdYdGZZZnQ4cGxxeUZkQWNy?=
 =?utf-8?B?UlZtM1RRQVJVRGFaV0ExN0g3WGVzZWszdTJ4RWIwVDI4Yk5DcWlmWGhzbzFR?=
 =?utf-8?B?NVl2VXVTYVRNTjZ0V2Y5TFRmMTVXRC9ScWV4V1c3SFY5b0U2K1BmYlU3VWNv?=
 =?utf-8?B?Q3ZhY2RncGx4NldGdlVhbXlrdnFGNm50ZDc4NmdkUnBpVWFBYmZOWFVIV2cv?=
 =?utf-8?B?cThtMzZqbkp4bG9Ccys1bmVqWWRTVEd0blZiMVB3SkVxUi91SDltaE5WSWs1?=
 =?utf-8?B?TGNYU0c5dkhLaldFRHVBdDlDd0E1TVJWVndoUnpqZ3BPWTRkLzBjajlpR0ph?=
 =?utf-8?B?cUVSOHJpcjZ1MG1TbjNNRSsrb3ltNkhxeHNXS0NBWDd1WlBHUEY3YVFXb3pw?=
 =?utf-8?B?VkhXbVZDNDA3MitPSW0vcUU0SDZGMWNjUFJHeDVnbkJyNjI2Z0FMcFZDOUo1?=
 =?utf-8?B?MS9SNmovM3BHRm8xcGZRMVp5VHlZdlBJSm4xVU0vUHNZdUtkRytzNmdaUzZU?=
 =?utf-8?B?d1RzQVIyRGZxT3YzNVllZDdWMmltVnFGaUd0UEpmdW5xbEVvR2FaMzFTekVl?=
 =?utf-8?B?b0hPa3ZlZWdrSHh3emo1b1dUZmswdFUxcTQwV2dmd29rdmhLNTJmM1dUcjZz?=
 =?utf-8?B?SzVvRUFESjVHWmZmaEVhbnVvRk9MWTlFbWE3dEFZaS8zN2hBenNrRHRMb0Nz?=
 =?utf-8?B?WTkyYnZTYUxsMHg1a0xRWjF1TE1BTS9YYks3RkNnZ1pqOERLazJEaWFDaVpT?=
 =?utf-8?B?TUFscENLRldFNnJheHVWUUcwU2kzQmNhenhGK0V2YnIyMTVncUZoNDFPS1hQ?=
 =?utf-8?Q?MVmkzeM0DIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTVhS2xIRTQ4Tlp5QktncnQ5ZW5uTGZqRVlPQzViR3Jyb2ZLTnExeVNKWXdY?=
 =?utf-8?B?UWp5TnNTYmRtdkl0VVVJU3Btd1RkOTBodzJSczVpbVdEYy80VE82MCt1c0tF?=
 =?utf-8?B?ZWt4cjdYTDdrK3J0bWE3RjRtM3ROZFFlTFNjVTAwWVdrRUFiaEtRSkxGYzUy?=
 =?utf-8?B?WFpWOGg2L2tBZDFZWkFjdXpDZ2hyZW9SR3h0cGQyUktjTVlnMFE2bDNCZVUr?=
 =?utf-8?B?NFpNcDA2ODRBV1B1VjVRWDFTQ2lhNjBqUFc4aGJXb1dPNUZMNERRRWdFUHU3?=
 =?utf-8?B?dnNBS2djZGp1a3R5L2dMU1g1aU5LM1cza2ZQcFl6clQ4Um53M0RWaWRXM3Vo?=
 =?utf-8?B?SmFFU1R3a1IxUmtQMVVnQmpvclpZZzErUnVTaGJ5Z2pTZnVuYzRmeDBYVlpY?=
 =?utf-8?B?eTBZU1dScnU0MTRIK1J1elQ5R0U5UkVJUWd2cE5LM1NwNXdJdHp1ekRHTDVK?=
 =?utf-8?B?VDRSOHFHekNzbmJsQitnMGpWZXl6eEdlcmRJRlBYRkZqSjk5b21jSkJEK0JZ?=
 =?utf-8?B?SlorL29zQUwxQTB5UUZKd3hiTW43dkpwMUdQZDZQQU1nU3hoMWc0Sk5MUmdB?=
 =?utf-8?B?YWZYa3krNGFvSnNZREtoMS9UWHdsOWUvaDROMnVTNHpnUncvMEZHT0dRZWRz?=
 =?utf-8?B?MjNQYmJabmErY0JjWGM0OXF4dWR3eTc0WkdNZ3l2Z1ZqRUlIY3V5dkhGaHU3?=
 =?utf-8?B?Y2twSnBsODdlQ1hoS25Sd1pnb0U5QXVlNXVkRlBjblVOVEt2cm95THNMdG4r?=
 =?utf-8?B?Y3VMZU9ybUpRVkxpcVRFSVNQUERnOHpEeVlFTllHMFB5M01TN1BWaHNPbmJk?=
 =?utf-8?B?N0RudVVPSUlaRGYvcThjNi9qaXNVWjVUQkI0eDQzZmExQ3ljcjFoa0hFRGxx?=
 =?utf-8?B?dWhSV1JRSHVwMERhRHFPN2hNeGtiV2xodjZTbGhicU05RVFiTEVtNWEvMm5R?=
 =?utf-8?B?cGxBY0pHcTZEZGszdngvN2J2RkY1RlEyRkJEMVdzMUNJN2EvUm9LUndpaTY1?=
 =?utf-8?B?VHlkZjdIM1hPSUVBZHQzUi9GamJEQk9iMFpsMThzdW51dDFSK2JXcS91RlhY?=
 =?utf-8?B?bXlCZ0xMRWxvamNhbzZhNXVCU0dXMi9RQ0IrTDVxMVIzWWw0eWIweEVTU29K?=
 =?utf-8?B?blNybmJCWXpDMXg3YjlTeUtWbG1oRFpNYkp4MHkvMDhSNVR1SE9PaDF2cGFh?=
 =?utf-8?B?N3NTMUxaUjJsNXVrRU56WkxIVXpma2ZVZ3dEYXBGMmc5QzB0VEt3VS91WmdT?=
 =?utf-8?B?VkZIQmNFQnBaOFBhSk84V0dlcy9JZGk5RFdOUURXckVMZmFnTzRzcmYzekUr?=
 =?utf-8?B?aG5OQ3pJbE11Z0FaQm02aWJhY3hOTzRTMTdhc2xIY1hId1Y1UXA5V2MvY1lF?=
 =?utf-8?B?OUhVRTZiZ0RCVzMrMEJubTM3RUF6VVZ2Z3NDNGVaQ0E3T0JjMHMwMzlQN2NC?=
 =?utf-8?B?ckdGQzAvdGFaQVk4NkxCYklubHU0aDJOeHJZb0VTanhkeFFwVmEwQWlQMmJq?=
 =?utf-8?B?b1FUMEk3MkZuTnZlY29vVHpMUThKd1c1RVRSWWw5My9xNUEzSkhWREFPbk95?=
 =?utf-8?B?VWVMTGJIRldqdDRFcGtZNUpmc2cydGR0dG5pSnd6c01Fd0dXNVFuTGlhY0FN?=
 =?utf-8?B?QTdmVWFQVkNrdE1YM04xZEY4aVM4b3VhSlJ6VzliNWlGOUxBdlhxVHA0cmoz?=
 =?utf-8?B?dE96cGxIa1dnOWhqTU80a2wzVEtNRzIyZnFLUWJEc29iak1sLzJxV0VLNVVi?=
 =?utf-8?B?TWNGVFRjd01EdENSZzJZTlhMTk1CczdsWWtUcGVMUkxLZC84cnpybHhncGxn?=
 =?utf-8?B?Wk5FaTNlNlV4RUVScUFGTnZiSTJYN0drT1ZzL21aWnczRWN5S2YvWG0yZjNE?=
 =?utf-8?B?MGNTQmUrcms0cEo0RGl1UVNTaCsyeFlUY2d6MXBwSjJxR1dlOVBKc2EvWTJW?=
 =?utf-8?B?Rk1UYjVwUGM2dlhXWXZRU2RYMk9kUmxKNGxJUmF5NmRNamFsTXpQcVZ3UE1l?=
 =?utf-8?B?ZERFWHpMZHlnTVdnd2xaVUdZKzVJU0Y3SmdkVHhzbExyWXNsWDhQYmxQckp4?=
 =?utf-8?B?RnNST2pzM29zdFpxRTdsKzBIZ1I5NUtjcmdUMXJkOURRangvMldxMjBldTFG?=
 =?utf-8?Q?fWz88PG6RT096Y6OOgt9K16tj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7uIanSJjS7wdBRpmdjSTj7z1GwzMqAgRIEz7zYXrmAHunNPI1YOg96MoDCytzW3IZ9/b+uOirlgZoYvdbMhRzpZ6NIcK581c7ZgeQI3X+Ur6m52qRRoBANI2nZT6bXq4kTsH+9LQJAwLLQngKr0zbVmcBx8wDS4rlUlMSS7Je0K8PiLcDLr3eoKSjdLqeX51M+9TRo9Z8iMESJX1VGASha2cn7PfEQEuS9KqNOqkyg1zh8fTT84xjj9ZBrjQ07b8lQldS0wfHUaz3EKSd0DN9AyE2DdYSdHbuYBz06h8MX/J3crERS8FY7pM1R9QMmzrus05nh5pHp38BffJFk/v/zTM6IzjrQ5eoI/yqNFt0grj1RSK2rulvT5ZvGK6iKrt+lc1cdd1rE3tNZB9aHESkzrunIX+SnW/eS2MP64/wAT/dR/gi1BFrHdoIykp+Xf1r9089vmIpAsqdQHVbRNa9ucx/I+SzucAsQ9u53KQwllAaMp8KMLcVqHCY37Gp1irw5so9rYoyHDeQ8fsMuqS5AqbryX06oyCfPzwqC+BW2Nn7l5aSzEWOAS+YbLm29PzdxG4/Uzd8SIGfa+vVybAgU5yOcQHe21UR2Q9mF7G0Pk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d16c2d0-7d91-4095-8f7c-08dde65d2ec3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:03:25.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JipNNU/C+ulQhJBozBkB1k5GTuM28QLdQiu5aaXhBxrNn6EM8ExlOwa6FCdSrbF7gFXj7+F/alaq45MoBNxFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508280151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxOCBTYWx0ZWRfX/TRuen4ASECP
 pwIPY7TwPFVtN3K3lM53FKyMXqg5Cqjy2MMLRF5DKmEpU7y7Vk5Y/8rtTZ0/SnfUOujyfwKfZYZ
 wuMBJEUrFZzedQu8lzEPq+KIyTIe0Ly+Ru0lVbkvW1FotaJ6rVCee0IKwfqjEeF3UP4xfLYWUPQ
 7Jhved8QNeitasyK2tEwQvacA7ERnTHHOm6ofX5kXdlEh9IuFdsYJ72gD2jhDfeGiKCBMztoZA5
 FVBBgcuOUYQI1N+qCUGAKgtboSoe2KfC2IDC/H21Tn0275Q2zpnaF+A3eYs/tNyBusl+j+rAiNd
 auvtAZC8GqSCKE1YayhokjsKbIUPx2d2B0igRwNrcEnO8zzHLsYbwJ5zN1ZEq/Xr/TcsaziO1wY
 J1F5+Vye
X-Proofpoint-GUID: qfJ09EeFCfVTxAAPDoGNIN-8b8FsJEml
X-Authority-Analysis: v=2.4 cv=IZWHWXqa c=1 sm=1 tr=0 ts=68b099f5 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=sG3QpkqVjb0teO1pA4AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qfJ09EeFCfVTxAAPDoGNIN-8b8FsJEml

Just a stylistic thing, but to my taste this could be squashed back to 
the first patch:  the review complexity does not get particularly worse 
and the "atomicity" of the patches gets better.

FWIW, the commit message is not needed (IMO) since it simply restates 
the subject line.

On 8/22/25 14:16, Alan Maguire via DTrace-devel wrote:
> Sync dlibs versions with updated udp.d.
