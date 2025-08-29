Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD11151991
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 19:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756496680; cv=fail; b=UvrPaH9/9TBEoP4I//nSjcqgTUsF7W0bkGSEttOHBDUaQmek93fXFkQpf7RMHRdkDyHhUcKKjlPiznx1NRUCw2+MxGi0zWs1qBKfU8FJCAE0ZUblcX5R7FeaCW5HNmfD4J13d/iuDB1U4mR24Cdk4kxpfEuFMrAvbMvhvlJxF9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756496680; c=relaxed/simple;
	bh=k/am1gjj7vyZUrTdA71ZwgSeZyAv9NPyZCDNCYUKerk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D+OdCzM3F7ZIV/qrxwUjpwq2fv3fHaG0IE2hcmewCu/5JcJ6vvZ4KIXmJ1CNPSb1FrfviRTypdMmDPXFWBETycAwuZoU5aW/4di5M9X2ZfLJ4A8lcHnUtRXM/8Qkx1+PhfXBHiu7ctDztXZETSzAGTn6IwUVJdd+SdgRl15I0KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XwTLflxf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xF3oCBLj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XwTLflxf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xF3oCBLj"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGg7xi024964
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 19:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=N0SAff6x+TBdaYDqzzYpIOl609wCmhu+MdTnZm/3vYA=; b=
	XwTLflxfoAegX0mEC5jnW7y84tTDUyRrDOyNRKcBdfj5LhVYwQgkr2eCGcYqOgs/
	xShjFROGQhNUYjZPapTCkD0pdNSz+ZGV3yTEUPnjkrpViaOouMPl5hhQaQZCbzjk
	aZXmF4pFRN9qBxM4mziO5O47JkzpC0m+F7qfTBBQoS1qMMct8o3Iw9R54PoRbCnH
	QHVPrO9MCAHuzHnkQ5oZfubMonAbpsxafwWU4w9Adz/uPHzsJneisB424R7yn3kq
	IkP9qP4Dhb1pLN4L0Qmd34FJcczU7u3tK6ut9LK49l0ULcYft6Pvf1Hpo4qXQ+jo
	rSsc0YG5m87e9pWPoqMyzg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q42tayv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 19:44:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57THTY7R005318
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 19:44:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj8ds1s6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 19:44:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSzlTyI38uRbQzw8Gv6hH2Uap2cco00XuXGmWRqmWCRRN8WoFo/Qfxl+ImiMwNGeP64FaOMIg5Qhd/suxnsQdtFygQUXkpNY9hnqTsAn28oJX+JyIcnSIZ3GjWQa9QmFWM3YxMZNEDWDdCMC+bqBKk1IFbXioT1C/f7dacoQ1nisKS82c73E4wCxHJ+S9BCe2uJ6K8SNqrkVdyPIfmyQ7EWxn0BI7ksm3Scsh1UUqfyQyppoitnSoZY0Sm5FPxFX5wAWNNOH7WyQPZ3GqhdMe6IDhwf3mmIw26Dq7zU+4jUS0DqMFJZui5S+0r4FcszleDMA6su8CCJMvP1bTJ3r1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0SAff6x+TBdaYDqzzYpIOl609wCmhu+MdTnZm/3vYA=;
 b=I1s02TpIEAe9QPdewXfLCNntHL3PfrA1SPmvlVBR3exZZgVZWnMj4TCiqfHOQ39LTL1jpCWhT5IR4w9MM5LnncRpNJQw9eFUEyR9Hi9/nN3yDih0VXeuQLbGVNzSFDlH3uKNrX0gFPlxYBp2k3iYq4ABPDC1tBbztmSA0EjMnFJXIef78KCZQzw+bogUT9D5PLppCWjAvQ0y5ZG2T2ZkPyinDswgveNC2FqeKjx9b9W/cQIHJRcCQtTJaktiLvbmf+N2+fc07gu6EA04VxuAHjYgFE5rlDGaB7Dh9D8Aia93jLM0sM1gJ22KYVHgBUCmPzuzEb1ODhl4kSYZDTNj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0SAff6x+TBdaYDqzzYpIOl609wCmhu+MdTnZm/3vYA=;
 b=xF3oCBLjKy9soZ82h/4KnmRqZggWG7fE979lt43QOq3Q8gEh25iZA7pWXJrMgkpQ7qipBV1ToUeYz9rSuT3C+BhTb09zdNN7wV1J1Kv6htXLKaorCQbmKR0eiEMkJi5tryyMfW9rgpwC3sgNHN61QCkwFuYu9Xgb5z1qXoKkyZk=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CO6PR10MB5618.namprd10.prod.outlook.com (2603:10b6:303:149::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 19:44:29 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::7d57:8572:5b03:dc09]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::7d57:8572:5b03:dc09%6]) with mapi id 15.20.9031.030; Fri, 29 Aug 2025
 19:44:26 +0000
