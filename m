Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7A3378828
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771361054; cv=fail; b=Zmbzse4+rlOdK1Mfq+WrLyeeO3KxwwbH52frQqjPbWV3muWEr0pCFCiqIcbNjKESI/3VpxaIwvW+OUnsf0vyB0A/mdc5mVg0Ongt47tPuP3XzP+Y2Suc9AARdE6X1NqQROCzb58eoAHwsTmGeioHhQ20cqiGrQ+wJGyLMbb3So0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771361054; c=relaxed/simple;
	bh=shrZgRmJc1+vjkypioOQK8AQ2nDwBHyeLjqoS6p3pb8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VQ423pQ0v/KJLK5ITOJOZkPB2Y3tIcnxOc/gUk1V35xWK8k1Cvt5ZAS3ChYcPJpvCagtSqSAeDIx71vr3VYHB59KqeRqWn0j+zQUtNe4VT42Q/ZOoIAxRStEqD4kESE0LCHR1yP/Z3m/0gUOdtImm8lzmvwdnAVMvGzKEgPXay8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p1Z1lH4A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V/m6OKyR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p1Z1lH4A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V/m6OKyR"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNKrt066174
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 20:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7YiH3VEQoMC5dwAh4Ka3koVN/+aTIBLO0I5d1bNCU7E=; b=
	p1Z1lH4A5EoO2RZzI/Sdp8KiEyJCu6uINqIVslVvxV5tCUdjF6USdhJ3HWUN8RbF
	/7wOULrRf2kNV6h9UIlr1TRRbv1MPKZERguzrqNGBCRb2LahDphDUFGPv9JJq+cZ
	l1MUIuuluxu1mS0RyvzsF8+JadKOzr5Anz+QFhxE7j9LvS+WM7JieSqO3EDNNK87
	j4sYmFFgcaJeU/HbAgijbpp2Rh70rdIUDIGE7HVxKKLdT5I9byDjXGd5PuYAxyoK
	g0sTakAxSJ7uWunDYeR5zGGrGHjIXxXNVqO4KYbCzYgyRMAHmBhsTIWoFoGVsVkh
	aNBDExLpu2fCmDKojEDRSg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj044e0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 20:44:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HKIxTT022961
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 20:44:11 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2cqs5f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 20:44:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAkX0eAwcaqBa7ciVe6JIX2u/Fumq8pFy/Ozc+L3vBf7PhAInbqrlpkNPojSShssLSL5h8kFy7mlJ+JihyVynra05UxAtH6nOJ5bzBbbKhjJnNqhP23T2ZFsfe2lVVv4T0sE6UluCcW9Pm2BWmHipZV3R8FhReGQUtr9ZbiuYnTK1Hk/j4S/IvgfrLW+dtbMqMFI3ep+7RY65F4QH3Jm+FwMaOMwO6MhQpvErxJvovCgN+b1MQbfbuIBbEvAaNIOuU4DpyAC8zcYFzd4zkxzQEmXoxnDyiDZbROCPYpfnf+WIiRCnC/o7pCBmBYVWWQQ2NtHc8FV/8kYTVEF3UyKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YiH3VEQoMC5dwAh4Ka3koVN/+aTIBLO0I5d1bNCU7E=;
 b=PmrSNB668cFKmpKWOQ3Jf/dkwQFsBZe1WRe7lCtksEHjZCodltOlaKgyWu0hUh44RgK+cIUheJcJmZwr0QzkwSn6g8/Re69rxePeea3lE2w6hTKT+Agdur1brT/VpD6yVXelZFaB8O38YnnbnI4bwACMwxtYWWuCpvcqpQqlKd7dUkid0/bYW7v3QwPxliicpS9uvqtSxPnMbXfCmDza+WxpW563TEAMk5YaMit7UIDiTEqUCosqM8lEb19CAHHmUpRrawDzZCPX+rR2ZufMvb8aZmPdfU8MNYjjoa4z9Wm32YmZawEeRR/2qMToFjf1xZr5J9261C+e6oRigFTWWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YiH3VEQoMC5dwAh4Ka3koVN/+aTIBLO0I5d1bNCU7E=;
 b=V/m6OKyRqxqh3HknKFD3K7Z+CEnAK1SxfxbxPhBgQEOzU+CJkg7AUxo15YMiVIJduJ6cy6+D8Y8p+rUlEf5BRjPciqGgwaPZj7ttsr5eBt1kUmaYYUu2b7RGAuZCQfAODtVDW+vwf4cZatm3HocM1E89p+MUqbAHnGceHwssJHY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5198.namprd10.prod.outlook.com (2603:10b6:5:3a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 20:44:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 20:44:08 +0000
Message-ID: <abf2b87f-940f-1444-73d2-30d5b64a5102@oracle.com>
Date: Tue, 17 Feb 2026 15:44:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] configure: add support for
 --(disable|enable)-dependency-tracking
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522C462F5DF76BD9E145DEEC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522C462F5DF76BD9E145DEEC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:23a::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 502d0a3c-7001-4681-3d07-08de6e654c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXU0MlMwTGFaU1N4dFBnZkZyRXJQSUtJemI0QlcvTk9ITE9IU3JySEZSd1ds?=
 =?utf-8?B?VnRQakU3VXRueTFnVkk5SmRyczRwbTlYenhZb05IQkthTEhGVVkzdHZZeWtC?=
 =?utf-8?B?cnE3aHMzTzQrSWdjNVBUeVhINDFIV3FNZ0ZDZWI0bFVlQVBZS2piRElZZzFa?=
 =?utf-8?B?b1pUUXFBMHdHL1FPS2JoNW9iemhuVEhqUERxU09kaU04aVdhSk9vUkp4c3Qr?=
 =?utf-8?B?bXoxQ2tXbEJybHRTd1lFTzBpdDEzY015T1hWWGxXNTlXUmxoNG9hNzVtOTJR?=
 =?utf-8?B?OUFEeDJ0VkZldDhiaThXMUtxbDhVZnV6c3d3MDdkUnNJcHVmTVJ2SjROVnNa?=
 =?utf-8?B?N3R1dG1KZmd4c2hPYWFtcGpIdHJTSjFhSnJHMzRsMVJUQk9WSFRYYUtJR3Ns?=
 =?utf-8?B?WHdoQ25QUG05cUFwdUhTQ1JLM29oWkxMank1TW13SUlQUjJndEsxWXRvVkh5?=
 =?utf-8?B?NTdiTWhkdzZOelB2YUxEUUJveGhoc05DOTdzb1JzNEpVNS9FbnpXb2VuRHJC?=
 =?utf-8?B?ZSs5SmE5bDJjTXlFUzlFVldRdW9XdkZvaTRVak45ajNreHBvZWQ5YjVFdGMz?=
 =?utf-8?B?RmowVXkxbmhjOWlGTXJxeXFGaFNuN3lsbVhXeTUwV0RsblRNa2JxZ3ZCUW1M?=
 =?utf-8?B?SGhlNW5nYStDWGZNQUFjcEFGVDhTOGFOQ2dWQ2dpK08yRmlLdHJ6QzBzSWc4?=
 =?utf-8?B?ak9qMlltTjZRL1RrekFGUXNlYi8xeWFUbFZKa0t4YkFvbWxNQ2Y5LzVObWV1?=
 =?utf-8?B?Qlp4NFU1NVBWT25scGJKb1N4dVFkTWFtbkgyaHRjUmtGRnFaYlVSK3QwTXdl?=
 =?utf-8?B?QXM1NTdBZ3ZVcE13d05NVUJFNS9YTHJoa3hvTmZod29DcFQxQWN4Ymx0ZUIv?=
 =?utf-8?B?SVFKdkFVV0ZRWDBrUjVkRkxSNE5yM245eWY5Z0lpcWRpc0NLRVlTMkp2NWFp?=
 =?utf-8?B?Z2xuYm5BRWg5Z3d1T3dEOXB1UHRxQzEwem11M2Zwc2RONkk3Q29KdDVQOTJE?=
 =?utf-8?B?bGFGTWZDSzJ1QlZlL3ZKQXVvWHhVeEszS0t3S0swWDVGTm85VXRJMmcvUVph?=
 =?utf-8?B?clhkNHk0dnRnVlZXY0dDa3diOFBJV1FtTUxjSXgvek53TnBWTVRMZlRRcVp1?=
 =?utf-8?B?VGRudjk0eHVyYThTR1YvYnZZbW16QXYxL2QvMVlDa0FrSVZiZzd2dDBCNkVl?=
 =?utf-8?B?SGdiSXg2U0tMQmRBcHlNa0NpajMyL3dxaDFnNFI1MGtRMmRieHREc3JkaVRD?=
 =?utf-8?B?RjEzK3hoejlpOXlUUUJmdEU3MjJITk16bkwyRjZYRjJHbzFHeEZwVlRBakFN?=
 =?utf-8?B?VXhSbkQzdGo1RHJieXpmTWxaVmIxUHB4dG5wNUlIQitvcS84OE02TGNLbjEw?=
 =?utf-8?B?RVVSR281WVB4QVRSTVlWWm9uNDNRUzdxTXkvemJtbyswcitsenBCTE5mSmt4?=
 =?utf-8?B?R0loWDJQRTVaNmF3MjdMMk9STjB0eW45a3Q2d2lZK1ViL1lPVHhZT3hHcnJY?=
 =?utf-8?B?WThXN1ZiK3ZVbnJtYUFYNmdLczQ1N2o1TTdrTXBIYU1DNHFUMkxmY0l2c3FC?=
 =?utf-8?B?ZE8rSVlZUnQzdTB0cVJ5UlNsUU5IS1RnZHVxdWpFWDNzcGdvQ1JzUGxrUHgv?=
 =?utf-8?B?NmswdzRKeXNIUmVsb3ZSamJwSXFha3BPZUllSXEvQWVLd2Z2R3liM28xOFly?=
 =?utf-8?B?V3FSSW00VzJKMVV6RWFzaXdKTTJGLzR3WCtSbU1WQUpaWWZ6M3RMcExESDlO?=
 =?utf-8?B?OTl0RmFlRG42dUJ5anJNN2ljVEY2L2lWUWdWbHpsYUVhSDBuand3dWY2SjYx?=
 =?utf-8?B?VEJ2RXdWZmhuRDBCcU83UVlkb0I5NExkQld1akh1TEZudUJqektZb3ZOTjFV?=
 =?utf-8?B?dVMydERiSGhvam5tR1JvMUhURytCUFVoY3NYcUx0TkF2aTdqNjdpZHNiYXp2?=
 =?utf-8?B?bjZpdEFZS1RNeVd2M2ZKdDNOY0ZuWi9jV0tPQTVuWlZIb3VvVFNrbWhzWkdN?=
 =?utf-8?B?Tk10TzBUc3dKUko5TXVjRlh6MDlmWVA4a3NmZ0g2QkpkMVBJT21raVdzRHJt?=
 =?utf-8?B?bHdGWVJ3dXp2d3VpbG11dm4vbE9Bc0t3ZUZJK01SajRNamJaZjFTOGdQZkpt?=
 =?utf-8?Q?BGwM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWNNRXZrL2wzRG1rVHo4NTlWWG4vY21nOWxBdFA2NzhWMnJsUnpjS3NoRnpR?=
 =?utf-8?B?WFNERTZiZGVhZnhZRUkzZUlWVFlxenpDd3ZxWFpJcHFNWjJ2YWlzSHRhRmpl?=
 =?utf-8?B?WUN4aUw4cnQ5c2dsdnEzTURIR3FxSkZRN1hZaVpKTlRGMHdQelErbzNvWk9Q?=
 =?utf-8?B?QVl3TGJUVjdiY1VITk9PdjVuVUttbnk3K21BWWRDRmt1RCtyOFBVdHhNdkNh?=
 =?utf-8?B?WXNDQlN5enJoSk9FclJ3MUw2ZmJ1MGFucW15dDBnQ3Z3aWJkQVlQeDVzdGcz?=
 =?utf-8?B?SnVHc2NvcHdUNXZxdkQvaEF0NXFvWjF6MmNienUzTnFYQUFFOTVYVFFJUmUz?=
 =?utf-8?B?enBNTGQ5UjBQZmFTMUNSTFR6ZWowWE11L1BVQzRXRWxyYmJYR09vMjVGcGo0?=
 =?utf-8?B?MEFiR1ZPKzlGelRvWTcycjlXczRsbW04anRic0NnQ3lXMGdLZmEyVEw5TENS?=
 =?utf-8?B?QVd4S2R3VXVMdkp1bW5jM3l6cE45VmlzcmxoTUpNWEtNMHFHWUVQNEJsdWw3?=
 =?utf-8?B?elplcDJTK2FkYm15dUlPL0FPY1JKd2VJY0dKQ0d0WlNoSnF1Z2NsT3hXRDR1?=
 =?utf-8?B?OGtFVmlOVnR2S2p1Z09SMVI0QkRkSUplVGhlcnc5WmFRRjliMWJ4TU9GSk9N?=
 =?utf-8?B?RVpjK054ZnpaVFZ0cERBU3pBMy91VnlYOU5MeXl0eUhlRkNqU0lyNGxMd05W?=
 =?utf-8?B?VzcwQUgyRkNZQktVZmFxeU0zKzduTitkc3Q2Q1NqMkFYT0lmNWV1SXZuNU14?=
 =?utf-8?B?VXVtWDRXNnVlLzk2NlpzSFFzbGcwZjFmcnp0VSthTXF5Y0N4Vi9sQXdLaURl?=
 =?utf-8?B?VEJJdmI0MVBUUE93UFkrcURSMU1xRG9oVkNiczRtRGFjNk1jdmRSVm1iMWdh?=
 =?utf-8?B?TG1vSmJaaHlZVjBpcGNKQzVtT1hSRFRKL3pQOG12M3RWUzQyc2VoNlMrNlZ4?=
 =?utf-8?B?TndCSjlsaWZjajNWR1MzYXMxN0prRlUwZjVUM0h4MFlYRkg1SmtOeXNXeDc1?=
 =?utf-8?B?WlAwTFhsQzV2dVljc2k0QS82VnlyUmRhdU9TZ1J5dzZxYXZyTzRaUHVxTFNU?=
 =?utf-8?B?VFNJTmdySm1id2hiWnZkQlFjTlpvb1ExdUdjQityeDlMNTR3K3N3d0VaNFdp?=
 =?utf-8?B?T3IyUDRzL0t4N1U1ZjFHY2prRklINldlSTVMU3pGZzVzWDhkN1pWL2dDUm1m?=
 =?utf-8?B?cno0ZzJ2WUpFVWM3VEo4SVpodmU4ODFpUFNzRlBiejZ2T1RqZmVJbEYzZkdV?=
 =?utf-8?B?akp6YlJvOTNuTVh0YXFlbG5MaTl6bkgxVzBWaksxUnhYZDY2S0pKRmcxTERk?=
 =?utf-8?B?dmtyS0VJSUp4bDVrd3FlRU9mOGYzV1dQVzF0QXZXbFJTR0xUMGFCdzE3eS9L?=
 =?utf-8?B?YTBvU2dBVTNRMzlKNTBNNitoaEFtRGVvckJuSGY3SElRVEhuWGJsSkQwVm9S?=
 =?utf-8?B?aEJmZi9DbGV1RVZEVnVLOFFlQ2tZaGpjb21xSDRQQVZLR0phV2JLeEMrSUNQ?=
 =?utf-8?B?MEZGYkZDTkVhTGc0UzhIVGl6MENERGFabWtjendMS3gxa2RYQlJFR2ZFZHFQ?=
 =?utf-8?B?K2xZRmFoRWdGQjkzUk1EMXJkdFdncHZwVEQ3YjFIV1Z3NVh1RXIzamo4cC9a?=
 =?utf-8?B?VnNIaGVaYnFualFjMGdXYjVpaGxwbVhZOXJqVnNkVnRnOGZsblRzVXVnRVlF?=
 =?utf-8?B?dnpGQjltMTQxVGhJOXp1VVQ2eUF4b0pGSDFseVpUWlRZUWluR2lMdEJqcU9R?=
 =?utf-8?B?b00zSmM2RVZtVmh6Q0U5V0dCRXUzOUFjTFdBL2pjTjl2c3VzZFJ3N3RKY0ty?=
 =?utf-8?B?OWV0K3pZU1ZXREJpRUFGZ0xvQWI2RnlMU0wzR0dWN050WlF3MmczNTIyTDd6?=
 =?utf-8?B?TFhrRHhEOEhPaTI2c2dwV3Z2eHNBVVpOeE5veXFEeDFiemZ6QXkwTGw4TDls?=
 =?utf-8?B?QnZIdERDZGRhZjkrT0FzWXZCRDVIQUhiQXVJMlE0cFRLNEh1MGQ5WitOL1lW?=
 =?utf-8?B?T3hOYjYyZWMzQ1RZS2FUZmdvNk5aT2NwN0RnRzNubEpDenJmYzdTT1diRUho?=
 =?utf-8?B?U1EvQjhpYXJrb1h3U09vL1VZR0FIOU4xSkJyejdJTVBuYkZwNm82LzlpcUdw?=
 =?utf-8?B?M1Bvd2F3a3VoMUh4V2ZQaFdFdWcyVWpvNUdnb1lBVzVEajJkU2cvOFpRQlRN?=
 =?utf-8?B?N2FkU1RjU01xQmlYeW94V1hrbEFZaDNjajI4STVPZ3o1a0N0S3c5WnhtckZy?=
 =?utf-8?B?MHMramU1T2xpRXQ3YmRqR0dHR2dTU0crc0JGUkRVSFBUUWttTjFpMXBGWmVx?=
 =?utf-8?B?TDZrK2RvbXdwSFpFT2NNUWxvbXNlUTVPNWRaZ25NQStsbzgwL3RzZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hkX+wA6ZU8BqqgQ2R846+zjMllurvpce/aEvtSqcb/5GAxoXHO1lZwBjln5DrhFCdAzs03Y+v7cZYyipcLCTvvy5MutK97cf0KJv5APOG7/JuxdhIQd6URWmID6OUksfrbAtf8fXf8CGgw1Qv7Z1NdrU4oxYloiGblf8nNX7a50/nAjN1PXLhBxIbHMLT6J7swbgQG/Wv9AjgMv4OpqH5yfbGnubYpHJoA8wO6YJzfxDOGoU4y9Nsu8yHzq7Genu+GWpoInVnoKmFTM3E+CUFunMA5qEPbtFHf+xAlZoM6U3Tx8n8LEZ2PSyeT2PJYbF9yoPwXc6tYYA0E9j5V35zqIE24zgBI6HOu0rMNn2y9+4SiZZtqmxhCZoH65Im4VyioqPszFcJViC27NrU+jOzocyA2cR73zpIG9ZTWJI4ra5N6aJ2jmQc+PtSwoJHTIeXi7ENpefK42C3fyPIxQkGbYdnJQFAtzlLmKRdGofwYQxkpxBPHcZe2tNSqlzgTjexXojZ2+3i3bHRLxdPlPO9nsHYjzXkoor72Mzo+dAUDKHBEc9qrfplFmU1kAZlxRykk1napxhSc2AORi42OixqfYz8qAKVGTfcb5VIE3KN+U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502d0a3c-7001-4681-3d07-08de6e654c40
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 20:44:08.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8f6//zvjFQ44mW0aP9kvScHBySvzpLlvmyPEayUYWuYD9G4q3SheQ0gBTiuFtqcNS8RA6cTp7TgjvN7AdZH64A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602170170
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE3MCBTYWx0ZWRfXzFSEvFiMJlg6
 397NfLmZLfXHXDpwLHtGAUUTIRXr3f0tOXzWpNanY12DaJ2O5+Qr+n4VB44ObaTPElDseqG3YEh
 FlYNCr40+UOaxDNOFuHAIviy0UX9pYQkDvvqYEGyxLg5oDPIqvh+cGUJx5FtEJmx6TgJPT3eczS
 gTcoPLVzztOHm5U5LQVHNIb+zmcFqSbvb40rbX88th1HUpOP6RifcvX5r88yRNR+bt3S68XuZm3
 83ewJ4rFm7W7MaEtR9QkAClw5oc+LlGWbz7sEBPQ9Zji0mkRx3kL5f43YYl7WWTI4AsrI207iEN
 WVzsOHkoZ/zD4udZVJNMX3tyAFtv8QxIoW5IaXRfBFLHJ1SpLC1D7+ZAy4wqZXjvV8IzFCVSqHv
 bbUpQTJ36eyRvyRpzfQr7cUf7b0YChK3/rVuD5mNlal/Lj9qkx6FCGBuQXWFjv757bIesfA8NJl
 d4pW7uLVd4x6v/IUFotI6HY5jPcEmGds8Hm/Qw1k=
