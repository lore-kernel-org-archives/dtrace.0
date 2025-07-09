Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5463111A8
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 19:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752090480; cv=fail; b=ILdt/N76g95Sk8gOQjttKronX0Sp9ZoDjfVwVOYIp40NLRmmxJD0CcpgXEqOI0zq15b5X218gmfusvSsJLP9U9JDhR2Qgl+72Q9IpEZHl38VrdNYuyXoJ8EbO1CbU79vGhY+paEOP/9dd1sleMw8L0YwEApli3Yiyq9qqPiSZKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752090480; c=relaxed/simple;
	bh=m6v5F7yemtbuHb4CNJCm9AsiyrfD+mHPD0mltua7h4Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GHy5qGNWfOQQXO3llawIFImTq/wIqpNBOIG6XBKG77TQtE4w7enErcNHgMW3Z9LY7cFgGvKr58L/l+QcLIIb7g00cB7sK0T+JNsEEIyjZ4Fho8tePjJJJy7VejC3rdPeL0G5TH8bf+RMdEu1QvQSygb6V2bZ96NisKXJys/fhd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PPDjwfXw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HyAnKm/S; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PPDjwfXw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HyAnKm/S"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569JHK3P022476
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 19:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=c1U8CIwQ5jiFz0N17Bb3maiWM+E6KDdjmFhs927KplY=; b=
	PPDjwfXw1+AZa2u09dL6TdMtvReVRJZoGuuUH4whwS5wMbQadJ/ssG3NvFFHXr/l
	JJ4z17f9zI0G4XiiUkpJwHGWkbKjkiWI7kusrZ/LKW9qeeliPDdQEVe1H2V7G0YM
	rr/QjSGiV0rGp7YsbYxWs1dkWqD6vy05cxwXXv/uOvyNnoGsnWlyxbqHvroFZk8L
	kdcSYmXuV20SEwHRBS8yRszlijLYJ/hMNhsuHCSNeDqinpZQKMqyA/jVIcDIxk/b
	hukiIme0V7bkfTWKuNknSLKT/TxE5IH//bVWUYsgRRoUy15x0ndl2HsiUpp4donR
	hvktG35dxeAy1sDIsdzjBw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47sxemr26q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 19:47:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569IeaZE014002
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 19:47:56 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2082.outbound.protection.outlook.com [40.107.101.82])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbdmwm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 19:47:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrQ12MBPZVKQYC9o0HY7CiafQz5hxTqZ6Ip6gwUJ+avFBC7q2DAdf/mUCEY2oEEV09ZaaTVb562a7XtC/nbUfR6eNZcudtiBkfrjF3giISlDUlGW0HNR1FIHZE2eCW/s+vo9DtvJA6RedBZHIOsCGQuOHspg91puDmufFp4BNzuuDSgPeRv3yGuMwuN3fPFUNoTXel6dnGKhnm5iFwJRQcYkedqvMggVSlTHhfEvcJeKtDT9ix8239teWGIf07GLRIlQzEwQwXugdYOwzVzxE00siEZTgiuDgIEujcpA9k4t26MUzAxYxlGjqcMuvPtY83dNB8atdqfZtQSPvefMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1U8CIwQ5jiFz0N17Bb3maiWM+E6KDdjmFhs927KplY=;
 b=GdsVSgRy82uF3Wu9jYfBuRhzCiuvcKnhNo3tUGr9IoYd8JsQHGiOhummVcL9lJPv5t5xWBYRpyLL3GkpzfjLFCd3ox3br/MqWTP1zpySn7zh+TK9nCazL0N1YeMBBOITb966cRavECdU5C2MVYPCUosGPJzyiqExDgxRNvXQp6AYhlhB713sWrW+7J+ODIhvFBHDwd0zCWd+3qd44faRM4SwmQywIXku2qUNfQ/26G4qH3M6IIp6CExWH5CtV/Ggf3w8NEP/Qud3ACtRTvP5FR/gN4MRCCTtF/AeLCb8h5j7ErGiLK3NJNLgQT6tt8v3UnErHlDz9UjwY+wx+qQv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1U8CIwQ5jiFz0N17Bb3maiWM+E6KDdjmFhs927KplY=;
 b=HyAnKm/SsUBhkNlQKa/yij7fSM34oLOHxwzaync11ata1hauXtrwQVtySKgNMw3YreAUlDWkgSqw3Zp9IHIxXTLCXkOhycePE3Z6nEEbAFZzDBkD7gaOSIszZQ30Bptz7sgHnhaOvp0nG//TStgh5ngMBrSzpAN2DBMbQOdNIeE=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DS0PR10MB8007.namprd10.prod.outlook.com (2603:10b6:8:203::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.23; Wed, 9 Jul 2025 19:47:53 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 19:47:53 +0000
