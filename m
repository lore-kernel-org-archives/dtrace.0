Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78F1B86D2
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721333966; cv=fail; b=FjEWqPzQzuSDSWC7PqWZKNt2vvgbW4z3OJW4YwptW3BlFyIP1OLv6O2pchJNpJ7XOqnK3yd3X8za3tcabtb/eCBo3J75bzEYUSO9lJHkBvdSkPslt8r5n6Gmjr4V1ykbbYa/zDAp0DXO+x9QCjuHXCC/tbiXxA2K0EWeaiaJyHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721333966; c=relaxed/simple;
	bh=6qSzkw9WMbETc6zoYomrtVRQ6ZASb9QtHiV9fNY+rco=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CcRav5oY9ibnpFpntmRd/mPCL7/9WggwM5N56rfHtpnFU1hftx+SWja9QZgMPdvE+x3GPHUimGeNITw7b6QLi2vWH4MMpUjRTNvvVygBJ2itsKn2ZjftL/lMbVrrWCHVSV8a8YqeNj3VQrro9+1HD3JEPVIQw2EkK6Lmw4a4wjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q735d7u5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kO46CWXr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q735d7u5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kO46CWXr"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IKFZIW027736
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=dsXGoZlByTxxm7LbWf8npeK+mIpV8HiZC748DambW40=; b=
	Q735d7u5EVOjmCHsUWKowFfXPYZBzn/1o2crjJY6FBWPqfYyT6QUiHcvbVwBmH4G
	zo3+nwWXDKG/iHb2frHv13pK/G+BftWLdT2dIMOsqVfYOTHvnLw02c2qn2cgLcWA
	/7rFa3YRipySqGBfdHFTo0FcCteBjjb7UyvNX78LI5oQGx8+atUFKNdSqhWZS/CJ
	sYdtfkzxMB+hvzWK3Idr91EqDbObKDVJAdlSypEyKYsNIgRA0ekHOdoPxEIJ5Deo
	wVwRS+S88x+CFmMUuDqpXkOwifqfmTrsfpQfEPYLoPgfkVC893Qdgfv+esY41sm1
	ZCe2SFe4m7/2XJqkO3DHeg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f9x280a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:19:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IIjn8t031717
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:19:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf09e3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:19:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdtquGMCJ/vQEEoEVEvpydjV9U1U7HBE+V7Q5dgbmnuM+CkaJIJMtUWMOakKMnixuXAcbJbrbnMFAyd2R0XIYomYUlwkZXKzcGvrhh2U1jbQNL049mJm7TfJo9C2aZibAYdEZwmiqwIz7WAN1mqEVJc2xthSjSwqjhzkh5/W140laheN5x935Wo28ys361RqW0Dleh+uZdQn/DLq+9jH0qmrTTLHix101iI3HThO8YiY+aRYBRRlYFqnstqWo3uWvEgUnQFG8uGxebBQ1+pykeh6EifK5+ki8djUZx6AV9QCn1rztLxZsnxzYwu+L3lEhIREG7gDLgbIE14Rz6phRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsXGoZlByTxxm7LbWf8npeK+mIpV8HiZC748DambW40=;
 b=MIFNkCP7CGO1cXbN1ZzLP2L6cMRxk6IoQghUCHlXykKmYaumEHOEMMaIgLYRkfl7OlT15KT0bYtLJBGr2qnblnri88rYuS2gBD45ISBbB6NdIK9+W60vS6YHJECH2fIAFhA3pmYK+usRJhlOU+NYGDjEKbXIN4s+fFiAL1jyaGrV+Ubiajln56tp1mtkn+CJ9OySypzJVRQ+YeppGNhb5v+jt1uK5N2jkiXonUq4n3/87pkpcnr7h80xP6lA/PYKrqFl3WN4+/Uh7lEdBOR8nYI7VfFt9BrJZvNGLSbssqB91EMVUkPora4xTV3wQvrd3nhRE04LTrEpUraCKVbNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsXGoZlByTxxm7LbWf8npeK+mIpV8HiZC748DambW40=;
 b=kO46CWXr0mS985J0k/SqARgPAPFM5VY1a8I9xCVcqjAiLftDk+18K0gG1Jxtrxm49VNsixyYpYaZt/cUM/HFcO97Mapz1Hp/V88zcb8wv+1RK5CMgd/MLrJAwrU+pwtp+T++L/aqyYrxNv3IEzATSkpaGU8/LptbIwTruFVSun0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6040.namprd10.prod.outlook.com (2603:10b6:8:b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 20:19:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 20:19:18 +0000
Message-ID: <6db89e41-811b-891b-e7f3-6f9d6de10045@oracle.com>
Date: Thu, 18 Jul 2024 16:19:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 07/38] Clean up prp/pprp/uprp variable names
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-8-eugene.loh@oracle.com> <ZpljlXz/cG60B2WK@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZpljlXz/cG60B2WK@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:208:32d::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: a268af09-e5b8-4fd4-6ddc-08dca766e73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K3FZaVZCWHdYRWNKdWJtYU9nVGFhVmFLU01jRC9ta2FtczZFSlNQMEsyVStn?=
 =?utf-8?B?U2h4QXZIWDVmRHlvR002d2d4Sk90clVEWklkUG0rTERUb0lzVUtlRW5UQ1NO?=
 =?utf-8?B?bkxBeERnWjhmNlhVVU1QcW44dXFsZ0pZcER0MjFNK0krZ0pRd0hrdEJPejRs?=
 =?utf-8?B?UzFWdjRRZ0JLZ1JOYXdJTkIrUTlYTUl6UkZRMGxFYzNYSDM0QkFETXdud0p1?=
 =?utf-8?B?SVN5MTJWK0VLM2ZrNTdGRjQ3VlhhT2F3VDJCUHU2dk1ac3FRQkVLdVdzalMx?=
 =?utf-8?B?R3dGdEJXM0lVd2NTVkppTXNVZjVXWUc2SGc4NXh5ZlNIc3B1Tk10Ymo5S3Bj?=
 =?utf-8?B?QVpubHcvY1grcUx2RkpDbkorN0xtU0wzNXZud2FoekhlTWk4dk1FQ251UnY5?=
 =?utf-8?B?T0ZrZ0dLcHR6TTk5cWtpQmZFN3BEUlBKREUwQlRIUDZQVlhuUW4xNkt5TjBw?=
 =?utf-8?B?QVpzZGV1dXJidVBLa0UvS3BqbVB5anUza3VsQkZnODNjUlA0Z3JqRkZFbXVr?=
 =?utf-8?B?NVdlZ1N5T0l0N2lLdThFTmUycE5sd2lkdGpoWmV1MlpObkQ1b1I3a2tESmVD?=
 =?utf-8?B?SjRSU1hBK2ZSaElneEhWeVBPT3lJUzhDbGcvYmJjNEpJZjliQUR1cVZIekwr?=
 =?utf-8?B?T0tIZ1pUb2lBQ0I1MGNuOWZMTXJ4N212VGpXazVWZ0pKZ3BPV1N3UG1jUEZw?=
 =?utf-8?B?SExLWWNkYWwwRlZONkprL0xTMW4rN1pVZ21jbVV1QitSZFZHT3BXaGI4WGR0?=
 =?utf-8?B?REZOSmQvSzFtN251UHZIZjRyRU1KWlQvU0JHVHJuYWZiQzZGQ2Qrd0JSVzR2?=
 =?utf-8?B?dWVWN3RRc01TaVlXRTd5cUxwZVQyZ1dOaFYzREpCdVlKbVh0YXBuZHNwTEQr?=
 =?utf-8?B?MEIzVUM2Tk9aTis4TEdiV29LUUNqL0dWRWIwbDZaWjdtdjdKM3ZyY24xN1ZH?=
 =?utf-8?B?YlJqeUlXNC81OWZQdnZpRDIwMlloMnpnYzdQNVVHSTBCbEpEcENzQWpnYlZG?=
 =?utf-8?B?ejF1a3c5OHg3ZlpaTWlPT1dwQlFiVnU2VUU3ZjZFZUFna3BnZzNybmxQdnRu?=
 =?utf-8?B?MlRvbldvNVZ4aFhjZlJ1U3B1MWJMZ0NrTW9zc0hpUW45RnNNTTM3dUNpOFZw?=
 =?utf-8?B?MWxIZEk1K2FKNWFPRDJCWHd6ZDNwNDM0emN3Tjc5VlZIVHBiRW40TEZla01T?=
 =?utf-8?B?U1g5MWNrb3k5VE9aSUMvaldNWWtKYzVaVVVaSjR4Qzl3NnUzNlNEZ28xeDBT?=
 =?utf-8?B?Ri9zNUdUVnNSM3hKTllnM0cyek15K1prOWJwQyt2SDZxckdrT0M1ZEdoMHI5?=
 =?utf-8?B?bzVJc0NLTHgyYXR6UFE3T1UrenI1T2ZQa0hkYnBmbDJsZlpsMzl0Q3psN093?=
 =?utf-8?B?VjVPZm9ldkx0Z0dnVUhuc2xDaDV4RkNZSjFtK3NLSWo2aDF4RVpHRDREZ3JF?=
 =?utf-8?B?S3poTnJiRnpmdXdNVzBnRlhjQktIcjFLL2RxOVluNGdJQnRXbHlFN1FUd0px?=
 =?utf-8?B?TWh3elJQbHRERVZ4dFluYlFmT2Y5aXpjSzZnS24yZk96cFVQRVRvNzFnSE8r?=
 =?utf-8?B?TjQrNUt3SGhrM1pISm95cmJ6Um04bWVVcUk3ZzRUZEJLUXNGcTRhWnluMTF5?=
 =?utf-8?B?MVlZT3lVU0RUN21XQk4wUUZ3Vm8waXRGaWhsaU1LNml6aXl0UUxSdHdsZkZm?=
 =?utf-8?B?VWZaTzVwb2RjYXRVbUJwK3FZR1pKYzVtd29PWmVxR1htQVU0NUZ0SnhjZzJw?=
 =?utf-8?B?eDAwWDlxeFkrN2tvQUc2d05UV1A3NU8ySlNySXYvRjVseDY2TVFVdkhHOTJx?=
 =?utf-8?B?SHdhVmFCT0RyUkNrSUJVUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZThmd2RLanNDVXh0ZC9qSmZCbXRDLzd5YmZlS1BIbndZbytZRkhEcjNpNTdi?=
 =?utf-8?B?RVBiVWNyc0k3NmVxRTdTbnRwZm9lelZPTXRIeWFWcnd3TnFvbHdrR09OT2Vy?=
 =?utf-8?B?eFVmVXdiMEVHUjh5eDI3WnM4M011YVF4QmUybWgzd0hmRDJmVGE4UC9JcGhQ?=
 =?utf-8?B?OWRKUWtkWUdmVndVOEVuNnV4M0ZrWEYwQjRNOUR4cUIydlE0U0tqR3dZOEMy?=
 =?utf-8?B?Z2U0d3dFeHlsK3JBOTV6R0NlbFVCV00ybXQ5bGh1SWpycDRWS01ZWFFlSTMx?=
 =?utf-8?B?ZHJpOStremtkek4yS3lkc0hNY3JYeWFrYU44UUg1TTEwTE45SkVNNzZWdVR2?=
 =?utf-8?B?dEUzQUN2K28yb3ZodUtsWG9NdGoyYjZRbmNwbzJOdHo4N3JqQ09DUkRxT3NF?=
 =?utf-8?B?ZEUzVFBxVDBuTVZMYkdnOS9jRFR1b2xCenBQWldrelo4ZVdYeDVEZUhaVlAw?=
 =?utf-8?B?NGlwWHhMSEpQOUV6L0tYamsxdVFHN24zRXJpR0xnUytLOHVkRWhNbzBEWW4r?=
 =?utf-8?B?aElMbXpSZnhwYUNBS2VZWlZZM2JUTE5WZmNiczM3cythKzdzOFlVWXNZaURt?=
 =?utf-8?B?ZEQ0aWJLUGU0ZThmSmZ1Y0dabWgzeUhkU2VGOHgwWnAzZ0FXaHhrQ3Z6Qkox?=
 =?utf-8?B?bDVEcDdSWWNjVUlORjVkbEQyVkZnb2tOMW5GcDd2YlVQVi9EMG9oRVpXdlJV?=
 =?utf-8?B?bnFURkphWTFOUys5VUUzZ25mRXVHaHBjR2lQc243Ym5tSkJYb2xEVWhhTk8w?=
 =?utf-8?B?SUR4VnN6eXFRSHRWdGxZc1BqU0lqVERVMUd6RDJscjRTU1pMNlpCTTV3YkdX?=
 =?utf-8?B?Ukw1VWRreFZ2KzJFT3h1OFhNUFR6bWhJT0dmak41WEJyS1ZpdTM4K3d2c2tZ?=
 =?utf-8?B?STZjUDFwQlQwb2h1N1dFODhZbm9QTnVvQUhIdWhIWS9CTTVsZUVuUTNlVGpK?=
 =?utf-8?B?UzlHc2p3NXRETXQzdU93M2tibk9CNGJHOFJiRUlGaDRSZXJ6U2RydFBOQlQv?=
 =?utf-8?B?Q3VyTHZhY1VkT2w1WDhhNVZSVUVTZ3FXM3d0VGxVNzBZRFpRbmVBRFFOdldL?=
 =?utf-8?B?d0NvUmFFOVVYVm96bmdZUDgxOVZHOGRlQ0FzeXFtd2xqOEtURFRuaGcwelU4?=
 =?utf-8?B?V2xlMEdXK2RkUkp4UHBxdFM2VDQ2MTlCOVJLSW81WTZObEpIS2ZOdmRwWUVN?=
 =?utf-8?B?SS82dTAwZG02RTA3YlJtVFM4MWZicE94UzkyQ3MwNUJ3MXp0MksyclBkbnlN?=
 =?utf-8?B?ZG9ONWFWcFpqQmFOTDdBTVdoTE4zVXdrRUdHcmJBeVZyTW1WM0hxNFRobnNy?=
 =?utf-8?B?TnIxckVFZDQ5bkJjMUxYWUw4NEpSR1NrVDgxeERPeTREREs2WVpKL0tRYnds?=
 =?utf-8?B?T0JMUk1ITzUwVHhnYWRMRzJxaDhMaUlnWWNpR2ZMazZDZlZrcDJNVG1GTVFJ?=
 =?utf-8?B?NHU2ZFhWT1Jjd2ZNb1BYUmZYbWNrZ3phQVZpUnJrK3ROb3kzM2pzaUlPazV5?=
 =?utf-8?B?bTFxemFpRi9pS3BPRC8vNnNucDlGNU1nK0dEb1B5WjY3K2VzajdMUkxHSUtp?=
 =?utf-8?B?OElNSUYwTVdwbG9kZnJ2SmxBaDFrb2N3bE5TL2QyWFVhMW9PNGJUM0FwYVZs?=
 =?utf-8?B?MTlnWVhwR1d5ZkxQRWFnbkp1QlZSb1hCd0FIZnBKL1JzM1dsL2RsUjBZL2I2?=
 =?utf-8?B?djhNd3UxZnUrYjdGaVRDM00vZisvc3NtSlhTMitBMUY0dEdTckU4blVaa3dE?=
 =?utf-8?B?bXdZc2RVY3lYVjZBMGQyam9YMi9uYXl4SGJvb1NoOWttNzluN3VTV1dhbmJP?=
 =?utf-8?B?aDA1dHJDUmZtM1ZxeHRqK0pwV0FpWjd0NXh5c0MycStJNW5ISFVlams5WERP?=
 =?utf-8?B?Nzdsd2pEc1Q1MGFYTFo2VlA2Q0ZtM2ZWeG9DbFczR09nYk5hOWhpTUtyYzZM?=
 =?utf-8?B?WWw0bXh0bkw4ZGtwUFV0UW1RUUY2eWNIOHEzRkRHVUVDaGJUQXZncXhvUE55?=
 =?utf-8?B?YTdmRC9iR1NsaitpaE1ZTFZrYTVtKy8rMnZzM28yOEFGcWlVZTJ3d2UycUI1?=
 =?utf-8?B?TmM2M3h4WTdCOXpmN0tyU3RUdGR3K05OMk1zZXN1Y2E2eThXUW1tcEt5WHN0?=
 =?utf-8?Q?nUuILH+weOHKb343FSUlNTkxf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	V5uTAal+75Q7VBHWb9dTPEY7rYpVV6hTlIBvo29AsIDAoOECHGEILVrr/nOo6aFJjNlSEJO92PAoUKFHFqcFmyYAgpWrtAZJS6mxgEtlQgOIPG/cSEWKM0Cz0LA8oGICUDQ7ANGMG7PMY6H5SDiGTRri5gHBizjj4hcwix1VPPqtLWwULbkLKK74m6tVZq5GdH1HH24M70F6JY5t4Re6n3eTY65YDwRIPNVmaoj5VxS74mz+X9xP+WcwH080xIjnXoDVkcA9Oa1LUZMm3kqmjFv66OFvPtDD+yt4nwPtIEG9uClQmjEO37FV4dQkpuZ8VdVeOWBfmYYGBqIQLF9vTfGUtw7W+FyrsSWeqU+JT7dymmI4d2rw22SB7H+IeUqIJq9GPBG7ynjP5FhjV7zALUurEEyjXK76/FqWax/e0Zb4mW1iBk6Y89vixKDftUVxHrG6ovPgIISTRn9Z+4cWcLHfkFngj6QNx6b2uD8vLMq4eZ42OIwoErdlnn3Gz92kPNkkHDN0N0cwYKR6UMTJ9uPVzhu/mpQeNY5cql6brTbLwyQOifFtOBhlFgTHLKPEAh3UjaD7j7+dZVJ8tJxMBKNY4h+wfX6HqrUBy5eLM6c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a268af09-e5b8-4fd4-6ddc-08dca766e73e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:19:18.9228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sodO06c6PSKKmO9IonLq7ryiFCiRlu90DI2lc58tPm2Jx2LbBABNKThU74v5PiSGX7PaNwgGqT8B2XD6vUbQrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6040
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180136
X-Proofpoint-GUID: 3CnSRiqp6ap0Q9jiuPmHjI4wd6SS7MJe
X-Proofpoint-ORIG-GUID: 3CnSRiqp6ap0Q9jiuPmHjI4wd6SS7MJe