X-Authority-Analysis: v=2.4 cv=O+w0fR9W c=1 sm=1 tr=0 ts=6994d31c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=KqgHed2GAYKmyWX67ugA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12254
X-Proofpoint-GUID: usjFswPc14qw0Upxy-hOcsTrYVNp-hjk
X-Proofpoint-ORIG-GUID: usjFswPc14qw0Upxy-hOcsTrYVNp-hjk

On 2/17/26 11:35, Kris Van Hees via DTrace-devel wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   Makefunctions | 2 ++
>   configure     | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/Makefunctions b/Makefunctions
> index 15836dc3..1f308967 100644
> --- a/Makefunctions
> +++ b/Makefunctions
> @@ -52,7 +52,9 @@ endef
>   # Rule to build a C source file.
>   # Syntax: $(call cc-template,primary,filename-without-dir,optional flags)
>   
> +ifndef WITHOUT_DEPENDENCIES
>   cc-dependencies = -MP -MMD -MF $(obj-name).deps -MT $(obj-name)
> +endif
>   
>   define cc-template
>   $(obj-name): $(src-name) $(foreach dep,$($(1)_SRCDEPS),$(call src-name,$(1),$(dep))) $(foreach prov,$($(1)_PROV),$(call hdr-name,$(1),$(prov))) $(CONFIG_H)
> diff --git a/configure b/configure
> index 04c28369..fadac05e 100755
> --- a/configure
> +++ b/configure
> @@ -172,6 +172,8 @@ for option in "$@"; do
>           HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
>           HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
>           HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> +        --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
> +        --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;

Maybe add these earlier/higher?  Where the other write_make_var settings 
are?

Also, should these options be documented?  Like in the file's help()?

(Come to think of it, how about --with-libctf and --with-libfuse3? 
Should they also appear in --help?)

>           *) echo "Unknown option $option" >&2
>              exit 1;;
>       esac