Message-ID: <b316fd19-8d1f-495d-8a9b-94449830a055@oracle.com>
Date: Fri, 29 Aug 2025 13:44:22 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] version: fix DTrace version string
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567255EF643A5D1909C838B4C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <SJ0PR10MB567255EF643A5D1909C838B4C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR02CA0084.namprd02.prod.outlook.com
 (2603:10b6:930:ce::10) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CO6PR10MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e84b75-bc34-4892-b3f0-08dde734757c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjNwcGgyNVdqN1hTbWIvVEh5YTRVKzRYWEdaMmZNdzY0TERydjZOZEdmdVo0?=
 =?utf-8?B?aUc1Wk1vVlI0WHNWUWRVUktFaDM3SzhzampHSWNadHVqQjVWcDlVUDdMcWZo?=
 =?utf-8?B?M2xXd3A1dXoydDRmK2tlZ0Q3ZlFYYURSWTJNNUdNNi8xQnJWb0ZaQjVsUWpv?=
 =?utf-8?B?R1NSdkVyT05uK0NkRENJTkppV3o4bE1GdFkybjN2S0o3b1FjKzZrdmtkeTV0?=
 =?utf-8?B?NWsyZ05yUm9UdG1HdXJzeUp4VmRKVEtsaWFQUDF3eFphVDdDQlhzTEwzUDF2?=
 =?utf-8?B?ajF4T3ArWnVML1lOODg0R1U0WDIyTDV3MCtGNHNBRWhFOTkvYVRkNWVad3Y4?=
 =?utf-8?B?T0NjSTlMeC8vRk0yQ2tMTzFkMVZTcExkN2VHWDFhVDhmWmhtVjc0RTZncmM4?=
 =?utf-8?B?azhRYThHN1I2bXlMaWVkMjU1L29GbFhYVUkxeFp3dWN0TENHalBCYmFTTFZI?=
 =?utf-8?B?VmEzdzB1MUZRc29nTVJPZG90Smo4bFZoNE5ZMFZIeDZsRVA4WWRyZWRaZ3VN?=
 =?utf-8?B?VE5Sd3pqVUFYVkc0ckl4Rk5hY0s3RVQ2dTN4NUR3TjBTTG5jQjlsMmNoOVpV?=
 =?utf-8?B?T3RFNktPWjNMdnVLb096NTdLdTIvRDVQUnVqanhJVW1DK1E2Y05KYXF2N28r?=
 =?utf-8?B?TVpRTzN4aVh6TnN2eWQ1RExPbEJwYVlJUVZvbmhaSnB2T2cvOEovWnBlWWxq?=
 =?utf-8?B?SEYvMjc0MkY5NFlla1JLaC83WXFyYXZUcXY1S1AxUUFZMndNWDFuUnptRXNF?=
 =?utf-8?B?WVZUcCtOZkphUHFQa1Bxc2QyajFIZDNlWnBsUUhtWk10V1RReDlmOERGMUph?=
 =?utf-8?B?czFHTTJmS0txY0ZXWGlTSDVXUExRL1k5QndTQlp0SXpzNzB4NGppQlhFNGFh?=
 =?utf-8?B?SFl3NHNLYk05eXF5aklSMkU2OXJnaGtLcmFyNDU4RHBEK01WL2txWHI1L2dR?=
 =?utf-8?B?WGV1TEhzMGRFZW9Ic2FzN0hzTTdWcVJDVzZwQ0V0UzVQdE8xa0JkcDVrcHRZ?=
 =?utf-8?B?NlJ5a1pWSElLTm0vdVBkOTV3N2hWS0VWUXlFVys2WXVodVY2VEE2ZGxnRFBV?=
 =?utf-8?B?M29xS0EzcklBZ3NyVjBmYUFZZUlRbllnWG1TeFo4NEtudm1RWHdYY0tVVXlh?=
 =?utf-8?B?Q2dlWFVxRmpDeXM5dUxSSUFnQW44Q0NCLzhFV0dvdGZRN3c3RnFDS1hyelpW?=
 =?utf-8?B?MXhiRGxDMzJvZzd6OVBHcVlvMmtjbTgzQjEyeUR4d21WbXp0dkxLWTJLckd6?=
 =?utf-8?B?L3djaWUrTG1rcExDU2lNS293QnF4UVZ2Wk85UEpabkwxc1YyaVdFZGRidnpl?=
 =?utf-8?B?YUk1MU5hclM1ZlltRTZJMUxWRnlqNkpUL1E2UUpEQjFqYlZZOTJBNVM1NEdV?=
 =?utf-8?B?TUNQOFFwdVFQcFY2b2NSanF4dmFIdXh3OGxsRHZBYzhleXdkS09aa1lnbVo2?=
 =?utf-8?B?VitpN2g5eldaYlRFQVJnWFhGSUVkckR2bUk2QnIxcG53NUM0L2JodlpMTXBV?=
 =?utf-8?B?ZlBTYjdQamcxOFN2MkJiclhmUHdwVmV4UFcwdSs3emhnNiswN0xpM1pUdFZk?=
 =?utf-8?B?Uis0djJvZ2d4S056Ly9vbU41QmNBZjJsQktnTEpCK0dGVEVPSCttMkM3RnQx?=
 =?utf-8?B?bXAwYURNNENUOWdCS2sya0kyZnBTRCtKYjNBZU0xdnhlWjkzUG4zRHV3cFBi?=
 =?utf-8?B?U1p1ZXlWbWUrWXZGUFllS2s2WVZKTXdzWVJXRHVXMmZHTjdkV2V4c3hndndv?=
 =?utf-8?B?ZWdDZ2k3U3dzNjFIQmtyR2w4ckJDejRSc2wzcURzc21FMUhILzFpU3hSMEk3?=
 =?utf-8?B?azN3MHVoU2xWY09Oa3ZhSGoxMzFqTzVka21xcVhqcVAwWlFudzlYOFFjL3kw?=
 =?utf-8?B?SUJqQ3hXMktyV2VreDZpbk0wRE82SHdTMHRRWGE5RDVFSE84YkIySGMxUlFN?=
 =?utf-8?Q?SdlWE7ZMDVs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnM3V3V1dnAwMjFLbWZuNGVDeEczM2lYZFhlYmk3SWU5MVdxTWpjNVE1VlZk?=
 =?utf-8?B?Znd2ZWlpRjNTNS9hZDJTY2xCeHJuS2VuQTB1RkZwTm1tK05pR1ZzMkdQOUVO?=
 =?utf-8?B?N2E4R2Z6T3ZmdFYzaGdqTmY1dmhkUTlaN2QwM01iNlBSU0prZmNTbkNRTHBD?=
 =?utf-8?B?Ri9ZNFRoWlVZMzNxc0NlMVB2cnpBMEMzbi9HWmhYOXdHVFhReWNhcHh3VFRM?=
 =?utf-8?B?Yy9HMllUa2tCUjFGd0p0NkRvTVB4OEx6QllVOE1EeHVKRE01NnVhVGZ1Z2hr?=
 =?utf-8?B?TENDM2srN3owWWdoZXJZR1phajdrZTJ3WjJ6YXVEZFZTV1RqMlJvWG1MQTZK?=
 =?utf-8?B?am9qcnhJL0FyT2FGbS8rY0RSSzdpb3ZkT2FuZlU4RTlWc1M3ckNNZkJHMXZt?=
 =?utf-8?B?TVBTNHB3MytSeENlOTVkUE1aSkFXNEl0VFBwbkZCWk5yS0R3eVpIWENJQ2Nt?=
 =?utf-8?B?VFZmQnBpTjRYR0JpMUVaUXdYNmRsK09ucEx5a0c3bkVKcWcrR2NIdllFbUR4?=
 =?utf-8?B?b1p1ZGMvL1JUa2oyQk9CRzl3Sk9mTDJXSFA2SkxLTTl0QXZUWk1EMzdWNHp5?=
 =?utf-8?B?MCs5WXpiaGFHUkNabFJxN29xNVE1TkpORE94RGhUWktWMHNuUUJQT0JOREpJ?=
 =?utf-8?B?d01ZNllpZ3NvNVZsOUxpN2FYR3FJMUJTaGducGpmNUJzc2VXeS9VSVA2WUV3?=
 =?utf-8?B?S29yMGtOdE9McUsrb3gzWUFmRHExaWo0Ujl4VExVejhyNnc4K0Q4SGttRHVY?=
 =?utf-8?B?VUVqUlFxVVVCVm55ejhMZUhNS1pRNUR5RVVtMTBLNitXZzdyS3FxZnFDTnAr?=
 =?utf-8?B?VjVTOEUzd3JsOVI4OWxFYkdsS3hrbm1zb0wra1B4ZXAxOGUySktyWjg1WHlU?=
 =?utf-8?B?aDNFRm1vcVo5dXhmT0lLcFhLbCt5VUNXVnhhU3VGeWRFK0E5ekZQVUwyeGdE?=
 =?utf-8?B?OEdrY0VpN1RPeTNkRE10aG5nRm13MUl4TksveDQycW9kUklnNGo0d3JUY3R2?=
 =?utf-8?B?eXY0NVFmVmNWdEZhWU9XMlNRbFB1N1l4ZCtLMkQ4M0RGamZZWkttbWhFT05E?=
 =?utf-8?B?bzV1TUNlR1ZBRUNZenRNT0dPWStEckNZOVc4czNTSFBMenBXdkJKQ2U2NlRE?=
 =?utf-8?B?QzF3SVpMQklnU3Ewc1lqY0ZaUjNwaTFmY3VselV2T1FhQWZnT01SOW5OT2lB?=
 =?utf-8?B?cGhzSDgvc0ZhZU1ibEVrZC85TFd3aXVYcHhGM1ZTdGxhVkZEbG1idXd4ak9Y?=
 =?utf-8?B?aDZaL0ZQWHFQNmhCcm9TNk1TWTRSa3RERzBSZ3EvaHhwWERFR0xhOERoVnNa?=
 =?utf-8?B?ZityR2E4QTd2emdnM1NzbUdncWVsbmx4cVFsMDduek9XWjMyK0ZsT2doNUNp?=
 =?utf-8?B?ODhTZjNYMzdYVW9kMm55dm1QR1BGT0V6VkhuWGc5ZXdIakZyZVd2Zzc0Ky9o?=
 =?utf-8?B?S2s2U3dNRW5CYysxS2NiUlUvUWRhQ0xub2RLcmVJNHFpY0NJUWg4SWJBSkdm?=
 =?utf-8?B?MkZINWtKeDZTYUNjaVhpd2R2cWczOThoZENtdVZBcUF5alRaUkpqNEg0V084?=
 =?utf-8?B?dFNnbm5hRkVIeDFZaGFWQzNRNERpQTZtRHRSN3B0REpOTGpCa3UyU05IVTIx?=
 =?utf-8?B?Z2JwVm9NY3AxbWtiNzJzcmZiRm81VFNBTENYTTRSMG81WU1EU3ZvYVZTQkN4?=
 =?utf-8?B?eFR3YUdCWnB2N3Vhd2pvczhaRGRUb2hDYVZSUSsrYk1mUU9Kb3BwcTh2cFFt?=
 =?utf-8?B?RE5vdURNeEVFcXdwSHBKQjV2eVRKSTJJKzZxSVhWT2dlUnNua0pJcHl4eEJp?=
 =?utf-8?B?a2FwVGlGdnduck0rcExVOHRqSDhJWVh2cEttYkJMMG5RNmNldVBTUUJ1TVhl?=
 =?utf-8?B?WncxSFV2NzNtZDdGOVlsQnZEV2s3dWtYQVl0NUpldFhBRXVWaVk0N2huYVlj?=
 =?utf-8?B?L05wMktaSUdvUVFnb09Zc0hpcEx3elpsL05JOWgxSWJoUFo0U0s3VXNKVHQ5?=
 =?utf-8?B?UTd5QXhEWER6RUJiM0hQbzN6YkNqNVRvWWZ1eExWSk9pV3YycU5KU1BWSjNC?=
 =?utf-8?B?Q1NLQmpBZ0xLakt0WkF1VG0rUVlySVRkK1NhMU9hOFhkcGNoK0RIeDNQQkhI?=
 =?utf-8?B?VCtQT3Bld0p4ZTNnOVgyZXJmN2ZWdEU5YkxVV1kxU3FHcUNYWjBwY0xrWUpI?=
 =?utf-8?Q?PlX1ldBQWpv56741tzTG9bo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MgTbt1DRfru/jdKGIKVHsVTz8j2ToK8cBvNGmXCE2qtLVjfREamg/FKejQY8CPRursWplbiEgqsVFjxEayd8L8Np6dxvkc2qV55q1Ui+4w9VW94RNxPpZStr8idDgB6oo8ujLyfczuahNybCAu+7sl7xeCtUcW1R9X+2kYHifMBgKRhmLSLnSmSTU35nP9Q3CsQpJ51Creit+gxZwlK1Y/CyLBCyJZjHkePd1rrQaqtVYInlt5TRvZfitrquroEJMV5BN4iZbAVRWiTsI7AJBy+fMRx/5wjXK4skd0Kgtzw0/fGFUaUaXOvdXJ4LkyVYwfZQ5Qi+BopMdzt98NgS+Enf3ikgK3VN6ACXTDjNx6gXjuFUOKoDrKaafqta5hIGzEm6NNcsSJoJMI6bW7h4YV8MVQiQ+7lHjEfhG78iIh8wbIARoKVLZn68U0HM3Bve9ffOSBx20+p8LMve8vviNgbh4Q0cITLhpW8Vm0MlgJRjxYL9UR1K4XbsA6fjUWO6jHeQ8AQ4igC4OUtqXaF35RG0n7/V6AWsAT0txY3fV/7+1gujoKXw7ItRFMPI14g21xFwdXVYLRXuTrzYI0Yc+NROppYHOsggwlqNmdvDINU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e84b75-bc34-4892-b3f0-08dde734757c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 19:44:25.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rlnNkvSgSRmjax509uYT+e2HgZABW+VAsAlQQBvNkBKLb+6WzsULGBpsD00TkrYozctFKEzRYKoiY1mOxQOnpUffhLRxhqGQR78CN/k+rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5618
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508290176
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMyBTYWx0ZWRfX2NP1FJYJUE8d
 2eXHIMFMcXw7wOWLR2d3sAHkP9pw4/3XFoq3WYtChCroNMp3jn3sFeUJmyEJ224GTDRNukNuVlm
 SBOJFcooVfPefKmb4FNIE2ohSzaOBLxQ4cm6cj3j8zy4+53XyRj/y6VBm6cw9fHVyp6LpEqBgTF
 baG3XCsc8UJ0FyibjekUW2s1BrMAWcPM7ejJnc3MGvdvDmuh336JSck8yFpWx7kww6h0mP/C3ac
 sy2XDIwabhc/Hhi6fb2l4rTWUFemctWOQq/7eeTuivfp5dTruiKenx++oih983ei556mdFYdDBt
 jIhTKDnchNI6aSkNlLFZ6eSIndnqg7faIVecMa8Nq7bH9OIeIZye6jcXYAxYDwhC5qhNCTi/ZGh
 pkszRAQeCXQ6y9SM96u/e70JssVZLQ==
