Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A91991A9
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742330121; cv=fail; b=VtG9P7lFLYPIJpu9fbGrMwmQEAocdDcvUdjKaN6zsU2GoU8OzV9edCG06Dh2SSUEl9fsNCTYEpyttb0oSTuYYgniz3igWUr0nOkcWFD1/YtBHsjrv8eqdfR95ZMsNw3IR45doln+SSzjPfV4kpqTMOAwt7/LeHv9ehUFNCOPCeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742330121; c=relaxed/simple;
	bh=qc4KwI7z+sRnCc91yYMScNnyCxOCs7yAbeMnvM+i6TU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WyBvSPFRy+8pZeHSjLADazP5Zyw32IymWuMJ/CIKBZ2rwkhx9ArEQ1+jPibKyY17LDOtadSZTF044ci6+u7/WGZTsBZr3MxrPxuMdfe2HDd1Ma2EpJGMGHDRTIyaKzFw64gh05Vap4eUzKQlaFZN8J4czOhRnl2DLyT1NU0yB80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K3VzJBOU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XkpnL7GK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K3VzJBOU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XkpnL7GK"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IJYljJ020668
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Xx/Tg5M0F8dscU998zV8dJ9yNbin/dn/Ww5jNxa1+c0=; b=
	K3VzJBOUH/JG0hb/g9x4ziJnFv4X5PRAF6rVe8NdK1A5TmfqFSJ+oHkHNLHUbqbK
	8tGs2qJkP7MJwLkeuObEHmJeA5B/gojtqYqMdeEZCbLNFXkFjiQmD6jFGYkYNNc+
	rj5f8WtaV6jtO4OYF8GY1xkdN+kTfbPPyc6Af3ycuZgp4Bsz3pAyDUzkdxdX0+AT
	8gEj7DRBhlFN+ozDAXWuMn140lx1eMbBxwfJ3l4y8yFquFcqSMRq8xnp/IsnFWey
	dw6oHI8QMxSsd97/mAoj3rrDoJYddZ86D1dTZJt/NDZymlaUIn5Sg0gfs9A8JJdk
	YESoSrNz3sXR9JmQrdfO8A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1s8p581-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:35:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52IK2uxm024513
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:35:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbhx6fj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 20:35:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMuYDUpYo8gCR5Kh2btxeVq/h0IPDlEppun8xuS8SVxSLiPrFWoMgXvmTDpH84w3gNBhgMScN4za8NtIyh4uMGVhkpxTOpeBgiXdr6CNcXO/zSZvY0CwfD7z5KAH1Qv7o+sGVaRZiXhPKZzvjhAJxAR2vmO9gqo4oiddEOhM23eUT/ctKtEHARzbv2Z/BO/TNO7uHS1D/7jRNzzoiFg1n+ChDixqPPDlcsYcN2cgqL0cMs3jjVMgdb5k3n84DxUX6zIBmJI9PMiiTy3sOPQkk4eB+GK3jDNCGcna/zAmSkZ4b9mCiNIdKm1I9S4Pqm5okB4Q27FlS7WOAUFa9mkAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xx/Tg5M0F8dscU998zV8dJ9yNbin/dn/Ww5jNxa1+c0=;
 b=LAUoRmN1IJ1HFMI1/VqATrt8ucW/8fpy8mFCmRT/VvoFj5/h/+EIRl2wAi/3xE5KVyG8fgSGszSmf/CEjXVFZ1lO8IEUJwmp5GmtBOnmHRgPSiolN9IAuHc5Fr6m2U0OP9o9Cs2LjLkcA42zfXSFVngxzRii2PndAqhWnCKY2nGd2oFnrG20WxU3eQQqWkZQuNHPOmGMvydj0IMV1CRS7BgBidUMke0JJNus+JuYcaeU5jeVexfgsytkN61p3AdLHIY8GPWWwX81pI419UpKFwDv/j8pMaYrlPJzN1KLvEGupI3O0S2H0qjWT4ryPNICOrEr0BuSj7AZtx6r1l3XPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xx/Tg5M0F8dscU998zV8dJ9yNbin/dn/Ww5jNxa1+c0=;
 b=XkpnL7GK3M6RnGmjpVN7oi3xAscdYEyZlO9I1Ttp8181YdwEd9wEkTZJOGc1DbrAVWHyyDCyDXG0pHngDjOXR3+wNHxFxWhXL8wGrXMMdtViB6ycwJg+ViVsJcZ8t9ABgOR4qZriTLm732BdL8oTMd+hnjOt0T8ASdk9ibX8qxw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4714.namprd10.prod.outlook.com (2603:10b6:806:111::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 20:35:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Tue, 18 Mar 2025
 20:35:10 +0000
Message-ID: <44b61914-f25d-c89c-5d9e-085bbab2fdb6@oracle.com>
Date: Tue, 18 Mar 2025 16:35:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] test: Add test for predefined preprocessor
 definitions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250208190622.23484-1-eugene.loh@oracle.com>
 <20250208190622.23484-4-eugene.loh@oracle.com>
 <Z9nHA1dtjHeo2dy5@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z9nHA1dtjHeo2dy5@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c6646a-ee42-4864-3a82-08dd665c6093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW1scW5PdmNXWkVZaXkvRnpIU3A1cjZFSDk5dFBYMjBac3NBdXcvZkJkNzU1?=
 =?utf-8?B?cW8vZnRkelcvdGJ0MXd2YTJyZERTQ1Y5TnF4dm9aSlZ2TThEVTQ4bFdvR01Y?=
 =?utf-8?B?Tng3eEphZDcwSFZEakpicW5WZkgrZGhWN3M5OHBrbnVYUk5MVkRUTEVhNWtX?=
 =?utf-8?B?RmY1QVVlUTV0RXJocVdIS0tEMmx2ZldkUXFid1NPakdsRTdmUXNLY3pIcUUy?=
 =?utf-8?B?T25VSlpjaUFudXFGTzdJSlA4VENVb3dsbThLY2RKRVJDOWsyclkyakRiSXQz?=
 =?utf-8?B?bVJSTFFQa21aTytTWlJwaDJEdTB1SnpWcmNHNGZ3MzV2WkVzQmRVNGRuejNW?=
 =?utf-8?B?dnA1VkZpcXB1cDVaakZ0dzBkSnNQSXpmdVQ5dHVhQm94WCtuQ0JDUUFMaVlp?=
 =?utf-8?B?QVlPbU9Va0szRTB4N1h3cEI4ZS93ZUZLbnBZWE5oNFpqZGpnUW9WL2JXRnlx?=
 =?utf-8?B?bEJXaTFsTnFKbnc2Nzh1d0lXcXNWdnVLMkJCaHZMRi9nRkZoZUV1dHhqOFlI?=
 =?utf-8?B?TlpJT1J4cFcyUmF4VHdRN3ZqZitzSklYTDVPd0Q1NDRCNzh4S2R2MEZtSGw3?=
 =?utf-8?B?OStsbk1QdHh5L1EwMDNXZ0xWMWFOTGNyZzlwTVZFYVFTYSs5VWxOUmFzZlVa?=
 =?utf-8?B?Z1RsdEEycFFtZHVMRFdvWmlYYk5RV1J1R3pDUDNabE5obktFMjA4MWlQMktJ?=
 =?utf-8?B?eDl1MmFqOExncGFRL2lsOUhueExXRTNPR0NpLytTcDV3WUhPT3FCdjh3Wjcv?=
 =?utf-8?B?ZlV2dWFjTjU5eUp6eFVLN0lNQ2k2aU5lSnJ5UHBFVUl3S1gyTm0rSmkrWHVw?=
 =?utf-8?B?dU52S1gvZW1rMi9qOFZTbURreXpmSlNPZjk4Wlk2OFB6UHA2YTkvVlc1VDRF?=
 =?utf-8?B?K20xVlNyMU1jeXhPWlcrOE8rQjJOR2xGS1pSWHJEQ3hxNlk2TXVlSDBzYzZP?=
 =?utf-8?B?dnZobFVhK1FLeDd5L2gzWk5Jb1QrdkJvbFFmM2pqVTlBQW5PVEFZcFB4THFS?=
 =?utf-8?B?M1FIVWhnM3ZRUWJzRURYKyt2aURsb2NaWi9LY0lEMEJZTkIvMmNpZnIzZU9M?=
 =?utf-8?B?Mndpek1HVGpZTGNlanc0ZVpSdS9SOWpWMEhDd1IxSXduUE1pdjczRzdKTlVN?=
 =?utf-8?B?SXpaNk9XMlZqTEZkU2tpRldtTlJ4elludmhsQm1qcmZlZCtpc20yeTUrNmVL?=
 =?utf-8?B?Q1c0b3hXNnRZYW5XdzQxcXNIcFc4aVVyUWtnTExLdG1XTFdxUzRCSlQ3MmVq?=
 =?utf-8?B?bDR6YmYyVklnZnRITzR3U00xc0JiK2gzTHVRMzhSb3EzNEhpcGdzcGZhZEt0?=
 =?utf-8?B?L0hLKzFFTUlBSEZ2SUxOdVlxR3owWlhsVE5wQkZqZVFJK3h2K3pMWDk2VnRs?=
 =?utf-8?B?ak5IQTY4akhIK1dxaEl5WDdpcXZicW9zV3dqRUQvNHh1UGtQUkVrS0dXY09W?=
 =?utf-8?B?U2JCcDFOY01vUkpIcWt2TmZkd08vdW5NWjFqVTdhait6cXJUYk4wVEFUWkxj?=
 =?utf-8?B?cE9iTkNVZjNCb25DOTVYWEsyeHM0R012QWVnTWZ5ZzU4bEg5REEwY1BoYWt1?=
 =?utf-8?B?RUY2MGJDY3BJanVXSjZ2eGdzVXVLU3Uybm9FeUhWeHdERkUrdEJIUE53cHpv?=
 =?utf-8?B?NTNlYUNPQmw3NTlFdDZIVk1hbnl5OXQrQ2NKS2pLcXFtMDdBb0RNZk1GMWpu?=
 =?utf-8?B?dVB1Rm0yK2xzSHBSTnU1Y004VnM0KzlJcDdmelUrVEhwWnRYSlRTd1EzS0hQ?=
 =?utf-8?B?ZkpWU2t1cDhyb0NDZUdXZDdqS3BSS09LRS9EUmVWR1NUb1gyVGw0Q0hNVHVS?=
 =?utf-8?B?YzNjUkJINWFuZW5tQjVYQ0psQWd4ZnpQMjU3R3UrOWFiMWhDT1MxS1UyVlky?=
 =?utf-8?Q?zyJungGL3zjGq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE9JNnNzSnRyN0NlNTRuYXc0Rzhic2RBeENUTWtVNW9XMkJFd3FhMVVzaVZU?=
 =?utf-8?B?dG02TzQ0NFhWa1BIeHB2Mkdqem1HNnFnSXl0QWc3UEhMcStKUjNUa2p5TERB?=
 =?utf-8?B?RG9UTW0wMnd2MmFzYW5JUmFVM2ZCRnAycC8waU81Zm9vOHg5WUNhVWQ1bGFM?=
 =?utf-8?B?cW5TZTVNdHpvVDRzWUQ0dVN2bE1mczdUeUdwTDJMOUNxYms5dWhkSTJwSnky?=
 =?utf-8?B?NEZpQ3VTSmlneVZSSncwL1NCVERRT2NXR0pNSHRTMFFrWUJ6M0tVWEUySHYr?=
 =?utf-8?B?ZU93QjhkWE1wMWhWNzZNdndQTWMwc2NZUGoxNFlmZzF0Um1tWFdHclNPeWlm?=
 =?utf-8?B?WnViL3NtY3dvSVRhVGlJT040V2d0elY2bVhvNERsM0hXdHFXU2VGajZBUVBo?=
 =?utf-8?B?T0JlY0c1NjZIeGxSOEtnZnh6NHZqVjJrRzdmK3V4bHpIYzdJRnN5WVgwa3Y3?=
 =?utf-8?B?T0NoT25rbmlDV3J1SXVteGpJdWEwTldaZVdOY0hFZnBLTWdEbjc0RU1OaHIw?=
 =?utf-8?B?cmZaUWFSazAxZXd4cDRlRmVpRzREK1E0dDVpYm04YzlPMmdPVzlCQjBVZmdW?=
 =?utf-8?B?YVB0eFlZUzB0WndacWZMaWszbXArSC82SHQrQi85RDdXTjJxTllrdjdvVk96?=
 =?utf-8?B?d0t5d0dqbHFBalVJdDZZN0hleWhmY1N3Ylk0ZXZwRjFBY1lqQllBTzB1NFNT?=
 =?utf-8?B?dy9ZV3AyaDRjSG1wZjBhYUdmb0JhV05sajArUjlJOVdyMDhpQnEyV1NqblpM?=
 =?utf-8?B?SmtmRGFQRmo3emFpM3Y1VWpOZzVTSmJOS3NQNFBQa3pEbEdYMk5McnVPSXBI?=
 =?utf-8?B?UTdWQWowNzRnMTBFMDU4RkFHaVMwcDZPV0tOK0V1MURHZUdWQ1BZd3p1S3Ra?=
 =?utf-8?B?b1A4NmJuUGl0Uy83b01UQTB3elc0Z3pnTFFyaTZseFZtc1FGTmhSYnBJeWFj?=
 =?utf-8?B?emdhQ05pN3JmOU45TSsvWnNzMkpMNlpNcmhCcE5jd3B0UHQ3Q093b0lWSjQw?=
 =?utf-8?B?YS8waWNPTk1DVzB1cGx2bGhuZWdrZ2ltWkJrdlIzSmVVZjJFSmFYUDBweFNr?=
 =?utf-8?B?SzN0ekZBakJEL21Oc21kdkZ2aXBSdC9OMUhKVTE2WWhlSndJTEpaYmtvNXlP?=
 =?utf-8?B?SGR2K3NtbHh1cE52UjdyUXFVbkc2RVdZSGdMcWZSM3dFWFhpbFdOYlU4Tk1O?=
 =?utf-8?B?NlRtWFc3dmhTVFo2RlhvU0pJeUg4S1NTTWNJSjFKeTM5U0NWTEdSMDlLUDhv?=
 =?utf-8?B?ZlFzMkN2S084RzBlQUNYZk9HN3FmOVE1UXIrY2tnWG1LMUdZT3VFTWdYWGw0?=
 =?utf-8?B?UWw4TzRYenRDZVhocmlJcHRhVFdkZ0hzR1NKcitUZG84NC9PdkNITFJzeFdx?=
 =?utf-8?B?Ym9YdzBSWW5QK3U2ajRpZ2hpNXFhNktubWtaY1lYdHhLN0xGMFhMZkRVa01y?=
 =?utf-8?B?V0c0SnlnYWRITmtiSE1UdXM3MW9CczF3cllNSkEyWGt0WlZ1NHNNSDdES3Jm?=
 =?utf-8?B?LzdlNUwzNFNkcGFnTWhoVEI3bzdtSnluTWdpWlFsWkJIdEZYRGVCc3lGdk1H?=
 =?utf-8?B?T2ZZUXBQQWhnZTkvR0g1a1JGZ1dCeE5VVWxRVkcyN1hUQXdrVTJBWXhxV01I?=
 =?utf-8?B?OEVLRy80NzZRUDc1dU9WY3N0Ump1RmljbUZScGZjc0JHOHBZTzNGU1BTUS9Y?=
 =?utf-8?B?c2lNdnFDL2lnQkdtYms4SnZ4ZExyODJ1cjk2SXZBUkhvcW05N3lwMHRPTkNG?=
 =?utf-8?B?MllEc2xOQnRnZmw0dEYzS2E3ZTRrQWlBRFRzRHBIN01rblZWSU80Wm52NlJ6?=
 =?utf-8?B?dHF5LzUwME1lb2RDN1MxdFRZNEx2L0FrMDNiTENoL2gvdVRNOG5VVkRmbmQ4?=
 =?utf-8?B?VE1aaUNFZTFvQnFuNzhNUFBqeEpmcWVnUy9lSnpUOVJNNEdCeE5DMHc1ZWVE?=
 =?utf-8?B?TGkzMm1ydnA3N1VQYm93dlBPTkV0ekVSVmY0dHQvaGE1b1lrT0xycEcxa2Zo?=
 =?utf-8?B?akk5T3VTRUEwMjZoNG9JUm5sSzl5bnpEby94L2lpUE5zc1FqdGh1U1U3ajF1?=
 =?utf-8?B?ajQ0aHZsNGZ1bkZBTCtrampHeU8wQk1wd0NWV3FSQkU2cnBMREVyVDZROE5H?=
 =?utf-8?Q?GS7bsi/dVlWubE+mZ+P60c1Ix?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7NC8yiUmhADTnZ7wWyQVilfTpkKJacF6aD6ABN1g8xR71A0igUHSzbdOO0jBJzd6Ayx3zwM2Y+IzJ3V8bgFcpGIg7VP3+XTkK1h66DGxD8G7lTD6lu4XoFJS2Y/K1kwZWMpv+Q799QrPVoHqDgtjLP7ehcDVB0MTu5cKB1eNAyFZY/1/OQk2kmRt14zC+wywMG5kT4/EJiZtsDJIttVGEhRqt8lHoDOSO64pTqWTYSl21/4lUyNeOXlUX7BVkkZxnOQBNSDlM4/VoPEL8Bwk+J7BRZRcXCYds4u2iTnYn7R/uUyjkmIEsNOdgsWuXMvVpDp6Q26ZcKWFjYco/nrTMXOvk7i6uN/iT31aqlS4MOs4QZS0IG6W9muyVKHengB8WAkmTHUXls6x1nvJ9BDIJtHDopZW6xRlFgkZXiTgIh9J9ndzpQaCc7jVmp+vROpwaJ7XkTNL30SZjS2RxhJ5bsH9FZLkQ9ec5UdUQNlmxSUmrnZernuLocxEd5Jx2ivPoHv8zdTYOU6zEd/YnJ+w2a5X4t7Ff69HPaq9EmnCgNorl3tMnYP+/2n5SdKsfyArlGCEPOTxo+lr2gQhvUay5YZmFXn92TbH1GwKvD7u5Dk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c6646a-ee42-4864-3a82-08dd665c6093
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 20:35:10.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYksSz0qaL8BkLJmsMxI8C6aYv4DDPZ7rrVgfio8CHi8JaITxLkh1a3aEgu2R6pKnJJmhJw6CbYpwROMG7ZURQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180148
X-Proofpoint-ORIG-GUID: kkMfATCWvYcSwHaIlsZlXEYVFfVy604_
X-Proofpoint-GUID: kkMfATCWvYcSwHaIlsZlXEYVFfVy604_

