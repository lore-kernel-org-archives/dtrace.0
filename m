Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16891E04A9
	for <dtrace@lists.linux.dev>; Tue,  8 Oct 2024 22:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728425734; cv=fail; b=ugM/oJQAPqZLnSobQGNxU8hBstbVoOVOxyraAaw2zb9zJvNNIHCND+B6wNfLcielArvt2jd+W3Se/It4kpGhD8h8lzgNBElT/NPn/+jbSrfvDw/JitJZHLqeGtvVEBv7XjIs+DV1/L0gqyUT8Ib+16wu6EhYZfCjU2R4PAedFRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728425734; c=relaxed/simple;
	bh=j+q5MORb5E3VW5zH6U4926rWHgjs9qN1dqmGEMW7rn4=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E8YqJjnk6QMfcc8fZ1LYtLjdT6NbTQYSBgpju8sGN69SBDMi4DWYHQmJuAUvbQ4VkxVq5lwcZj+Zz7pbI4B6ofbV/wL9d7q7jNbwA5JsMsAa4tNCr9YY38+/oeIJ8uyR+TcijD+cZhzKa4Q5hqQi7a4rpfIRuyZnZM/19EYsymY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VIgO9ArZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tTYLPNHq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VIgO9ArZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tTYLPNHq"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498Jtbtl007573
	for <dtrace@lists.linux.dev>; Tue, 8 Oct 2024 22:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jIUNeSsPyIEtDRZSMlCDgvfhNNqZCzOiyp3Yquqxsqc=; b=
	VIgO9ArZ2PlAYmnWJU1ohZk3SYHKrxdTLZQKuO4/0DRv/h2F+NZ79oShooayE6UY
	UngWzhh9rNX95AV0hJUtnWspqnbt46yDTspCouxBwb6pluFq4HJJB38JaGGd3dL1
	LBJVsYDYFMMlgBEiNPoAcRp9ELp3fEllF6PxavYk3g8TjiIosPpqF96NODy7HT0o
	1ekg0NFG4afbEoy2BDKe0PiqGDq4T+zkNg+9ZWE2tVtCiXrYfcRTy42xXPW5WcRq
	madPUf9ly+KkF59bhOx3pG/NpKtg5vDbMztu9x7YyF007o2xzQfJ1Qd1QGjyy/yo
	uHb+NGvg/r/geK1+/Gg8Hw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42303yexdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Oct 2024 22:15:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 498KxaaA031170
	for <dtrace@lists.linux.dev>; Tue, 8 Oct 2024 22:15:30 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw7tqjr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Oct 2024 22:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUwOArGeU7Ay7DxVeyOsr04mFt5cs3cBj9PTJVld7GPDyAXj36pKf29LamavpK+cUneBJOyaPEE/6ZaXzcnMXk5IGCaO2nNHv6EDX41YLEy+RvpHD+i7guib3BqgKTuAKV1+ikXRlBJPqatJus5m/dz6zNJk23xs6kW9lUzeHUh4P87TrgMkC0oSiX5vxpr+N3l2+eCZGMilpdXXhRq1PXArhZk6sjKtxDkO82/b/laKBJPd/QIRU3oelpwlPztuLx9MtaTEURCEmo+Bpr3/izgSaGaROna20fZq7+CaE/5fNlOaov7pzq9/A1RLvETAYr40eV0VkbDN8AwVLgbKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIUNeSsPyIEtDRZSMlCDgvfhNNqZCzOiyp3Yquqxsqc=;
 b=kk2Ro6NIQCBhUDyTDuzpDwOkbu88JghvI8H4XrvEe3ynWRwCmiZjqI1VrBz4PsPaokv1gDPUuyk+OJkoWjJNJbPI96IMvcv+pwrtk1nGFVAcm9KGcthA3Vycph+gZOKc1UXFZlsgQN1iWKEsqPcLFlbzvR+Nr2xLEYBA8JNqPGy6DbH8HAiQT3lrEE9AhEfhIIds07f8SldR2i358InICONUY1BOJ07RFLRHT1oFMcJ2dzfEok512py1fMQeBBptH+t70pfFAamZJeSSWw6BHk147OC+MAfkI5eaHjkPTv6yLh7G4EUTgpdiJO8h5vf1Mi4b+sqrK+t7MHecCIy+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIUNeSsPyIEtDRZSMlCDgvfhNNqZCzOiyp3Yquqxsqc=;
 b=tTYLPNHqLxDnE6tj9N0jACWI/Qo1CC//bNTkzLsqHlgcJdZxwwERBG1outgLOdmnOpyEbmlpjMOdbadI7WhkxBfSBnhCIfJuIQp3ngVoMItQriSCKXDDS23aKb1ffi/2BgMZnf4eMCxkEtVkyI9EfFS5ZnY9g1PhV4jL79T7FQw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY5PR10MB6167.namprd10.prod.outlook.com (2603:10b6:930:31::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 22:15:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 22:15:27 +0000