Message-ID: <049a656e-2966-4026-9628-fbfe4ef2aea8@oracle.com>
Date: Wed, 9 Jul 2025 20:47:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH v4 1/7] cg: move get_member() to dt_cg.c
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250709144700.20591-1-alan.maguire@oracle.com>
 <20250709144700.20591-2-alan.maguire@oracle.com>
 <aG6Yn53shYZn9gVI@oracle.com> <aG6dPiH9HFhmFrc1@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aG6dPiH9HFhmFrc1@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0172.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::9) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DS0PR10MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ed903a-029f-4739-d78d-08ddbf217e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGl6aGoydzRYcUNQMDlOSGZWL1g5SHRKMVgyVThOODcreHlPOVdjdCtCMVlS?=
 =?utf-8?B?bnBlcVptM3UzdzVKd0xtcUpPaERieFlYOTBOMEZ6eUh3ZzhFSkwyemJ4ZS9B?=
 =?utf-8?B?NzNaRnZheS85MktUbGNJQjluTFlFQlZveSt1eEwwcGFqTUQzcndYSFJ5QmtG?=
 =?utf-8?B?TWJMaEltNk8yRTRRYjJUV0F3K0o0TThEUUdhdFFvQWFuNmJRUEpLK1FqOVpB?=
 =?utf-8?B?aWIwRGpIakJpL2pHcndiUmJSRGdFNzd1bGtmNDRsMFYwemJjQ3RNVEpiRklB?=
 =?utf-8?B?RzU0ckFqajRwaElJWXNOeXhEaGUzSm4wTWwzQ0hGYlZ1MVJ3a3RZc0Q1dnZn?=
 =?utf-8?B?cVNOeWVOaGh2NHJsZTFMWGVyelFaRUpNRHhhcy9iaDY0MHRqcXQ2ZzNPVWI0?=
 =?utf-8?B?UmtXM1NTaTVBeHg2RXM5aTRsYm4xY0p5TmZhOGgwZXZVVWU0MFI4aU9Yd3VD?=
 =?utf-8?B?bFRWMjBDUlBLNGMvRnpEVmhOdWZzcGMwbWRZdU14NlVwZTdOb0IwV0wwZllM?=
 =?utf-8?B?ZVo4ZmxCVXluQU9rdEt0UlloRFAvVlFwTVdiUTBSOFRqZmhHc1N4UkZhYlVS?=
 =?utf-8?B?Z215M0NWdDZIRldhcW8zKzhLOVlQRDlhWFROdXBXTDIvbE1iNHFVTDVFWXhY?=
 =?utf-8?B?bEh1TTdtZmlkYVZCWndLd2RrMGU5UE5LRCtIYWpkVGYwVm13RXJxR25MMzBF?=
 =?utf-8?B?cVVHQ0pvanhpRGdESE9vVTBBaTRpSGoybDZTaThsWjEydlo2Wit2MmxsUFpk?=
 =?utf-8?B?YTlId1lvMmRESFQ0R2lCZS95WlpzYm12aWlFWktVZkJYb1pSTzlXSXZRWWtH?=
 =?utf-8?B?UGQxMHRDSFNkVzdHa3Z5a3gxSnFDL29uTWV3Vk1BWlQ2U1VhMk5paWM4R0kw?=
 =?utf-8?B?N2FGTUlJY3JHdjZLOFovM0ZWK0Fpc1k3WDVXS3FORU01ejh3djdCZG9lZEZG?=
 =?utf-8?B?VnFnWDFLbERaR2t2NXFETCtHU29iME9jREFPRXp1UUh6ZjUzSnd0cDJITjRP?=
 =?utf-8?B?ZE5nSDlsMnJNOHp2V3Z3L2IycWp5cDA4bStUMkQ1UXl3dHkzdUdVbldVUnpu?=
 =?utf-8?B?UTVxN0o4RDNRM3hwTW5IdUZ5azloemczMEhUSnFOWDk0QVZnSXQvN1hQRS9D?=
 =?utf-8?B?WW13dlZWWDFCQ0hmUHN4UzlVcHhlclh1MVUzRjhKMzVnaGlmakh5Rk4rM01t?=
 =?utf-8?B?SU1ZN3I3NmJqMVpGWnVremhvOFZBRUU5SnlXb3dQRUhtZ0d6bjRRSllmNnA0?=
 =?utf-8?B?T09KSmovNHVjaHJhUFVnd25TMWRJVUdtRm5hOG1LRWpYYU44M29kcjYyZm1N?=
 =?utf-8?B?a3RVOTlONWFIMjAwSDYrcUg5SVo0VEdmcDM0WU5qc2lCYWhHRHRDRDhCV0dw?=
 =?utf-8?B?RnQyN3Fielh6L1BPVm15YUQrVmk5N1hybFBCUFBLMTFEVVRpdmNsTzNrbmFF?=
 =?utf-8?B?L0NyWEZicWxxSjNmd281bWdrV2VhSm0rb2VhcjVDZ3E0Uko1ODVrbHhRbml6?=
 =?utf-8?B?RnpXVC91UkFleFg2OUZJaVhvV0dvS1ZNejczYkpEak44M2xXc0lwamtIR01P?=
 =?utf-8?B?TEp0VnZlME5EcWRUeGo5UExPbTBadmVxWm15VFdVazBvRXBoRDBkYmdRSitV?=
 =?utf-8?B?UHA4MFZHVkQ5dGhkWjlTRWlFUFdlSFZ2YW8xbTV4RDI0eFFVWGJURHBncSs0?=
 =?utf-8?B?Y2JKaGR6RXdQZ2VXRHFzTEp0UDByejlmbG5UYWpEb3Jab2M2cEc5VW04bkx5?=
 =?utf-8?B?cFplNVhUeGFsSFBJV2gzdFB4S25iUUNrcHdQYmV3RmxXMnFnNXh4UzhQNG41?=
 =?utf-8?B?Ung2bU5xQ0g2UThYeFdsazN6a0hmWjFzMllMMWkxb2xzYWQ0WVZQSHVWdGln?=
 =?utf-8?B?YU0wVUxQME9GM3A5YmhLNTYxRVVmSXdSOWgvOTVPQUh0ZzBqQjhKYmVrNjRq?=
 =?utf-8?Q?xr3P7yhIvhg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHdRN1g3MDdQWGM5bVloT1dvL29vN3pDUXljY2Njc0YrL0hFYTBMOXh1TTF0?=
 =?utf-8?B?b0NRNUZWdHhVTjRKNldwbjBxaTA2U0lsY2J4RkVpSXZsd1lKandSOW53ekxk?=
 =?utf-8?B?eTdVcGVET3I1Yy9zZHAyN3c3T3J0SzIxU1hJWmxYNmhXdHVIVkNsaEdQK1la?=
 =?utf-8?B?UkJiS283cUJJVThoN1o0TG92Q2tSamxpeGwrWDQ4WU5SZmJXZkU2U2FwaXQz?=
 =?utf-8?B?RXlSaEc0QWJvVTRaM2tiWFZDMW1YZnpEakxiRzA2anhncWlqMmlQKzFDRnU1?=
 =?utf-8?B?cENIYk5wek5xck91WWlHYlJON0paWVh3dWRrUitLdU5BSG1WMFR2d1B0M29I?=
 =?utf-8?B?MjA3ZmlCZ1Q0MzcwRlVNU2ZyakVGbk9jNWlxazlsNWcrL0dYRVRjMXRXTkxP?=
 =?utf-8?B?WTZMNTVic2tITE9SMEVSazc4YXNJQkdLVDAvQmJQaE4rQ090SWVyUnlHSU41?=
 =?utf-8?B?YlhBWHhmTnFrNjJkMVFaYWtLZDJqYnB4Qlk2L2JHclZWdS9mOG5kNGRLZVFW?=
 =?utf-8?B?SEJlSDYwQTg4TC9ZajRHSm40OVp6QjI1b0FqYUQ3ZkJGVzFCRGFsUzdEYkdk?=
 =?utf-8?B?bVRHT3d6RnhQR2k0dnNWS0I1UjQwMUREL0x3dUNsVHRhQThHOW52ZWZzT1pz?=
 =?utf-8?B?MVNEbUZHY1orRTIzNnV1RXg5ZkkvU25JMWRUdkJ5SjZBcExkV0dhVmxNVW9L?=
 =?utf-8?B?bkh2VHhwWHpnS0RFYVFYK3JjVmlyM2crSmx3SzMxZnphUWk1M3FtbW95aTRj?=
 =?utf-8?B?WThUS1hwSVZYbDZsMlZLUlByWkdFTkU0elc1cE83eElSNTZiTlBYSnhTWmlN?=
 =?utf-8?B?WTNHUitwRGhhZVR2dmY5T0daeXM3alBma2N6cHJ0cjNEQzU2VXlCRG1tcE5J?=
 =?utf-8?B?UVg0aFVsa09rZ2kwTW9mMVdtdWdtL2VnSGt3OTZHQURaQmZYS1drWEdoa3Uv?=
 =?utf-8?B?UEpCcGk5cjRtd3Z3RkJjdy9sMTltM3dtLzdyeHQrL2tZeWE1L0h2bmFSbmd6?=
 =?utf-8?B?bmZUUFNWMVpWanpoK0cwVklsRGs1eFZOb2ZzVjIzVlZQR2FtSkgzay93VG9H?=
 =?utf-8?B?aURtVFBIUWRHNXlZLzZZK2ZUdjFMTTRvT1VaSmtKbnZnM2RpQkhxYTFITjRO?=
 =?utf-8?B?ZUQrdllLUnFXRjZINHdWVUFjSVcvaHM4VzFIR1AraUI4YkdsblY0dEcwazVi?=
 =?utf-8?B?a3RtWWloTFA0UXJYMjIwdVh4YTlvSSsxdGxPL3RpWFo1eVVNMmgzaEc0RUtt?=
 =?utf-8?B?ZUlxTUdHcmN4K0E5WjF1djU2eHR4a1hKLzBHTy9xS0RxdTd5Y1RabWhYTmFD?=
 =?utf-8?B?QU5Hc3NmZEhTQXlIWjR3SWI1MVlQNk1NZUhubEg0THBDVWNQYXlRN1ZVVGVs?=
 =?utf-8?B?MHRLcitDUDB0WDRDNnpZaDZBYXZ6ZFhXajVnZEtBcWdpTm9CdkNwSUxCRm5P?=
 =?utf-8?B?MXlZaXBxMmdGYlUwRUh2WTN0QVg5TmdRME1IN2hGaFR1UVpSRUxZNVZxamdH?=
 =?utf-8?B?YmZzalNxUDJDN2FCTnQ5eUZ0RmlYa1ovdS9MeU1CZUFEUFE4SCtSbVpSUmNH?=
 =?utf-8?B?bVpwZ3ZHRjRkdU9MRXM4Mjh4bnFFM2RsNzNmZnJHU0k3Ym1HaVJXaGZ2UXNF?=
 =?utf-8?B?bG9NQzREUm1zRk5ZaVozL3VOQnh2eXZtbDNhNWhJazBKZFAwNFo5aS83dmQy?=
 =?utf-8?B?bHN6VHBGV1RUNUI1OTlHc3crNlJET204ZWJOVDBrRXBwTjlGeE5oMExMTjFL?=
 =?utf-8?B?b1k2bWQ1T2E1Z1hWdTJlbUJjZ1UxQ0szK0ZsM3ZUK2ZvZ1drMjJlWGxBN0dV?=
 =?utf-8?B?ekRsZkE1cTd3ci95ZEMvYi95bEs4MFVNY1FuOUlxNklEeEtCcCtRVmpRQnRP?=
 =?utf-8?B?bkFCV1hXNzh0REZhaFpqM3E0SG1PeFYwLyszOVJFbTA1T0hleFlLVkR5dUU2?=
 =?utf-8?B?M2NPeWVuZFhmcW5uci8rMmdnclhEd3laWHlQek1Ma0NIQWFvTDhFNC9WbE15?=
 =?utf-8?B?azBGWXM2R3VqNlpucUlWVTE5Y1k3Tll3eDhJd01XaWlmTG40azhxUm40U2Rl?=
 =?utf-8?B?V1d3Z1VHUmF4WjdjT0EzZitHZTc5RWIxUGV5bzRZZ29jTzlhNzdCdTdNM0lw?=
 =?utf-8?B?cmFRNkVuSUZGQWJCZkZtQkJVQTNzSTMvRFg2dlg4U2Y2RDJPengxekNKVElj?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n5DpYmoH1LNGrWARfNw5tuA4VSpEIjDYYZbEiFTtOn/8j4oipzctp1o14h6K2y8T5F+kJeunLpqlvCLS31OkBhqZb8PhTeBmvCQMgj+8kJ8SlqxDJPxc9TuXMX58X2gmvvCddw1z7MvtZ0871vl7pNlBU/7ga+IcpFe7lCx4tiIqTVqFmPQFCSe7Pgxyx/MmxjcWrYvvguOAAjhmmPP9jV8HF9QIr7eTnWxty3vemN8nzXLFoc65p+Oq3dwcFQQsn4ttKGgKTzOL2PR2KmHIj7Y4go3rDQtPWLEJv+Okhr3FUEfZsXOr4daloJzk82wqKKJs8bb/bJVggiQCzyrYhJDrGfqkIQ2oqx68Cb1OscuXn3HawT0Ik4R0Y1EAp3m7GnZfHEt0C1lVoJy+FRmY7LczDon0ygWA4nYb/LXh6fdjkF4Mg6y7YuX+Vy8s+t4qlwM1l7UCvY1/rZoJuyUDV8bPfMd4bjmEDAjcKfaGQa0+iIAqubI+qNBCuJWPqvbyEYuVBsvEds4BxEYF2QgSoWDEN/HRlQjo2d5ibdY3B7MuheBSMOWhEuoNdFqs8XNQiJJRfMPwR8qza9xqiFXlIZnQJ5ozN1XLvp+CdUArIR0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ed903a-029f-4739-d78d-08ddbf217e76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 19:47:53.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ms1b4DiFFnek1PZNyHdWtRD0NN8j3Ox2pbmL400l2rEfmHrlEJ/1NJzg3HqHQjLiT6nMVzrGa8BvxQpjFDFbLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507090177