On 3/18/25 15:18, Kris Van Hees wrote:

> On Sat, Feb 08, 2025 at 02:06:22PM -0500, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Orabug: 28763074
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> ... and incidentally, should we add defines with ORCL instead of SUNW
>      (but keep SUNW variants for backwards compatibility)?  Or some other
>      forms that do not include SUNW.  Things like __DTRACE?

Separate patch, right?  And, we need to coordinate documentation.

>> ---
>>   COMMANDLINE-OPTIONS                          |  10 +-
>>   test/unittest/preprocessor/tst.predefined.r  |   1 +
>>   test/unittest/preprocessor/tst.predefined.sh | 119 +++++++++++++++++++
>>   3 files changed, 125 insertions(+), 5 deletions(-)
>>   create mode 100644 test/unittest/preprocessor/tst.predefined.r
>>   create mode 100755 test/unittest/preprocessor/tst.predefined.sh
>>
>> diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
>> index 40561af91..73be89b1f 100644
>> --- a/COMMANDLINE-OPTIONS
>> +++ b/COMMANDLINE-OPTIONS
>> @@ -321,12 +321,12 @@ definitions are always specified and valid in all modes:
>>       * __sparcv9 (on SPARC® systems only when 64–bit programs are compiled)
>>       * __i386 (on x86 systems only when 32–bit programs are compiled)
>>       * __amd64 (on x86 systems only when 64–bit programs are compiled)
>> -    * _`uname -s` (for example, __Linux)
>> +    * __`uname -s` (for example, __Linux)
>>       * __SUNW_D=1
>> -    * _SUNW_D_VERSION=0x_MMmmmuuu (where MM is the Major release value
>> -      in hexadecimal, mmm is the Minor release value in hexadecimal,
>> -      and uuu is the Micro release value in hexadecimal; see Chapter
>> -      41, Versioning for more information about DTrace versioning)
>> +    * _SUNW_D_VERSION=(MM << 24 | mmm << 12 | uuu), where
>> +      MM is the Major release value
>> +      mmm is the Minor release value
>> +      uuu is the Micro release value
>>   
>>   -Z
>>   Permit probe descriptions that match zero probes. If the -Z option is
>> diff --git a/test/unittest/preprocessor/tst.predefined.r b/test/unittest/preprocessor/tst.predefined.r
>> new file mode 100644
>> index 000000000..2e9ba477f
>> --- /dev/null
>> +++ b/test/unittest/preprocessor/tst.predefined.r
>> @@ -0,0 +1 @@
>> +success
>> diff --git a/test/unittest/preprocessor/tst.predefined.sh b/test/unittest/preprocessor/tst.predefined.sh
>> new file mode 100755
>> index 000000000..79caf17ac
>> --- /dev/null
>> +++ b/test/unittest/preprocessor/tst.predefined.sh
>> @@ -0,0 +1,119 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +#
>> +# Confirm preprocessor pre-definitions.
>> +
>> +dtrace=$1
>> +
>> +DIRNAME=$tmpdir/predefined.$$.$RANDOM
>> +mkdir -p $DIRNAME
>> +cd $DIRNAME
>> +
>> +# Arg 1 is macro that we check is defined.
>> +
>> +function check_defined() {
>> +	# Add to script: #ifdef is okay, else is ERROR.
>> +	echo '#ifdef' $1                         >> D.d
>> +	echo 'printf("'$1' okay\n");'            >> D.d
>> +	echo '#else'                             >> D.d
>> +	echo 'printf("ERROR!  missing '$1'\n");' >> D.d
>> +	echo '#endif'                            >> D.d
>> +
>> +	# Add to check file: expect "okay" message.
>> +	echo $1 okay                             >> chk.txt
>> +}
>> +
>> +# Arg 1 is macro whose value we check to be arg 2.
>> +
>> +function check_value() {
>> +	# Add to script: print value.
>> +	echo 'printf("'$1'=%x\n", '$1');'        >> D.d
>> +
>> +	# Add to check file: expected value.
>> +	echo $1=$2                               >> chk.txt
>> +}
>> +
>> +# Arg 1 is macro that we check is not defined.
>> +
>> +function check_undef() {
>> +	# Add to script: #ifdef is ERROR, else is okay.
>> +	echo '#ifdef' $1                         >> D.d
>> +	echo 'printf("ERROR!  found '$1'\n");'   >> D.d
>> +	echo '#else'                             >> D.d
>> +	echo 'printf("missing '$1' is okay\n");' >> D.d
>> +	echo '#endif'                            >> D.d
>> +
>> +	# Add to check file: expect "okay" message.
>> +	echo missing $1 is okay                  >> chk.txt
>> +}
>> +
>> +# Construct version string (major, minor, micro).
>> +
>> +read MM mmm uuu <<< `dtrace -vV | awk '/^This is DTrace / { gsub("\\\.", " "); print $(NF-2), $(NF-1), $NF }'`
>> +vers=`printf "%x" $(($MM << 24 | $mmm << 12 | $uuu))`
>> +
>> +# Start setting up the D script.
>> +
>> +echo 'BEGIN {' > D.d
>> +
>> +# Check for the preprocessor definitions of COMMANDLINE-OPTIONS.
>> +
>> +check_defined __linux
>> +check_defined __unix
>> +check_defined __SVR4
>> +if [ `uname -m` == x86_64 ]; then
>> +check_defined __amd64
>> +else
>> +check_undef   __amd64
>> +fi
>> +check_defined __`uname -s`
>> +check_value   __SUNW_D 1
>> +check_value   __SUNW_D_VERSION $vers
>> +
>> +# Confirm other preprocessor definitions.
>> +
>> +check_defined __SUNW_D_64
>> +
>> +# Confirm that __GNUC__ is not present.
>> +
>> +check_undef __GNUC__
>> +
>> +# Finish setting up the D script.
>> +
>> +echo 'exit(0); }' >> D.d
>> +echo              >> chk.txt
>> +
>> +# Run the D script.
>> +
>> +$dtrace $dt_flags -qCs D.d -o out.txt
>> +if [ $? -ne 0 ]; then
>> +	echo ERROR: DTrace failed
>> +	echo "==== D.d"
>> +	cat        D.d
>> +	echo "==== out.txt"
>> +	cat        out.txt
>> +	exit 1
>> +fi
>> +
>> +# Check.
>> +
>> +if ! diff -q chk.txt out.txt; then
>> +	echo ERROR output disagrees
>> +	echo === expect ===
>> +	cat chk.txt
>> +	echo === actual ===
>> +	cat out.txt
>> +	echo === diff ===
>> +	diff chk.txt out.txt
>> +	exit 1
>> +fi
>> +
>> +# Indicate success.
>> +
>> +echo success
>> +
>> +exit 0
>> -- 
>> 2.43.5
>>
