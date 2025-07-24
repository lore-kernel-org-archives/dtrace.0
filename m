Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080C4274FED
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753376067; cv=fail; b=XoOxvtwXsPwEh1ii+CmdRHmxRM1QLblsfMHHAHNSFWPT8qdr+u++oHBKB2c0jcmOMsbkFbQpp/KFjiOy5Y00qHF0qd2wchWPjE8mRVG09mh7U9iTaMCr/oYGQsSjReNY3cDpQBfpwHPP3XejkK9cSdVlHGY5EgfZyq/hM+RuuKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753376067; c=relaxed/simple;
	bh=WsavZvDBiWAAYm9mDBj80ApYrx5GPX+cPtq7Tk6x7GM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HvTflk0v17h9AwRlUN09nQxGewbqMNx0tuqRe/bC2MjRl1vMoxrF/CY0YapijtbGiuKUm9rjTDS/wIVPdN1X1TJr+4a8mmfy6huzqu1sJtUJupUWHu5szX2SQGsLxp49HD8m1qjsXnX0sSV3eZlf2SmQKuIdHXs/qFekB5D0xuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T+/xaGY3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ugDcFQdI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T+/xaGY3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ugDcFQdI"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGiqam032405
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hvgjCTFgRihqsfxZqhmrB+DHEf4HyujvdqCL5nfwwbY=; b=
	T+/xaGY3I9dB+Q92P7738uuInqjBoyju8PxkpUxT9Q7NHHoCFGEMxK3XtqY69iId
	kVMPHq7/860svbnx31v2r6zCHRltA19jTsv28+1JKs+KCpDCOaowd/IZKKYtRwhb
	dDAeXCMwKigIMeqiCs7lmk2Op8Or61oVZnZiwws+3/onrSeo3j7/Va8uHdz21Hks
	rVUNyq/vTbZNRiRQGWfr9cXzlSZaroUHnrHaI1+hjaJNVB0jt/ces4kH/tuWKasH
	L25Fv/AYX62JrvFvKUrQLlIVeOoIiwRWwnX5QhYyIIDRRECZ3S/nhCp9/TxXipXa
	DZyilJlBhHx702c8yzt2NA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpj4p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:54:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGkFGF005877
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:54:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc35cu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:54:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOir6uQfQBDUkbPfVcNrJd0zXy49tRRLHRjPvkUSuJ5LkigeoJR8eF5pRI/LfMfPJQlL1JEoOgQlbVAXOHqoL0TEN+hbKNiZ7SNHoZeTdtQbMD+6/Bntv41pyXzQCbulNjrp9Bq888xnCvhFlD4teyoUzvnaKM95a2Vw5htkDZyKfAZtqlHER+MZhwo0Yoi34VWMH4eCAEe1si+qj0fyDkPp+mGi8oEOOiqb+VdU0XRcJIhPaw6PRVBisdMkx4iLAnLLALcB6mdlAOAqx3nL6V1XBOY4zp5HBvvX2WKCZSGJugTJ8kKr9Yc7jQ7R3pgyxc2F33RWMtO4FDoAiAbK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvgjCTFgRihqsfxZqhmrB+DHEf4HyujvdqCL5nfwwbY=;
 b=hPxga9bMd3RaBV1/XJvKNqkEJh4IXbLdvuIbWKa0+nmULvn3VDN8PoodEdkdZCFjBtArCwVaMakTkh6fkNyJEJWqad4JyC9rUVvh6OkXjBZ90J5QvMROn18uZMXnwxPTe0maM0PRboMAkW7wIJIYbjkiu+lsb/bzTGkbZO+D5W5Ixqj/EshdxR0z2HUzv2Zz3DgkGfF2VJgPqsZhQdNgJnU6IWvXDuW4TYjhuM94Sp2doyffGejzW+HTWmYOG10yk0eSE+hhdGVUmpHuDtDKp6ivZQJ1x0hKwmQJYj7mt1jRqltF1cirS+t8vg8Y2RnU89/ttB9r6lRSaObyfbel7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvgjCTFgRihqsfxZqhmrB+DHEf4HyujvdqCL5nfwwbY=;
 b=ugDcFQdIgGSEV/2iv39c2uctesoDLDEBElSU4jrXRu9LQRH2LqG1kuX+WSlCbz+RC2zcAG9Yx2DivPcLtGQTAz889fEbVUoUJbyWtZXgRau+7IAp38FBn2ykDbmwBVXNMOu91NKZKxvlCua3V1qHqjFiTPZiwf2N/RTREKrGF9I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN4PR10MB5606.namprd10.prod.outlook.com (2603:10b6:806:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 16:54:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 16:54:20 +0000
Message-ID: <43964eb8-c2fe-801d-8adb-3cfdc8561f81@oracle.com>
Date: Thu, 24 Jul 2025 12:54:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] demo: remove demo script depending on
 non-Linux OS features
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672ADE9E7B4B3BDAB17A3B0C25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <a84420f3-be19-d5fd-ef38-b542af302cfd@oracle.com>
 <aIJi4xFM+qaQzRU6@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aIJi4xFM+qaQzRU6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN4PR10MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 717357cd-47c6-4ddd-15de-08ddcad2bbcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEJGNTUwcEVNUW94YTFYQXdEdUtPalJxYjRNZFZ6d2tOQTMrNTJJUEF6czRk?=
 =?utf-8?B?ZE4vSGFQRFRLUjhCY3NCeU83OXBFYllwM3VlZ0FTOEJUUkUrS3Z1UlM5Q240?=
 =?utf-8?B?VDBSQ3Y1NGp2akhTTlcwaC9LQ3hmRWpsUVNPTnVGYWtnT3NCVHpIWFVJM1Fu?=
 =?utf-8?B?ZDlJWG9mMnN3UEZKc3ViWVlFcXJhT3BxaWQ3am1EKzllS0xRYXJWSWhqRGtB?=
 =?utf-8?B?eFFkSGpZeTZ5L1dYZlh6UUZLR3VtWTJWSFJ3MWNXMjZqcU9tV0hmU1BVQmV4?=
 =?utf-8?B?Z3NvVnVVNTVyUzNtK2p6MUtrU0xyRk9nMVBUTHdwNTB5bkZEWkh5L21NRUhu?=
 =?utf-8?B?L3ozWHd4YjNSWkxZVjNVQnJybW9wY1psd3lXZ2Y5SlV2dFpoMmhVNnNVSWw4?=
 =?utf-8?B?SFNud1RHNGxxVVB4VjQzWnQyZ05DS2VvOXhKQnowWitBOWNlNWllUGhZanFl?=
 =?utf-8?B?NC9JWHdFQ21VTElSU1FiZkc2TFpxL2FBRXdkVFhob2N1a0dwSytwbVNSeWZm?=
 =?utf-8?B?aHc2MzhqWlJLZ0NBNnlhcmVyd2xoMXdndXNkRzVHdkM5THNtOXp5cldPbXBi?=
 =?utf-8?B?dkRnU3N4VlhHUVJSOFNtWjNYSjlZU3VRL0VhcXMxRGVDYlhKMHIyaTdJODZJ?=
 =?utf-8?B?SmI2bVZyN294b1FUdWVsY2xwQ0tnYmVQOUlhdU5CS1hNL01uS3ZjcFdwUWFw?=
 =?utf-8?B?SlhNT0JodVY1SGEzVjlvd2I0MVRvMzNKdFI2U09DaGg4eXBUZVJKalNaZTJo?=
 =?utf-8?B?OE9vbmxLVWU4M0dIdEdzZFhKMlhLemJSUWZzSmkzcC82b2VtamNSZFBYc3NY?=
 =?utf-8?B?bml1bmNQODRzTVlPZTI0SVQ1UnpZOGVNZGhPQTd3RjMxelFUbUJ4c0NVenIw?=
 =?utf-8?B?M1c2QUh1ckFDVGZYM0pxaHNKazZvZjc5YmJoY3U1Njk5YlprSTJHRDFOb1px?=
 =?utf-8?B?cWU0cXp3VklKMGRTNTh4dm1BS2diaE9nelhNNUhJWG9nWENMRGVuSkdaS1hQ?=
 =?utf-8?B?bmFOZlc5aHlDTWtVK0YxYzNLWnlsMUFXK2tETVp5WVN2S0M4VXRhTFBzOEFu?=
 =?utf-8?B?MHNoTmtZMkZ2UW10K1p1L0NEN0tHb3VDeW9JZDI1eW9uZnBwNnhoK2xUcmp2?=
 =?utf-8?B?elRyOEs2bDJnNzU0cUhKbWNieEU4a2hTMGJGdTNBWHhQUTlPbndwVERBNHNw?=
 =?utf-8?B?OVFVQ2Qvd3dRaUtoUDM5QnRrdCtDczJUanNYUXhINTU0SDFvRDg0WU9hbjY0?=
 =?utf-8?B?bHdiOHlmem5SOHphZ1FEM3NxWjVTVHF3SzlhbGpLQnVzUnJYQWFKUkVobXV4?=
 =?utf-8?B?Y0N3dG9QZU1kclJ4Ni9UNUxtQW1XczljTFB3RE13OG5pcnBnaG1veFhVVmNo?=
 =?utf-8?B?K3M4R3RSOGVsSVY4MWJ1N0xKd1VRRzFWc1EvODVuL3Z5Y2RUeUpxTWhsUjlI?=
 =?utf-8?B?NlpuS2w4bmJTL0dVT0luNXVGMmI4UTNpSkdDZHEwSkk3dlM2MTVqUEI3QzNW?=
 =?utf-8?B?dytybXl1ZDJHVVNSdGthZENvYTdpWlpQSklKZTd6bEpkSVdmdWY3WlRDYU8x?=
 =?utf-8?B?QjRKelBrWjVBTFFyNzRBNkcvT2xLVGtydVgvSFhJaFNDUHBESVhlQ3B1Kzdk?=
 =?utf-8?B?aTJ0QzF5d3N3M1lYcFZRWW81M1pVN09mNmpsUVYycnZ0WUVtdXFXVkFRQzIw?=
 =?utf-8?B?bXViL1E4ZndXcEd4MU11MStKdFJIMk9NTGJXSzJ1RjB6Y1NKckZ5V1o2Q001?=
 =?utf-8?B?emovQjMwNDI3clNXNjBucGN2RStBMGErc3dESm54WVZrQTZvemtyVWZobndz?=
 =?utf-8?B?SUtQS3JuTmtENDdRa2I4eVlIWlFWVjkzSExFL0xIcGwxbjJKa3BEMnlPK0x3?=
 =?utf-8?B?YjdVbEJ4QXpPZTkwdHJTZ1QrTjJhSGMxY3QxTy9BVlhJV1NZeTJHM2JyQW5E?=
 =?utf-8?Q?7qly6OtZ6v4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjRockJWbTlOTnRtVmVhcStXeEdrdUdXSm9SL2NMS3hyM0FVYk5kSHo5K0tF?=
 =?utf-8?B?UmpoTFVsU0VURkU3cDRCWGNZbVJxRk1NNUFveTN1RUFQNWFadEtXMDNzSTla?=
 =?utf-8?B?TXhGUnlYRWlRRTdPOHBpQmFRTlZwUHZBU204MjBZdDBtWFNoRCt6V3BuWkIv?=
 =?utf-8?B?cWtTeldTNjJHRk45SHN3eW45bnhzdFQ4SER6aERNWlBpek5HSGdpa0dJUm9l?=
 =?utf-8?B?UktZVndEMVkyNDIwOTUrSjV3dUhwMXBqMGVYQnNzN1JiVm5LUVVFYnpKNkpH?=
 =?utf-8?B?MEczcW80azFDbUJsUnZzRDlqMEVsMDVWdnBqem9HYU5qT1h1cGFZaWtLNjRs?=
 =?utf-8?B?Sk10dW9lWHFtcnBKTnNSSmtWVWhybEF0WlpJWVMybWtmcTBuU20ySFRYK0Y0?=
 =?utf-8?B?UnBsblRnNnEvUG5pd0RUZGFRYk4xaE9MSVJsb25sY0kwT1FCbktCK0g1YjNV?=
 =?utf-8?B?RDk0SUlkWlRtcG9wTHd3dkJSUVdXRXA4a2J4cjF1TVU4amxqQVhjRFpSMVE5?=
 =?utf-8?B?UU9NMnZvS3hmTW12NEFWbFRwMGN0TC9Jckk5d0RTdjNoZ1l4OHdWWExkaFpJ?=
 =?utf-8?B?NHJnMDRDZjhYUUw0d2ZNbEVVc0FoeEdFQmJVWHhTVDg5L0l6M3JkME80Ukp5?=
 =?utf-8?B?eUZkYUgrWTF2NmNIRHQ5QmlESVYrWFJoNjRqWXBCWWtNK2grelBmOGhzY0NK?=
 =?utf-8?B?bXdzVGpsMzRNWHV5bGVtR25XYittZloxTG0yQzRmY0dleU55bUJ3YnFocXRX?=
 =?utf-8?B?ZFI3bWxIMkdkTysrSm1LTFgzMEJBMGI4enZVNnZtNTc0WjNzWk10VysrS1Qz?=
 =?utf-8?B?Z2Ywb1ZjSUlsQUZCMGsvOTcvS2hrZ3c2UmtoTWJsUU1QTzM0WmdKa3Y3N2Qr?=
 =?utf-8?B?a0FIVlc3QnJGRU9BQ2xqVmlDVmtuVWs3SVd1aVFTYXpwNlBMUmR4czN3MVkr?=
 =?utf-8?B?dG1CL054aURzV2VpYzRZZE1vQUdXWXl0Y2VxSkludkZBYXo5QnpGK3RGdjkv?=
 =?utf-8?B?N2V0bzRFUW00OER1M2svUHJPbW5aN1ZxVHJ5OUNYTzJocWdmNDF2RGRsRlIr?=
 =?utf-8?B?dFE5MFFSU2QxR3B5TlAvR0ZxKzR0RW1uaVIrSVhqYyt2Qlh6RjNKZ3FibExU?=
 =?utf-8?B?YjBPUlNSS0xrRWVtRnpubkRiSG9XYXVaY0JwR05zcEhIVjBwY1ZtNDVSZTYv?=
 =?utf-8?B?eTVmVFZ2djhzcUIrQVJkcEFkOEtNcWgwN0lYc1hFcUQ0bFV1aDA5M0V5UFU3?=
 =?utf-8?B?SEpnTGIyT1ZKcFNXS0J1ampoQnBac29seVlVcVN3Um83bUZaTVZpVnJDK0Jh?=
 =?utf-8?B?c2FweVgwdTUwVnFNMk5TMUJvdEZ4azNDcVpqNUxuSFhnUmZYWGtOUGZvSUlZ?=
 =?utf-8?B?UlZyWS8yZUtDTjJHSTV6cnljeGpROWU5OG54TGREUFlBRzNyVkUyZmZKNnhS?=
 =?utf-8?B?aTRMWEoxdVVBbGprcEVyaW9FTmlzVW1yZ3R2YlBOUXg3WTBCejVsWGN5NFRJ?=
 =?utf-8?B?WDJDL2NoZnoreUhMWXg2bFpNd0IxTklBRU5iOU03dUdPcG5vL3ROanc4M29R?=
 =?utf-8?B?eklKVlMwQm0rRG82T3Q0NlJuRS81Q3k4VXFtOUZRTUZYbnhEbm5tcmVQRHAx?=
 =?utf-8?B?WDdWdTR1VXh4OGlVMHVpYm40ZUVrTXJMS0FPYkhyTW9wdzRFYkt3N1d0ak9N?=
 =?utf-8?B?MjRpdEpmN2FuSVl3c3o4SlF0ZUlEdUxGVU9EeVRzczBMaGw5NlF5cnd4aUlI?=
 =?utf-8?B?OXBwOGE4clBLdWE4Y1VCRzNXL01YdndPOHNDdWprTDJpM0ozUW5hK2drUndC?=
 =?utf-8?B?QzIyZXRlVWNEWWllazM1eXZvL3RhOXY3Mll1WkVHWjY3NTdwZVZoeExyK01Z?=
 =?utf-8?B?bHVTbGlxZkhtT1JuSyttcmZTejBmNlE0UjFVOXdkbG5wUm9KRU9Gb3c2N0t6?=
 =?utf-8?B?N1hJVjZOMXFpejBhY3NiaWZ4ZFhTUGhiYmRlT3hqTlc4YnZtWTJ0QTBPdnhC?=
 =?utf-8?B?WFErTmU3R25sbEhsVWtxNXhDVnJ5Z3JkemluMTlCakcyZ0VpaVFCejh3TCtq?=
 =?utf-8?B?N1lHQVFLUTBKV2F1c0dBWVhpbTNnRGNwOWExdTBCMlJkZU5KRFhYMzAxS0hG?=
 =?utf-8?Q?WeaWkDrzCPMjlUMqY25hLx/uC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hzETOrp/Y8djXlzd/TjMo/N3VTWFoYejmyW3p5XIWpkvUT9rFFgIzlNhGZDPXIcFP6bmxA0v9rySI9hnlfRL6IQltOaa/J5G/wh133IkeO1PIhMVjYT9i+IxjMSZsvsl9Nyo8En8VMRsi579Ldrq8Giyg5h8yEc+hIvOoaUX1R672chTixTREGWtG+nJncV05YszPJl9IVTRFonx89pNDRsFJaXpnLUW2cO+iEbgG/AuuandPw7pHjV/QiXkBC+j/mTE1Z0KAoELBjfbW43YbYyAU6ipvVYE1Dmrs3HuT0DE1RXJ48r8I3Mcyc9BVrM11FcLtS6XkKCgwKt/qVg6WF+B9CVcwhaHRu5SNWIs+gXuggDsJ637jDnkSBuCpUadvWIqhCfgODynJvPM0ajfAmCxKL909FFexROcghnlE3mn8jUol245oaH7pFoy6pVMflueCtg3HCyhje+y5ySI6PisXuUH/XsDyzqCkE3nFzi+WC2/LW7hZf/m5l0B2v/4gC9aVgkU5cR1uiGh9p+gYHyviu5mv54qOEPU2WV6cvmtspxmnx6EY9JKhU8XdlWJYt/QNHM2Po2rdHP/Fns9lMUkhIsPfZ2gMSmPUVny054=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717357cd-47c6-4ddd-15de-08ddcad2bbcc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:54:20.1531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOx4AgN3rdTOE+yO5LMFcgk/Des/CKa5z3JFL08A7oLYJqgroinKZ2hizVZS3HgCYiCU0pAam4IfLSZ+Eqvldg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5606
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507240129
X-Proofpoint-ORIG-GUID: Yzpyx7a4Hag6jTpii5gby0mvw8ApfSPP
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=68826540 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=v2DsuGMAwI_xjQ9elwcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Yzpyx7a4Hag6jTpii5gby0mvw8ApfSPP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyOCBTYWx0ZWRfXzNKriyQUSilo
 CvtxKeWdVT4/RRYwDdEcFvwDGYfoxy6V1gq52zjaarG/I0qyMyJRnKd7/BDUjuuHnILYo57FHEK
 iWJ3IS5gE1xd3Wn+hlXrnm8C0QPTYaLA138uErJqVgMmGzJQcE8Q2PLq1wVMAV1PQohCAxrrDUI
 J/+cgC6ri9ugMIqO3gTVcYWn2uEL3fF5PJZ15AChO+JCFbmsfUNBC+dsEBcwdONV5Cjs1QamwKb
 luoyiErnUL20nVrcY0w2fC8ZhbLoW2IsrWtquTJiwbQaOG8PGUvDVJv8SiKIJWUYywMk2sNbzSM
 zOVQT+Xj59xV+ZtnTNXiy8chlGNxCjdpj3IeskfJIEeWgI314m60V5vVPJb6eoAhb8JypXYdbH7
 QiAQ8SFchzBuEEmyvlxzA7CEHZ/lMxRZhxn/A6npavlDS8MtyUqRtS3zyyhbVzbl7Xmtdvev

On 7/24/25 12:44, Kris Van Hees wrote:

> On Thu, Jul 24, 2025 at 12:32:42PM -0400, Eugene Loh wrote:
>> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>>
>> I do not object to this patch.  I simply do not understand its limited
>> scope:
>>
>> $ git grep -i solaris test/ | grep skip
>> test/demo/buf/ring.d:/* @@skip: Solaris-specific, unconverted */
>> test/demo/struct/kstat.d:/* @@skip: solaris-specific, not yet converted */
>> test/demo/struct/ksyms.d:/* @@skip: Solaris-specific, unconverted */
>> test/demo/sysinfo/find.d:/* @@skip: Solaris-specific, unconverted */
>> test/unittest/predicates/tst.predcache.sh:# @@skip: Solaris specific -
>> requires rewriting
> A particular problem needing a particulr fix.
>
> The ones you mention may or may not be rewritten in the future.  But they
> are not currently posing an issue that needs fixing.  This one (even though
> it is skipped) was causing packaging warnings.

Not a big deal, but could be nice to mention in commit msg.
