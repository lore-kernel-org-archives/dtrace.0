Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E09337119
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576271; cv=fail; b=FJxv1ciD7v6dmqWwM3nYxZPH4RZB7TtCvObs9VOzcUXdA8eEMld3fUBKZMATrketKJqKss7vrKV5jn4lHyWdAmEGhvfSP17opMMIq4nGYdsb0/GrT0kN7DHZgo8XD1Buamaqp+8d0eXZuRbJtZr5PwyfZdrWgowgOzsaPXMaXA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576271; c=relaxed/simple;
	bh=keVU/IhP2GPrqbjuGc75i0NcGMbJGMlRWgFXNW6Wbrk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=loqmMrIa43ChfKRN75/UHRULcEUUsbVyqkLqmarbLoZdCmwGbmjoRIV7A/actFqYclN67S0pmzE4ACUuzpmLXR+xkaS11x9rPRRAb4ZlSVD1e9Sh2K+SwX2oXwyfiug6he5ghdCcmY85aYqq+x5Ac8tj4p6egyM0a3pOe8Qyu/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qllwBQV0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yXweefHG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qllwBQV0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yXweefHG"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GE4QpR1818350
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HCTZ1kYzTBsFuK7Igm3j/PJDzXpHunNl8IfmRpNtm6I=; b=
	qllwBQV0m9lUiCa7/pmjdB5SWH927GoX33VC1TFgIdRpO+rz7fDmSxwpXFlLTWXF
	tGxW+McXEFfXYiorvqPXFpcgLQrFWAMCjOLYG+3KP+xwms77+kEwcr+fR5D1UrA1
	KBbCJwQxrJNheuHYmnHgqs3rw9RNaU+g0SdSb5nbVlKx4Odz9mmeJJM9hG9bXs8k
	RzrqyLzRbxFQRqQQcQVm2fKMdF39AOn6cc7K3opM1NukNG9cdx4qmkIRSBAaTRXZ
	zctaC8OL2jflygfvCaodDeLk4quSEHyTApt6G+k7l4nQ/WZar37ysk/Mdd3eUDMB
	3Hn6EwUzsT5Ft+bG+RYB8Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp59r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:11:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GD1kM2003862
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:11:07 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7d05h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6VTvzOMd5VqPwgyYm4YB8zEmqLnsPS+inVACEJjgu73extum1USr5/7fSykMPz2pzkW4qmb+NdJ5M3AnMFhJSWUa0voeb5JKgZ4cqQba/ND1v9uYBTDuvgINLkbYVsKCrEFAbvO32cPJMQtA09W0pCiq9DHFWPYgqI1Pri2Ny3d0SuEcfkOLWyDXUcLEHDStKmd9ONqw86sGieBmillaJSZtCL0bSUp2DpDve+cSxSarvrAdqJaUJyWlRRtfX+Re+QeP3VpSK/kSFlTRW+F7DWcwftPmFkGK3LS+xEKM1NVkroYvFXNcE9pJp9tMcPOr5d+X0W4/BhMA9DOrPwRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCTZ1kYzTBsFuK7Igm3j/PJDzXpHunNl8IfmRpNtm6I=;
 b=CN9N46Dk1BKAkhDgXXUc3Le7kedKpeXKek0Ty9AYTlGGrvdjZ54U1jOpV5GW9Jn5Bx6MP6wYCwGP4b+mTUb3UiuCwQNksjwGTFSKkORy4MXpge2KiO0NidmugPRNoEJmx9uoMOuRok81mVZkP9Rh7tOz9L48JcbN6lmDhc5KvjxuXvF9iARh8Gf5CmCxtg8q9cbKB7aVx1amohIQPE6dWpR+YKfq4w1e+gI7/oqn4Pq0upK2tCfoF9Cq5Shq3I3aKf+O3Ox0rA57pz19Jh5ijarluAjLda80K7qM+6Zs/g3eHcupnbPmRVvSd3qRsbPuRp4YumMU2Du+vh1RTCMrww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCTZ1kYzTBsFuK7Igm3j/PJDzXpHunNl8IfmRpNtm6I=;
 b=yXweefHG1y2yrorLJFlCySHbIhWj4aIUm/+Zm/rlQCd8EftJC+jSP0rfqlc1LyO8cmk2sewAQdkoNE3BP2EEZwgozLS2N7XfU9kEafBc1l0T9Eg8qMayg5Yg7GvpK8FwogURRWOQqtJ63wA0IstMhSAcSADK6lrjv/jJnq30Cyg=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 SA3PR10MB7021.namprd10.prod.outlook.com (2603:10b6:806:314::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 15:11:02 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 15:10:58 +0000
Message-ID: <b1973c8b-09bb-4528-9339-28110b48976f@oracle.com>
Date: Fri, 16 Jan 2026 15:10:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] stapsdt provider: simple system-wide probing
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
 <aWpPxsFlQgZ9M49f@kvh-deb-bpf.us.oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aWpPxsFlQgZ9M49f@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0257.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::29) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|SA3PR10MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bb9f25-a584-4654-6d01-08de5511740b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUJrdjhJQTRLbWlVV3o0SFpJalp0QzBROWpzazJpOEMyMHEwdVZnRHJsc2Mv?=
 =?utf-8?B?VVFuVkVMbWE1WEZSVzQvYzRpbjNja2VDM2hyU1NZN3pkeUd4M2dmMDhrT0sv?=
 =?utf-8?B?eUhrZGcxaDZlQmM1cWFSdVJXbWxjWE0wUjJHQjJRK3dFcmsrbjhya2JrYkNN?=
 =?utf-8?B?WnZubHBNQWllSlZHeGpjbW9QbkxDWWdONENUMHVrMkpCdmlpWHViREQwL0Zq?=
 =?utf-8?B?VHZhQng1UU16aDdWKzR5VXQ2U2YyM3R3UlJ1ZWhmd2tVVEZpNEFpMDdxZGxm?=
 =?utf-8?B?T2ZFSjVQYVVGL3lsU2xlNmt1ZU5IdDBFYlNwV2NDY1o3b1I5MFdibmZsaGFl?=
 =?utf-8?B?Y2xSNHdyMDVNRVVpNjZZOVl1eFNNVm1JMnpKemxxbmovT1l1aHhieE4rLzdV?=
 =?utf-8?B?L3dtRlVoSUtwV1AzTEYvTytqZTFpbHRDVjV3cHZoMys3T1NVZ1p5ZHJCQmVm?=
 =?utf-8?B?MTI4SDdSZmJEam5IazFtV0JWdVg1SXI3Q1pZZHpueWVqYUNtUm1vTjl4TmNw?=
 =?utf-8?B?ZVk2MmVtVjU1YUNRN00xM3h5YXJGQ1lOMjZSdEsyeW8xR3g2am5CZUd5TjRY?=
 =?utf-8?B?U2tRWDdhTWRvTVgxYlJOMW5NNDgwc214STRPQUp1ZHVXUmNLUmNISWJqMFhO?=
 =?utf-8?B?TXdTc3F4dldtci9yMmxZWHpVSXJTQmp2UVpLN1ZLdyt0RU9jeWgxejljd1M4?=
 =?utf-8?B?TmRpRnd2Vm8yRi9wcFJsQWlPK1JRRG0wdlI0RnVtSFFhMkt2RkdMWXQvOHJo?=
 =?utf-8?B?SEJCRzZsdCtzNTdwdHJIbVRaS2l6STZBVzBPZTI5TFVNcmNhemxJWkRnUGx5?=
 =?utf-8?B?VXAycmthcmIxcWRYbHR3THlIVUw3Rk1XT2o2Q3JFdmNORGp1MFAvU0p4bHJk?=
 =?utf-8?B?ZWIzMmZJdm9IZE1hWFVCUndTZkRQUWlKMnZOVFovQlVTZEd5L3pzczB1S2Vz?=
 =?utf-8?B?QUNYNm5Ud3owZHptVnRERExLY1hwZjczVnpibHFyVWJLOEtWbWNFZWw1K0NX?=
 =?utf-8?B?MzFqOFdVM0NaZ0tlVFZrejl0MkcyOFE4ZlZGLzBTWHMrajJhdTZRUHV2THZZ?=
 =?utf-8?B?Y2RnSldoNkZtWUsyT2c3SHQzN3QyMGNvQ0ZFNXFqQ2tvM2RwZFhyVWpLVnpI?=
 =?utf-8?B?YjU4NVFqZlFqM25HOFoxRFFlRDU2cjJZbjJTQXN3a1Z2ZUkzWTY1d2V6SG1W?=
 =?utf-8?B?WUlndExZVDVMREJjWTFEdFhhVDc3WnViS0JXdGdtSXV2Z1RUZllvVlVPbDQv?=
 =?utf-8?B?cmJHTDI1cytOcWJNRVpQdUlaSnFIWHdOYW5XNjF5Sk1CQXgwSHdYc3pERFox?=
 =?utf-8?B?MVpVVkFqL1dBM0ZzaU5nazhKZ2laaGxTTXFaOHgrdnZxYkF1NjFZdStHL0l0?=
 =?utf-8?B?bmg3dnBpekpBRWpkTlUrcXloQ3I2QVlIbWdGUlBUR3htUHFQQzdJV1RpZG5w?=
 =?utf-8?B?Qi85K0IvMGR4bjVnbzJWakc5bkxrQTArblFKU2oyeXVkbXJmU25Wa2k5anJE?=
 =?utf-8?B?MTMrdHNXYmFjV25ZQUEzYmM1bFEvN0NZTGtRQVFMZ0xhTHU0TzFYL3RqQWhJ?=
 =?utf-8?B?T3Y5WVhtekdUQ0xnZWkrS0pzQ0h0NW51UEhPcGpDSEpwR1hRMkVRMEdia1gw?=
 =?utf-8?B?YW5SN21NSFZrS0NVRy85OUloNExYbDZJME01dVpNeU53ajVHQjR2elMwR3R0?=
 =?utf-8?B?RVFjRm90dk5Gc05JdGg0N1V1eXA1L3gyUGpZczZCQkRJOXlTUTViNlVCdmY1?=
 =?utf-8?B?UWYvNzNVTnpKT3lzVXRXL0JkMzVnREpOckhocGJlQ2hpOFpvc3kya0hSZWl1?=
 =?utf-8?B?TTJKMHo4VkwyUmNGaS9QRnEvSFU0NDVvYUhHZlV2OWdYOUl0S050N1BiWmNS?=
 =?utf-8?B?VEFMRDMrVVJ6a2tsU2RaYi8za1ErajJ6RUJwYmFwU2VHT0VLYUhncEhHY3JE?=
 =?utf-8?B?elBVcDBUUG5YUG9wNW9GbnFrVFRmRzQrZ0VBdDh2YVgxNnAxcDVPNzZxUkh3?=
 =?utf-8?B?dUpVdTUydlVQMmNxZUR0RncxUEc3ZFUxTjl2eHpUQ3d2ck9mWVJyc3dTOXNm?=
 =?utf-8?B?Q01pY1k3QWhYeEtMckQrZmhQM0s4b25LL2s1Rm1sT3lWU1hOWmlDcEYxSHBh?=
 =?utf-8?Q?prvE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmkzR21FY1hNdElxTmpDNlFxb0s0Q3lBcUlKWlhoRU5MZDdRMGZFUC9uZ2hQ?=
 =?utf-8?B?MjdlRUtnY1g0RVR4YTlxRDdkTmhrOW5Pc3VNSC9LbGc4U3RIZU9Ed0hsOGQx?=
 =?utf-8?B?UGdhYXhrT0IxQlVWNXJBd0FGZUYxakRiTlpKODY5Sm12RnZ1QXFINXB2RlFR?=
 =?utf-8?B?dzV0ckxWdWdSaDVKenZaME9GSWVzTTBrSzdLa0Q4aERFRG42MnpjWXo5YVkv?=
 =?utf-8?B?M281ZDl1QWZYT1FqM1lReEdqRmMwUDZFdnBVdmZhVnhWRXU5ck9VRGJoSVFM?=
 =?utf-8?B?TGxFYkdBcVdDTXp2Uy9nQVBqWjFoZWFtajBMNXMxV01leGw0ei8vcUpWRlpJ?=
 =?utf-8?B?dUtYMFl3UWtlM3ZPcXdvQUsrMnpvL0JFUGswd0ZVQTRMV3phbHg5U2FkelpX?=
 =?utf-8?B?LzJGQTFPdTlZU2hwTGVtMmNaUUVVcDBFRXIxR0l6TmFJa2hYZkExNkMzaEtX?=
 =?utf-8?B?N24zNG84SmhxK3lpdXBOdEdSOU82WlBQeHErUUxHRmVnVmNwd2I1cHd1Z1NW?=
 =?utf-8?B?OUMwWmpqM3FKRmtSNkxDbVFGcnZJQmQ0ZTZQc3NRdTNQQTBlNlY0SVIvcGN4?=
 =?utf-8?B?dWI0c0laT2lXWHN3NXl5RHBIeDZnUkZIMUxTSW5Xc0NoL08yQ3NYdTJlODJz?=
 =?utf-8?B?c1E4SHE5SW5Mb3RKdjNpWWhRVHJsYXZLdjdLRCtGZXNpS0VNdDN0LzU2eFU1?=
 =?utf-8?B?dEJjRUhXYTV1YTFlV3VWUGNUVFpJUjF0QUtORTFXbzBqaW9SVnY4YUpzb3ZE?=
 =?utf-8?B?NDlPVW1UODBGYzBiWmpMMmtYM2dZY2dOMDNoRWtQTWd2UXh6OXZQZUo3Qldl?=
 =?utf-8?B?MWpPUXFqZWtGZTd0SW51VlNvVXdmbnNOV0JkQkZld3pFUUNiQkZzVHhjUmdn?=
 =?utf-8?B?YzBTdU12U2l1S1JDS0JQQy93OU04azhzVVlCNjBzTEJCQmNqcm1LMEJvV3hr?=
 =?utf-8?B?eTgrR0hPMWxqQXFscVE2THMxMVY1c0dHWU1xTkUrUnRCdzZsT1BxT1R0R2wy?=
 =?utf-8?B?WWs0NGtUUldvWm10a2p5aklPSG9MbU9sK20zMzN6U2FBOGluVkVqQ1pVTkJM?=
 =?utf-8?B?YjBybldHMlFzcFZ1Y0k5bFVOdXFSNHhkdnY4Zm1wYU1IckJuZEJCeEl0WVZ3?=
 =?utf-8?B?bDUzUzhvTlMyZGlxTEVveEsydDkybWN5aWZ3YVJtQ2gySmVhZFB5bGVOWFgz?=
 =?utf-8?B?WG5HNHEzQjRBcDVMWmlvM1lXRE1vN0dDWmtvcWZlbHJ5Z1gyVk1jRWNXYjcy?=
 =?utf-8?B?NkJPM1UwVWQ3akNJZHdMcFR1SFVCNUZYUGxBZTFMdWhsb3JnK0xidXlzYjZV?=
 =?utf-8?B?VCtZaEs5U1h5QnJjL0RPRXVUM3RsVHpVVmZLNklJNTV1dWI0VlZ6VEJ6OXhz?=
 =?utf-8?B?YVhQaEg5b3VLa3RKa21oMHVGYjB2VEYyME9VcUlPSUVUdVBaMEZ4RmJIVkdD?=
 =?utf-8?B?MW9wcFYrdG4vanlOaSsvVGlYWERDSm1xR2lsbXFnUlVGUjFsa0FWbGdUWitW?=
 =?utf-8?B?M1EwR2U5eHdZTHJwbzZhaUt3UXhxYUxXbzhkUnh5ZUVYZzIxbUZpRjhnZG9X?=
 =?utf-8?B?WXNWUHQ0SmxNSERJeDBJYVpmeXdqa2owM1JwV3BwcHFRamRNODNsVnZKK0dI?=
 =?utf-8?B?a1QvYkpSMFN4bi9NRVcwaGYxTFJlRm1sOG9VS0NFS1J4Mm51cThZOXR1Z0g2?=
 =?utf-8?B?R0xlYmtmSTRCdEt4aVZVbGtMT0FsbGdTTkIwRUV0VmkrNC8zQkdySTIvQ0Q3?=
 =?utf-8?B?T21kS1dWMzVxVndJUEdpNk9PcHJXQ0QxY2IzV0F1dzZ1NVNrK0M0VEFkdHNF?=
 =?utf-8?B?NS9udCs3c0ExSlBmRkJRUFpmemNiNzQ2cjZoRUZSMDZYaklmNldMT3RBN3pu?=
 =?utf-8?B?NzN3ejg0cHhWd2RuKzEzY3NUSFFxVXZyU0NlL1NWd3Q2RWFLY0tUQ2VLUDMz?=
 =?utf-8?B?cW9xZjBXZlArVDZOaUFDbGE2MUp5bjhtL3pwUHlIVlFMU3NDQjJzTngxVHlU?=
 =?utf-8?B?YlhETjJVbDRFNGoxUFlXeHhOcS9YZmlEZnBqSWpBTVhIQXVpM0JzSWhnUFQz?=
 =?utf-8?B?azJXQldpNG5NU1BSMFV4L0o4cThwSExEandUeTVkbDFoaXFHMWpzNkJBdEk4?=
 =?utf-8?B?aUFHYkxxZDA1VUZlZ0pwUFl2aytJQkRVY2dwTFlNVzhtMGZGL0R1MnFKMGt3?=
 =?utf-8?B?b2o4NFVTVlYvSXh5K1dMYmRsVG15NVZPc0F5MElDMFZSeHU1NmNRVUVCbFg2?=
 =?utf-8?B?U1hIbkgzZ3VxQ21XQWNrUUxWUGxnUmF0SERueUtydlEwcWpRc0tWNjRZRXdi?=
 =?utf-8?B?Sk5yYWIzang5bzVQdVZSRFFPQUdlZllRd1lYQ3hoMFNTZGJNSXdFZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EE94rVziqz8ChLPl5bEH+hqnEyl8SsJzTkDj5XvFe8jxiMcPcvwVFPu1TxNG72MfTQPSWm/gpp1I1paxVmGIlcrgro++SJdr3QO/A+T1Z3tN3F83ZXqW/pO/c+eXqvdwpZRfhpYOOm1H7P8hyXptzh7HoFKuED+39duZvruDkKy4u67kcO750ZN8BrhGaFsvE0JwF7Z9Vcb1Fnlhx4Mgvl1GbRN/cnl/JKJkpVsl9XM/bT00lvLay8aNTvSAFc332dBJOdRZikScmLhS+yt9uNdr47Ju6GF6LnErnTf2DYB3cX8UpJ2T6rcUM6eQrpIU5nlOGkNSwTwhnmGTSbgk/QTsAt4zvKEr6Dr+YjZDX6jDif23P+MQ/GuUYqXWT0MU5RGN65UdAvrBZZ4u9H0OmPXxWhJaZf0DFbX6W3Rwt0YDHHc1+y3Jx2L8DqYWMvyfzSy8+HzFTlRAvuHQe6fiYVMeRyJjTMsydq2/5URITf7DdBTBgqlm87Ss0Q0Cr/bI1H0eErLQ+pci3b95Xm/JR4Vh0C4vtobyR0dqSiiZXCQVBxRR0Y/LGbhYLcPZkzQOEtFKJndhqeG2Vtn8Mg63ix0CKNVJT4lcg9II9MF1Qn8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bb9f25-a584-4654-6d01-08de5511740b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:10:58.4018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxGh+ESErFxXFKOC0AgMFCzDYAmzwVPg2NqDc/F7DsHKPj2Rzlk6ObYiaBWT7jPOUf6T58IWDZxtiWHezd0QAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7021
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=949 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOCBTYWx0ZWRfX8xge4jLTZseX
 bAxLbLhVQyQ2JVubgXRYoIv8D4geuc4Kr0++GXy4oV9xWDB6fpTKXgGLLRWqB9jsOFrOwuyPy6z
 fipyUOWYj5gxAltRC5UEBl509ASUWpeRls0cdQq9bAki9tgUEI+DH979i2RQg0LCk6tok0/6YsX
 dh97JAWFFSBTysGq5ceBRrrqBKHwv4H5gkTU12Bk9eo2iJb8ctN1CjWpbZ36CY4EFio933N5PCi
 U4oWvP4kgJX7tKaUsMwvr30GhTS/01pEeEiDCtSiwgdCgzyCkDEeTvhkcT+RQfQm6ywmuFKqYpF
 Yaf4o4VH0ZpMB+v6Wlb7F3gtE1Q8EAeZY5of/CWFDCFnqaMeQY3H2uAKfBH7TVYv+QWrKyM8S/i
 fwWW84GytPbSL5IRtXMlluA9JkoCJvCiJZwx8qxsG9L1/Dj86vRHsJsI5sx9OMGIJz9lE4vIm/p
 4UpiRcc+AXGx/gpYjyQ==