X-Proofpoint-ORIG-GUID: A4BOqWld9956a-n5ENJ7zE8Co_HCS1re
X-Authority-Analysis: v=2.4 cv=RqfFLDmK c=1 sm=1 tr=0 ts=68b20325 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Jow29JO1LrjFIbGZs9QA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12068
X-Proofpoint-GUID: A4BOqWld9956a-n5ENJ7zE8Co_HCS1re


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 8/29/25 12:45 PM, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/Build  | 3 ++-
>  libdtrace/mkvers | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 3540d1c12..51ab0e4b6 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -130,7 +130,8 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
>  $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
>  	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
>  
> -$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
> +$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list \
> +					  $(libdtrace-build_DIR)mkvers
>  	$(call describe-target,MKVERS,$@)
>  	$(libdtrace-build_DIR)mkvers $< > $@
>  
> diff --git a/libdtrace/mkvers b/libdtrace/mkvers
> index 82295b152..6f9240320 100755
> --- a/libdtrace/mkvers
> +++ b/libdtrace/mkvers
> @@ -59,9 +59,9 @@ END {
>  
>  	if ($3 == 0) {
>  		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
> -		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
> +		printf "#define DT_VERS_STRING\t\"D %d.%d\"\n", $1, $2;
>  	} else {
>  		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
> -		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
> +		printf "#define DT_VERS_STRING\t\"D %d.%d.%d\"\n", $1, $2, $3;
>  	}
>  }