X-Authority-Analysis: v=2.4 cv=T7GMT+KQ c=1 sm=1 tr=0 ts=686ec76e b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=FSOaDE6bXDBwKJXMd3EA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12058
X-Proofpoint-GUID: hO2MDq_CyFunMqUQzw1thfgWFLe5Z5bH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE3NyBTYWx0ZWRfX+dW2Qa5cD8P/ CUPWblU2+o171L5yQDiuA1wXjsPVnFpynxxhriJBfmZ3S3rNONa52r9tlFMmW/598l2qiR4VgDA 1sash+B2Z4GsgJ4Gaap2u5ERDuqH46oR9jQ0UKqioJfBqEUjt6cX2H1DkTwttl2lJFjJS09m61S
 Gf0LzD/bgPeHBx4dU/Mgo/XoFOcZVtLYFnDX8B2QDCXpYfc5CRmfDeVKBm9Zo2wwtVAesTUDKZc Al9IbNAquSVHIsDD9SgS0oYtA5cWOlvgkHpD6Hv9XNvzwj3aTHl4VAW5vRIMa+fSxl/tBPqVk9C f2iFDd3W1Iqr/JFoLcBfnUj/IsawZDsZb+l8UHNJ0aDTcfqRyA2bED4jy52HWnm8X5RUVvuxCIK
 Vg1jKEcfZtQ0eRpovC8egcXKuYt6BxXp7NfLqtNLHzaQZuDfhUS4BXwPacGp7Df+IFb6Cyl0