X-Proofpoint-GUID: YG7C58xVYOe9sm7wyZ8ZScuwNRcTqRyg
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=696a550c cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=5IQcy3llepywcgh5t7oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: YG7C58xVYOe9sm7wyZ8ZScuwNRcTqRyg

On 16/01/2026 14:48, Kris Van Hees wrote:
> I think I am missing something...  IS it your intent that this patch provides
> for full system-wide tracing with wildcard support, i.e. where you can use a
> probe specification with wildcards that is not satisfied yet by any probes in
> userspace processes, and as processes are started, dtrace would attach to the
> probes and start tracing them?
>

Yep; this works, along with tracing of existing processes for the traced
object. See the documentation patch for an example of doing
this with python. The example will trace python probes in python processes
that were started either before or after tracing has begun.
 
> I do not see how this patch series accomplishes that.  If anything, the tests
> are all using direct invocation of a single program being traced, so the probes
> are guaranteed to be available (discoverable) at the time of D script
> compilation.  I do not see any test that ensures that a 2nd process with probes
> that matches the probe specification would also be traced correctly.  There is
> also no test that demonstrates that starting dtrace with -Z (allowing probe
> specifications that cannot be satisfied yet) and then starting a process with
> matching stap probes in it results in being able to trace those probes.
> 