On 7/18/24 14:48, Kris Van Hees wrote:

> On Thu, Jun 27, 2024 at 01:34:24AM -0400, eugene.loh@oracle.com wrote:
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> @@ -6,6 +6,31 @@
>> +/*
>> + * This file uses both overlying probes (specified by the user) as well as
>> + * underlying probes (the uprobes recognized by the kernel).  To minimize
>> + * confusion, this file should use consistent variable names:
>> + *
>> + *     dt_probe_t	*prp;   //  overlying probe
>> + *     dt_probe_t	*uprp;  // underlying probe
>> + *
>> + *             Either one might be returned by dt_probe_lookup() or
>> + *             dt_probe_insert() or added to dt_enablings[] or dt_probes[].
>> + *             Further, uprp might be returned by create_underlying().
>> + *
>> + *     dt_uprobe_t	*upp;   // uprobe associated with an underlying probe
>> + *
>> + *     list_probe_t	*pop;   //  overlying probe list
>> + *     list_probe_t	*pup;   // underlying probe list
>> + *
>> + * The provider-specific prv_data has these meanings:
>> + *
>> + *     prp->prv_data            // dt_list_t of associated underlying probes
>> + *
>> + *     uprp->prv_data           // upp (the associated uprobe)
>> + *
>> + * Finally, note that upp->probes is a dt_list_t of overlying probes.
>> + */
> As mentioned in my earlier review, I truly believe that this comment block is
> not necessary because the code changes includes in the patch accomplish what
> is described here and I think that sets up enough of a precedent/example that
> future changes in code should stick to that naming pattern.  No need for an
> explicit comment block to highlight that.

One more round of negotiation, but then I'll go with whatever you 
respond in your next reply.

I'm a fan of code that is so well written that there is no need for 
comments.

But at the same time, if we rely on maintainers to read between the 
lines what is intended, there is a risk of things going wrong. E.g., 
someone might come from another file where they're used to prp for every 
probe (which is what was going on in this file, making things somewhat 
confusing in my mind).  Also, the comment points out the important 
distinction that prv_data means different things for different probes.

The comment block seems to me to be a clear statement of what practice 
to employ in this file.  I've spent a bunch of time reverse-engineering 
code to figure out what was going on in some writer's mind.  It becomes 
clear once I figure it out, but an explanation would have been so welcome.

Again, though, I'll go with whichever way you say in your next reply.