Message-ID: <78d9f9e3-212a-1e71-3506-ea3553254faa@oracle.com>
Date: Tue, 8 Oct 2024 18:15:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 12/19] Increase size of BPF probes map
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-12-eugene.loh@oracle.com>
In-Reply-To: <20240829052558.3525-12-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:208:32e::21) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY5PR10MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d17b6c-5d7a-46d8-b758-08dce7e6b657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tjg0c1J5UE02UlhMOGhWWHVpcFdnS1pKZ2xmOHcyVFVhZE4vOE80WEVwUlpj?=
 =?utf-8?B?Z2tTN1F5RFkyL25WYjRuVDJUeXg5UitBamtPRHpvSVhXSG1mRkdJSmZNR3NG?=
 =?utf-8?B?N2svWDY1RnI3V2VidmU1YWRnNDhoc2xaekZUZTk2N0hkUmZCd0E3cHJkcGJw?=
 =?utf-8?B?VTdkc1d4VFkvb3Nsd05oUjd2S085L1VwY1JDa2p5STZNSjdTVUVWL0VQTEdn?=
 =?utf-8?B?bGJpNEVCcllld1RnVHI1WUw0eHp3SnFsdkhjUkNROFo5UXM5eWJzZUdLQlV2?=
 =?utf-8?B?eHNqbUp5dDdUdW1OK1ZrM3lTZjcxejhMM1BIOGNDTk1MbW96YjNTS0NGV0ps?=
 =?utf-8?B?YkdnaVdSbFZoT1ExU2FlOFo5ZWszWkwxcXdGOS9FMnpZODBFZE1TeHZsekVN?=
 =?utf-8?B?NlBRWjRTQ1hDTFQxRkRSTGVQTmM2dEpNWFZhaW5zTlR6SU5WU3c4UEtrVTN5?=
 =?utf-8?B?a0tqOUc2RjNlcFZzMTl1d1dVU1hFdDAwbzI0a3RKS3kvcFFwWU1xUGs4NFR4?=
 =?utf-8?B?bkpuSU94VEEzb2tPSnMvblpBbFA5Y2d1S1J0MGcycTlaY3NncXJXTVlEd3dQ?=
 =?utf-8?B?SXVmVTlHSHpPWFRQYTRlL0ZFbXF3eWQ3RmVkTnh4OFd5TTlRY0FVSm9OV0Vs?=
 =?utf-8?B?R1lPZ1ZkSE44aURkVEN2MDNleU1NUmlYZnd0SDFrMGtXdGR6TXdIUi9NQytW?=
 =?utf-8?B?elpBRWYweUtqRUhjT1lRenAyYTY2R0RkN2c0bkF5Zkd3eFlQQXhFd0orZ0dK?=
 =?utf-8?B?akpvU1NnV2ZmQ1F1RHM4czE1WURCMCtUNnNvMElCMmZVeXBXU2pYQXh1Y2tN?=
 =?utf-8?B?ZVJHV3hyMGVJeEFobUQ3MUJpelJRNWJrT2IyWTVEK3ZaTHUzOVFxWE1qemww?=
 =?utf-8?B?ZmV6eEZKSVJBTC9vNStkUjlmc3h5dzRaR0p4Q045cjMzUlJrRFVHekRkNVhR?=
 =?utf-8?B?ekx5QjlraXF0S2dFNFlrY2MwTmo3K1Vmc2l3NDBaYkVxelRBRWNGZ0drdVVl?=
 =?utf-8?B?blBEbjFMekYzWTFWc201SGFjQXJ3T2hnYVpDM0o1a2NrdkZRUUZKemZRZHVF?=
 =?utf-8?B?dkR2eHpCK1U4NTRvM3htVVk4Zmo3WkRUV3M3Y3hmWjFxU1NjMXk3M0FJbDF3?=
 =?utf-8?B?Q2dacUdleEVhK25sREtFNkZqYnd0NDZNdGQ3K2lkS1B2cUhjTkZReHVhb01n?=
 =?utf-8?B?SGdxV0ZtdkJ4YmdNNWxCV3dNSmI0MUNKYkgxWGRpRGFvNUJFblhmRXhkem9p?=
 =?utf-8?B?RmxsK0FJY0s0cFJWTUZ5MUM2MUxMRjFqNDM1MnhPZWt2S0FSdVZpMEhvRktr?=
 =?utf-8?B?Ylc5dzdJd2lEMmptQTVKR0dLWE5iVkhKZnAzYkxXZlF5cUlPbmwrbFpESVpX?=
 =?utf-8?B?THBndlYzWjFSV1IzQ1FJYjdqaFZiUU5KQ25EckFWdzF0S2J2ZUtETGxRd3NB?=
 =?utf-8?B?WDRoeUUwbm41UVY3WUI2LzdUQUNlSlQ5ZHdYLytkN2FPbS9Zdk9wRXVkS3Rn?=
 =?utf-8?B?c0FxNk8vUmxpUWRTdlJYZ2FpVmRMQ29FYUY5aStlSlhxVWZ3TTZRblNLRERY?=
 =?utf-8?B?L0dsaW9ZUlNMTDJBYTJHa2NLbmFjcWExUWduRXgrdUovemtMWnNDQmwxQ0Ft?=
 =?utf-8?B?cHN6b1lHaVMyZ0pnWUdza1dFZ1VUZE5IdHZuOVNVYUlEWXBUWUpMUTZrNlAv?=
 =?utf-8?B?SSt5ajVQejlIVWFaa3ZXZ2RDci9OWUZNQjVnUDBTL0dWam9tNVVoZTNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVhRZGpGTUVBRldjQXQxdCtxcVFqS1hZMXZkTUxyd1c3L1hodWpkSG9LZHln?=
 =?utf-8?B?OWxnWXcvSFpFNHJaYlhrUmRWNGduaEpSL0pvcW9idmNER2xBbzVZSlpkekM4?=
 =?utf-8?B?WFlmUmFoOVo4YWtZdVJzWVFURFVHd29sdzhyeWphS1VuUVJXaitjN0ZTQWIy?=
 =?utf-8?B?QnVLc2RrUTdyNHpVWHFRanU4VC80a3pWMmJKVlF5dUhEL09xTFVuTERNU25p?=
 =?utf-8?B?VnREdlVpVUl4L3VMR2sreG9MQkE5a3BzOFlJWU8vMTBuanEyV3Y1QkFHNmJ3?=
 =?utf-8?B?aVBKS0FZa3FwbytNbEdxTlBDWHJBdS9hcVNsbzJ1NXFHUFVwRjdLN2dOa2JP?=
 =?utf-8?B?bVRTcHJGK0poK2luUmZYSGMxd0RVUk9sc3d6ZEJMbkxDbDBYdmQyc2VaK3pL?=
 =?utf-8?B?RE9MV1ZUUU5MMVd5aURhOFF1VjBvWGRyR0RXbDlIRW94ZXZISW41WkJLcGMy?=
 =?utf-8?B?dW1iSU1DY3kxK0RIcEJTVml6eitqdlBBSWRRekQ1cnJBUkRHK0hHYzFqcXRa?=
 =?utf-8?B?YWc3Qmczb0JwTE9kVE5LdHg3ZWtOQTVyU0FpYkJWWGw3UnZGV2VkRE9KYWUz?=
 =?utf-8?B?b0NKUzdYdlp1ei8zZUhOM1JCYmd0UERRL2pNWEFFZFJUd25qYmJ1TWRHbERz?=
 =?utf-8?B?RnVkbzJIaEJVVFFwWUpmWFVHaHV0bUpmaWJvaEZJUHYydi95SUorSE5RNzBZ?=
 =?utf-8?B?RWVGY0NCa25Xd3lRcDJjckJGY29yZWljN2lDcVFXZ1g3UXg5NGUzM0pFb0da?=
 =?utf-8?B?Q2phd0NWbnBKR1hkL1FSVDcwbXpzOW5PaEx0Z2lLZHFRNCtUOXFLb2ZibDN0?=
 =?utf-8?B?Wm9kdWMxVi8zVTN5M04rTjEzNldZQ1cyUXhKam9sejZBazBPYktnc0lTLzlp?=
 =?utf-8?B?UzVrZjFGZmkwMlZRS0Q4K1ViYzMvcW44OGZqbjlBVitZeUNHWUtEL0FrREtT?=
 =?utf-8?B?MUpHL1l6Wkk1NFFwMS9mWGFweXlXZHQ5dnB0T3U2K2wzL1FPMmhwZXpmMVIy?=
 =?utf-8?B?VmhZU0psM2JSWnJxNEhLcFdoKzJoRDRqbjZ6MHpDVUVDUXk0MGxrZGJQSEZl?=
 =?utf-8?B?T2Voam5VcTU1TDBEYStLZU15Yzc3MVMrSm11VnJJa09lbXN0a2F4eS81M2dq?=
 =?utf-8?B?eENjK1BLTFltRVFWb25KZHc4VE91WHVSTFJoSHdyYXFHS3JHMGJvSDFqZWdX?=
 =?utf-8?B?NG5ibVVRTnpxVXNhc2FlNmkxVFVkQWh2Mk1uSmkwdVN2V0ZVWUhka0M5RlVQ?=
 =?utf-8?B?VWtuMWRVY1FsZGFHR1Uxa1hJMlEvQnBZU3o3eElJdkV2aGtEQVFjRWlaQ1Fl?=
 =?utf-8?B?TmdtRjhhN0pZb0x6V2tmV2VzaDgyUG4yc0lNdmZyR3lMV1hHblB0dVVUakRu?=
 =?utf-8?B?TEhmZWJVZWw4a2IvR01sTkRIOVB1cFhVOEpWV2xyTGxxYnVyWHN6eGtyWFd0?=
 =?utf-8?B?VlFDYmtWTDVwQ05QYjZ1UHM5Ymh6eFRYMHpDSjFOTTVOdTRPd0JqVUNPNFRl?=
 =?utf-8?B?bGhqcElSZEJBbkcvV0lObGxGUXlDWTRNSmcxWlFyeW5kTi9keGhOZ0d3emdK?=
 =?utf-8?B?czNrWktuaGovdkJZbTZHSnZnT3AweHc5cWlsbngvd21HTlNGYXBxZ00yQ3RI?=
 =?utf-8?B?NGdiaXZ5TVJaaFVGemlwTzFlNHl1L1M5bkNGTWhKS3NiczU5ZkRoUWZYYnhO?=
 =?utf-8?B?T0pRc0Q5OHkzZ0lnRmlNRDJnM3d3eXpjUDM2SnE2UnJOYktDaCtsTUhyZ0RB?=
 =?utf-8?B?Z0ZLWlkrcnNYT1FTZ1dlTGY3Vk43bE5Pd1ZOTi9ZeVhyU3FyTVVVWExET3k4?=
 =?utf-8?B?MkhSTmxicmFFQzF6aVc1aHRyUkd6VWV0RVZtQURLSVR4TFVFTTlIU3VnVUU1?=
 =?utf-8?B?dmY0cWJ0S1Nad0VZaGRGVXkwU0haekQ2WldBM1ZnRlBJcGpTY3NsY3Zmc09F?=
 =?utf-8?B?dGpEbFpTb2JTQ210K2dNQlJVUnY2T1lmWnZwMHhvcmlxK0FvVGFEUjNJSkRD?=
 =?utf-8?B?WjFWUVJraG1ZemYvZDRJTDMzRUVocHdvSEwrVlRHV2JXcjdCOW5zbGR2MTl6?=
 =?utf-8?B?MXM2QW9ZRDdIZEJ4MlpWMEU0bHVhSzZOWFhzMzkzMEQxVlZVc3IvKzB2NE5D?=
 =?utf-8?Q?S7xsgcd5apDIsY+/B1G5T3Y6Q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QC68fae1NrvN2y1doIFJuAjySo6UcoCgHSfITW0k454W/diHKBPr0wioxsP459KoMWC84kl7uCz5tR8qJWnZp33WFglfcjJZX3izuDrV2i3utPCzDXYS+QfE9+wATb+Di008wvtcpEyuPenvUZYB+M1R9DZ0cQ+oLYOUUCa/MSLQKPeFaWg3OhVLOm0OtzgbP3XVrk1kxqm1n+ivdCxCe8jW1OnDVPdM64VdLJJoIO/EuyuIj60cPdKC6H53YBDG6YXlpdKFzZDLiKLjHSbgqc0FIVTVyWFImSx/Den9s/+wDW0azoztPVf1iSKNYovsVJ2A2HuHRpZRzG4aTSD73clN+CpXB6diTnHL/u81V85kUt+cWPrNlyN4JLCiyBhhf3xlK7IIV8DOLO8p9lcuwS3WUmLZ4xFD6+AvIHE1+BXcVdNELfKp26bCNAiieYxivvx4EK9AytE5Wfc2Abffaeu6WZ+sTlmzU9Yd6pLMpaPJNmzoRVLCIJc/nmTIAOkDhZ2Bx++q5Vb1rAV9BEpeW4+BBYGHwTCr3IwHADlWSodFGYpxRN8TumzY0x8FpOccW0vzi0Wvc81sGIWBu9UI+vpoxF2ZCGh4N+4WBkSKK74=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d17b6c-5d7a-46d8-b758-08dce7e6b657
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 22:15:27.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YGuWEYNnuPLfOwe+NPipi6xiGQm2yxF8ldVyQkQY4TEFqTsSA+EkDwoWm46NKOwAKWTQcUOpjx8QaYPMYLCyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_22,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080144
X-Proofpoint-ORIG-GUID: 4Dl3axvLQWC-db5Hwqjd6DfTzACWrldj
X-Proofpoint-GUID: 4Dl3axvLQWC-db5Hwqjd6DfTzACWrldj

Just to be clear, this patch is (thankfully) being withdrawn. Whew.

On 8/29/24 01:25, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> We are going to support discovery of new probes after dtrace is
> launched.  For example, there could be a pid or USDT probe with a
> wildcard pid specification that could be matched by a process that
> has not yet started.  Or, a process could load a shared library.
>
> This means the probe map will have to grow.  For now, just wire in
> some headroom, as ugly a hack as this is.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   libdtrace/dt_bpf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 70803e3c..75e48962 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -920,7 +920,7 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>   
>   	fd = create_gmap(dtp, "probes", BPF_MAP_TYPE_HASH, sizeof(uint32_t),
>   			 sizeof(dt_bpf_probe_t),
> -			 dt_list_length(&dtp->dt_enablings));
> +			 dt_list_length(&dtp->dt_enablings) + 1000);
>   	if (fd == -1)
>   		return -1;
>   