That's more an issue with the tests than the functionality itself. I can
expand the tests to more fully demonstrate this. It's just easier in
practice to invoke the associated command with 'dtrace -c'.

> So, I do think I am misunderstanding what this patch series is aiming to
> accomplish, which is probably the reason I am having a heard time reviewing it.
> 
> ALl the tests in this series, as far as I can see, do not need wildcards at all
> because you can simply write prov$target:... and it will trace the correct
> process.
> 
> Can you elaborate on what this is intended to provide?  Or if it is meant to
> provide system-wide tracing with wildcard support, can you add tests that do
> exercise that functionality and show it works?
>

The tests demonstrate the case where we start system-wide tracing
before starting the program we want to trace. In that case 
systemwide tracing adds the value that we don't need to trace
a specific process in advance; any process that has the probes
will trigger firing.  For example, a user wants that functionality to
trace probes in future QEMU processes regardless of pid, so that's 
definitely something folks want.

The documentation patch demonstrates the case where we want to trace
an already running program/library; in that case I started tracing
python3 probes and captured (already running) tuned-related events.

Both are valuable I think, and the combination of both is too; i.e.
regardless of when a process started (whether prior to starting
tracing or afterwards) I want to see events.

 
> On Tue, Jan 13, 2026 at 04:51:23PM +0000, Alan Maguire wrote:
>> This series adds wildcard support to stapsdt probes to allow
>> tracing system-wide; this has caveats due to the way the kernel
>> implements probe addition.  In essence, probes are added on a
>> per-inode basis (actually in the VMA associated with the inode)
>> so it is necessary to identify the file where probes are found.
>> Probes will fire for existing and new processes (the RFC incorrectly
>> said they will not work for existing binaries; they in fact do).
>>
>> Patch 2 describes the approach; to facilitate systemwide tracing
>> we need to tell DTrace the name of the binary/library via either
>> using module absolute path (patch 1 updates parsing to support use
>> of a '/' in a module descriptor to faciliate this support) or an
>> module name; to expand this we then use [LD_LIBRARY_]PATH
>> to resolve the full path.  ELF reading of the file and insertion
>> of probes then proceeds in a similar manner to per-pid tracing.
>>
>> Patches 3-8 test various aspects of systemwide probes; basic
>> binary support, library support, listing support and is-enabled
>> probes support, and use of absolute paths.
>>
>> Patch 9 updates docs to describe stapsdt wildcard support.
>>
>> Changes since v2:
>>
>> - support absolute paths (patch 1, 2)
>> - add tests for absolute paths (patch 4, 7)
>> - document systemwide probe support for listing/using absolute
>>   paths (patch 9)
>>
>> Changes since RFC:
>>
>> - update documentation/commit messages to reflect that we also
>>   catch existing programs/libraries when probes are enabled
>> - fixup provider name for wildcard probes to be 'provider*'
>>   rather than using the confusing 'provider-1' since the
>>   latter is the concatenation of probename and pid (-1 is
>>   used to connote all pids)
>> - add test for is-enabled systemwide probes
>>
>> Alan Maguire (9):
>>   dt_lex: support '/' in probe descriptors
>>   stapsdt provider: support systemwide probing
>>   test: add systemwide stapsdt note test
>>   test: add systemwide stapsdt note test using absolute path
>>   test: add systemwide stapsdt note test for library
>>   stapsdt: add test for listing systemwide probes in object
>>   stapsdt: add test for listing systemwide probes in absolute path
>>     object
>>   stapsdt: add systemwide test for is-enabled probes
>>   documentation: update stapsdt docs to describe wildcard support
>>
>>  .../reference/dtrace_providers_stapsdt.md     |  54 +++++-
>>  libdtrace/dt_lex.l                            |   2 +-
>>  libdtrace/dt_pid.c                            | 177 ++++++++++++++----
>>  libdtrace/dt_prov_uprobe.c                    |  17 +-
>>  .../tst.stapsdt-notes-systemwide-abspath.r    |   2 +
>>  .../tst.stapsdt-notes-systemwide-abspath.sh   |  51 +++++
>>  .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 ++
>>  .../tst.stapsdt-notes-systemwide-isenabled.sh | 177 ++++++++++++++++++
>>  .../tst.stapsdt-notes-systemwide-l-abspath.sh |  48 +++++
>>  .../usdt/tst.stapsdt-notes-systemwide-l.sh    |  48 +++++
>>  .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 ++
>>  .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 142 ++++++++++++++
>>  ...tst.stapsdt-notes-systemwide-lv-abspath.sh |  48 +++++
>>  .../usdt/tst.stapsdt-notes-systemwide-lv.sh   |  48 +++++
>>  .../usdt/tst.stapsdt-notes-systemwide.r       |   2 +
>>  .../usdt/tst.stapsdt-notes-systemwide.sh      |  51 +++++
>>  16 files changed, 845 insertions(+), 49 deletions(-)
>>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
>>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
>>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
>>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
>>
>> -- 
>> 2.43.5
>>