X-Proofpoint-ORIG-GUID: hO2MDq_CyFunMqUQzw1thfgWFLe5Z5bH

On 09/07/2025 17:47, Kris Van Hees wrote:
> Woops, one more.
> 
> On Wed, Jul 09, 2025 at 12:28:15PM -0400, Kris Van Hees wrote:
>> Some comments below...  Sorry - I got distracted by the other patches and
>> failed to give this one attention.
>>
>> On Wed, Jul 09, 2025 at 03:46:54PM +0100, Alan Maguire via DTrace-devel wrote:
>>> It will be used by both dt_prov_ip.c and dt_prov_tcp.c.
>>>
>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>>> ---
>>>  libdtrace/dt_cg.c      | 39 ++++++++++++++++++++++++++++++++++++
>>>  libdtrace/dt_cg.h      |  2 ++
>>>  libdtrace/dt_prov_ip.c | 45 ++++--------------------------------------
>>>  3 files changed, 45 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>>> index bd0763d6..d6fc8259 100644
>>> --- a/libdtrace/dt_cg.c
>>> +++ b/libdtrace/dt_cg.c
>>> @@ -1901,6 +1901,45 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>>>  	return (ctm.ctm_offset / NBBY);
>>>  }
>>>  
>>> +/*
>>> + * Retrieve the value of a member in a given struct.
>>> + *
>>> + * Entry:
>>> + *	reg = TYPE *ptr
>>> + *
>>> + * Return:
>>> + *	%r0 = ptr->member
>>> + * Clobbers:
>>> + *	%r1 .. %r5
>>> + */
>>> +int
>>> +dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
>>> +		 const char *member)
> 
> Why is dt_cg_get_member() returning int?  Nothing looks at it anyway.  ANd
> with the change to use dt_cg_ctf_offset(), compilation error will be repotred
> from there.
>

all sounds good; I've removed the return value and refactored as you
suggest, all working now. I'll hold off on sending an updated v5 patch
series since this one's only just out the door. Thanks!

Alan
