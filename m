Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01E356754
	for <dtrace@lists.linux.dev>; Fri, 11 Sep 2026 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137152; cv=fail; b=kULxw+nvOu3GScORMczZmHqGhuBkFfvy8NQ4NXxNXdaVS56sbOpu8qr6nikFS3wQHuIyVgq2kngk+dHVQK7qZKopeCUhx0wBMcX5DI5rJyTldu241L+CL3eQMdXdz+rpEhHpB1UHa2JiDDF/r1D8rQ7wSP6gSgPgPFszMyotmmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137152; c=relaxed/simple;
	bh=iGPGMPf9/deJdlKuDvtyf7ttzuNirDDC6bF+E/riwRA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P1Z4yPUuN3BJAbeVeBTgmPV1UzshKRRpP8Ov+M1+flub9IFvW7+UAGbb51QOkU+9oxyQADhriJAZ2Hya0SQL/ejMQSL2B5ZNNvwZlOVQPbSffb06IkQ1nRFwompqrAO6HrMIF3pvTnoE/lpGuMzWVVNWYBB2q+15mRyv193n2rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T+hchlCb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=luLON6Bl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T+hchlCb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="luLON6Bl"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BDgewF2905128
	for <dtrace@lists.linux.dev>; Fri, 11 Sep 2026 14:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pyT1rGl+5tvwq5ZBi1r6RDU8FupgoN+FELiZmyFtGw0=; b=
	T+hchlCbWonTJEbp6YsKlA8vUwOHqynaAPAY0BXKtq6M8zNgY6Dk7+M4YLr13kgd
	+WLUMVP2kXxc+Z63qvY3qaJPByxSCv/D9FTYseY90LNRmyfeFL1CB/mq1cO3RMgf
	hfKJCD8X2wJ7LqSUDc15qKMRCnUIDm2fn+VJQbo71v4RFmLEttLlkhV2w05tS/uv
	2E6Wj63YAQ7pd+/ia4Jx0mVba8DhpzoB4WX4lxXHs84513xenhmZU6CDwkd+6dpz
	26/y/3DJkLBxyc5StDxKps4mkTJPy8waGuLN2ARypiiprRzd5hHuKQoCoIvlOMLQ
	efhdMZRIS9gherIMQSAlqg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gkcysb4jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Sep 2026 14:32:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68BETp8Q021130
	for <dtrace@lists.linux.dev>; Fri, 11 Sep 2026 14:32:26 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gkck69scw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 11 Sep 2026 14:32:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTzZojpx4BtHKl9ro3ub6r3+YRa6OIFM7Y0aDtx3HVs+mYxrHDh2ovGGsVmuS//nmRAnEg1BG/83MsjOVeVTVnXyzXntWQ3kSSjnKfvjVNkGd6vABcLfD52NYmofxZEEn3UFuITYEgkOlquesvcZ2SY+3cNSGxO09SvT/qzLF9/Cn50bl8anYvm1tq4McW2q5F93TI9+D4LvV65W4LLPd/l4L8uWN3Afal3WOvuj3y5S8h2R+RqY5PUUELzqUokTLszdT/nkDmelmdhWokQXcPGYSvAJAhS1ByY6YpOslBWgfYnAfbic0UWzYi4qOYsERHLUMh1scnK3GDSt7O6wTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyT1rGl+5tvwq5ZBi1r6RDU8FupgoN+FELiZmyFtGw0=;
 b=xsnY3dYirbieoHBz/8oVJB6vJpm/D7ht8CadL8WJ7Gkxy9TzBGh1MwZ2XlnBiJj+s4xweJxVPsTtGdWtMhIYJSI8cJzWOB9O194n7buEPdZaxEqizrWYEa4nKFRAc9TaEP6tquxT+OXBFbWlNz4D+L01yKCLMIEfNa243THQJm1Eg8Ul9BoX2+U2sxAj3KOCJ8jhtxgSfsG1IeXkYPk4cr49XR/FhAAwV6ZEg+YMSe65vWQsNWGJ7CSKeb/GLSCBjdfJMwlgeRA290UsFSoJaBP3hMarh1yAauDJXRfJk+zxPePMTUrCHBGp1ZuHRqpRATtCbpOjdbq0egncLIpHZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyT1rGl+5tvwq5ZBi1r6RDU8FupgoN+FELiZmyFtGw0=;
 b=luLON6BlW2Wpmn29YSd17pnnfNfYx+mNpSAOiw4B2blMKs2pqETjjh2K1QcPNYHwiii4fvRHCTm7aHDzpsw+RX1ZsE8FRMK/veS5AcCy1Moau8Vp/TUsMMdk9FuZAcX2ONDVxlA+y2AGeIozq6lTYbFmYkAsH1qexY1+GT8BJlg=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by PH7PR10MB6228.namprd10.prod.outlook.com (2603:10b6:510:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Fri, 11 Sep
 2026 14:32:17 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%5]) with mapi id 15.21.0428.004; Fri, 11 Sep 2026
 14:32:17 +0000
Message-ID: <db4e2a3f-fbe9-4d3c-9b48-57ee5f2a9f59@oracle.com>
Date: Fri, 11 Sep 2026 15:32:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] parser: validate scoped external names
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <5de2ae24696627e3c3b28afc4a49e51f@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <5de2ae24696627e3c3b28afc4a49e51f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|PH7PR10MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 7676b7a7-65c2-4572-9d34-08df10117a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|13003099007|3023799007|10067099003|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	T1zHO0W2dWSip5KG0cSKse90YL+QQ/dyui7rHpHt9Sx2wnysxMaRdmrKcPrmeDYscsgOgKJWUcfoyAVCQEIHwKrqzkPvGY+gfEfkx+nIHVeeDPOKjsN+AGCGH7z5H/ZnKFnIDtzYaf+vLkO5Zv//0Y8WPMKeA/f0DYRH0Q7LdPHen3caiQ6rtVjrSyREifyFsDtsyDvEfQxeZLti6krZ3PKoJIvdEmaCxDoVbf6280TAopDA2SNSbyUnzyHxJJLOIIem8/Bh9OPBUA9oOFuOfA7jJBsJ+qr2198e34XPyq9ErRxMSslVEQZUst6TnH3dBKtB3r0Kre3LmOvSsb7DnfkJsO0EAoMR7DHFzsQJ9l+rkT26+qkyGI6ciisoaD8ESR0BzvKF0n+DEMzGe58oH2VP++PrDx1LAyNuXfmpb2IJdgI/QljefNYlkezDkbfFcMSaw7VdhiDyUoDFj5KTnb81S1LIZibM8FN8rz11D0aN/Ijmgv/OKPHAbcRTEPaOpHPxn1Ghz2JAVQbA4r3n0fbNu7WupfSs2PzP2lA+PVTI+w9BEIxrqDli1g98lPQn2YvCfRU7mVlaZgcfs6gtOU7YBjhVQTC2UNVpXyECQG3C8Vuhgf8F9jmL9rB2r3xUc0fZyN7G95z7WYyiOGF65Z3ooMSy5R3B6GO3P/jn/dI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(13003099007)(3023799007)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkxyZEY0aUZZY1ZNTXhOWmVJdDE1V0RXY0RCWnh6MzhORy96TjM0bVFrM3N0?=
 =?utf-8?B?NXduUFhMT1RHZ2xmekdUc3NUVWM2YkhseVBXaDlEcnl1VXJaWHBpcjc0b0RH?=
 =?utf-8?B?NDNJa21aYzJlSzRydldDcEhXdDExUjc2TTJJUEl4LzhYSmtUL0dYRXdTU3F2?=
 =?utf-8?B?MFFqRjVSNkxoYWEzaHJja1QxcnF0bm5hRFhHajRqVGswbnlXVUp0LzhPOWlV?=
 =?utf-8?B?eG9nTS96dklkeGl4U2ZFSUJpNk1BcmVlbktTdCt4YUhQZzZoZ0dXL2UyeFdD?=
 =?utf-8?B?REtIT0hYb2VaNGJGVzA0NElKZG92djljRW1QbFpJNktSWkhWREY1YkgwaGhU?=
 =?utf-8?B?NlcycDJIUHJ1Tlp5ZElaZDBwZUovODE2U2lVbnMvNzVybjF5eWJrQ3dXYkh1?=
 =?utf-8?B?WlByYlNFOXBVMWxJMFhrK2RLU0JCVWh6WEI4Ymdack5sU09zOUx1eUg5Vitk?=
 =?utf-8?B?MGJJSkJKZnhnaTRUSkFpN0JjSzJidDFDanJ5clBjc3I3NGJwVnV6bjVUNGlI?=
 =?utf-8?B?SEJtSTBDTkw3QUV6K1JhS2dUZm42MDg4anJoNXJkZHhza1BEbU1ERVAyU3hE?=
 =?utf-8?B?M0thZzhRY0t0alAyZURHWDlZRTRlS0ltdjErampoRGp4NE5rK203dnZFNUds?=
 =?utf-8?B?RXVOWDJkYnFuemYzRWZUTDF1MVNHWjZ1dHFCUjk3RTZIRkt4TElxWWprdkZs?=
 =?utf-8?B?WVgwVGNMY0FKRk5td0NjRFRSc3pUR2pncHBWa1hPeWdndkhrNDlzV2FSV1NJ?=
 =?utf-8?B?UlF4V3FVNlNFVVJreUY2M3FiL1UxTWM3UThvTnR6TUZ0NG1rYy9lSmp1cDlx?=
 =?utf-8?B?YUlYNmFDdm9KclNrUWtUL25TMVJmN0dnRW0wVHZ0M294QlRsbXQ4eEJDQXZ1?=
 =?utf-8?B?RFh1UVBnQW9LZmRjWjY0c3MvbzkrSnBkR2NYSFVxdXBlR1JHRC8reGE0SU9j?=
 =?utf-8?B?NGlWcDhva0JzS1V6cjloWnlhU0Vkd3QrWnlKbVpvQUJkakxjVUZicWZuS2ho?=
 =?utf-8?B?djNFbk52d1Q1SEJQQWFTM2tGOFNRdHNjL0lSS296ZVJVb3Q1YjFQMnVrV3di?=
 =?utf-8?B?eDlYSXFiVHVmYmJ2dXpWVnJMK2dYRXpvbkNmRzJBYTRSZGZKdkVSakhoYTBo?=
 =?utf-8?B?RnRROGJIbFB1clVQSkRIdEoyMG12ZXlNOHNGWlVMSHAwR3lWRkREUGZVRXE1?=
 =?utf-8?B?QVhaS2h2SlFTRWQrdHV4WkxVQStjZnRIQVk3amZYMzdrUGJmbGlpY0g4MzVu?=
 =?utf-8?B?ZnRoSTl0dU15Y1d4UEFOUWVpYUdwdnA5Yk43cmlQMUpOUXlTb2thMWV4UzNQ?=
 =?utf-8?B?Sm5RMHU4SGMyTElab09YdXhDZEpLVEZ1Wm9IN0ZRTGlNRVROY0lTWWQ5cEJ0?=
 =?utf-8?B?OUMvRFNGN2FZMnpFVFFzV3dnanRaQU9SdDZxTlNGN1pacmJ4R0tSRlhJZjZ4?=
 =?utf-8?B?VGwrckhFK2tDTENuRmFuNFJpUnBVV0wyVXo1OTVieHQ3bmFEekNxUTlRRmZB?=
 =?utf-8?B?WWwwTTFOaGovVmdtRHFTKzZYMENCMGV1azY3ckFwRElwSFhZa3NQWEVBUGFB?=
 =?utf-8?B?UmZRbVNsRThYUkJydHF0SjZITDJuMDdGTDgwME9helFZc3oweW9JVlJvc0tR?=
 =?utf-8?B?WE5Mc01VUjhxZklFODFTMzhrUDlsUkI0bHdudjhUUDlRY0F2U2VGYWxSU3Ry?=
 =?utf-8?B?MkdHWjBzZzBLN3Aza24wYVpONnVrdGsvcmQ5YjArQ0hvTG15aEI1T3RCclJr?=
 =?utf-8?B?UTcxZHU4ZU9wcVNYdlZ4b0tLK0F5TlQ0ckk0dkJ5WkRxNVNyb2ZhNXQyWkZ1?=
 =?utf-8?B?NklRRDIxenRFNDlvaE1OQ2thRDFkTVZBRXhWN1F2aEU1SXBIN1pqYUpRLzhV?=
 =?utf-8?B?bzVrWmFMZXN0aVdWMDRPNVV1Zk5FSGMrTE5UZnlUUS8vMHd5bW9UZ2kxNVQr?=
 =?utf-8?B?dU1DbFBmNS9BWkY1RWZrWjJ1Vy9JMndHN3NqRUVmdjR3OGtqOEZ5T1ZrbkZ0?=
 =?utf-8?B?Qlc3U1BWNjh5MkozTUtnT2U5L25hcmEwWDdsOGs3eUd4bGNhS3Q1elpzRkhs?=
 =?utf-8?B?cWh5eDc3T2RTZmZkNTdycllxLzVIMUlXbG1Ec0dlNU5MR1U0RVFHSzhpckdz?=
 =?utf-8?B?V3BVMmwzdFVaTDRuZ1NEd2ZTZW5GRTBHenFQcjRXdWh4SXNxbXBhOS9NbTZB?=
 =?utf-8?B?amU2aDR3UTFENDdWN3Z6R2s4L29QR3lqd0t6VHBWQ2ZMMTVBcnRnanBMVU10?=
 =?utf-8?B?OWxhUzRid212czBrWTVnbUVKOHByOHlaWklCTlV2cVBjckdmbjlEaFVHcmpz?=
 =?utf-8?B?TmhzOVl6Y3lyWmVUcEpha2RSUmFQaGRtNlBJNURUUmczRjN1YklWQT09?=
X-Exchange-RoutingPolicyChecked:
	2S34U5RUwf84Ko7DsMUjUo8eGGH8qNBzIEYYMlfAa0JCBXrKG3YjwiQ/tWFJg7S8CtamfjxjA1JKsAzvXk6ciTIYy0ODXW1OwbLehv1NPtAUtULdKnx0VF4iCvF1kfrwxCHmBfSCMb8qdRNfyqsezL+ogAt0xsnKfrerkeZego5WF3R8GdpKPSXj/pCbiBQX6zmH9h8ncY8OPi658KW4L/wI2o1+xNgxoT1IAjJUHIWJXBhaoLXQGs60AlmgLKTnzcD9mz5V87wR4B8C1OO/63xJ3K4ARAZYAsboevhgOJaQXlX+66ziv9GRvrOzdxlzrY5+a/Vj59ribX4pyZlU9Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qXyqr/ZxEs+r0HaaF6UdXRIjLLrRA0Z9EcoLpSbNZj39CeADSJ4IHJURppSwIZPsZJnN4i+Kl4z6BOY5szGZfUNglmaFs1w2jj/fGmKynUyIV2p1ET4xOyGp9sD47vGziGkKkLVLKeRlfU41atXP1RGqutYwqtAUm9OYnapxrJXKoEjcckVDz91jM6ySvHDrzuLkXqzWgl7g7JnV5N7DdqC+ul+00BDJFR2QkHzTKr9RA1nOSoFPOymCqgpJD56cO0ucViZ46zAMeU9EjNQOL2MV+g6Riuj0P4YaHl9wQT+oFIco+/NhqrTeSsuwYcknzMdNUDwZW2cmThEVoyG9S7UmV7ep5WR1etbdjb8eT1lG3OVu29VSRVkgJjCIDJgalnN5iVIAodLonCVPYaY5XrCQB4uD3DJzhMOmeDR6wafAmvRwHyPnCPSc4mhuXAKv/r5FPNxIWXOsLOqhxiF64bxkc/3JqqPYAW7l7Fvza0pcS1ToIem6sZv52kLR5dZttv63nFQLxfrHPsOl6+9vDJ7vK2Im7d1xcVLT3JkQPWODT2jLy0yyw+SGx00HtPyeAMydUMfLFw8phy/4Kl5p9RorAMvRXyLy+lP4ilkFCZo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7676b7a7-65c2-4572-9d34-08df10117a8e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:32:17.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otRka5/JKrhYxpYDpawKGd5cwF95BDSF5GSKDWCHFx1ouWO2Pe4kC3JVnpLxKeSc3VfnmvJZJ11pEBbpY4CKWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6228
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609110203
X-Authority-Analysis: v=2.4 cv=KNfPn1Fo c=1 sm=1 tr=0 ts=6aa410fb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=-ns1qNvnEmm_TH0S-uIA:9 a=rEqNaWj0-quomjz8:21 a=QEXdDO2ut3YA:10
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMyBTYWx0ZWRfXwU/zprSYIO0J
 w6jvE6fWucR5OrshZAbLTmP2iokLmVq1AtlRgShR2ZCjVBTQP9h2JZVZJVVQUw6/WG8fg5YHnUV
 fMHMpFcc4mlpBsNotw8O6HZ5We6xMsX5Qg0TJDzHHxaBQ/4uh1FvCFvu+nYul7s5g7VX3XPSILZ
 HhZMx+Kkq/DhOvnboOB+6oNFopbCNwiNHHak9UaCJ5/dsDjmiApO/yhOXUlFa31Bk8ddSPbivMH
 OKeJivuot+4yPy4s6Y0rSMCj4F2yd2nPt+mgk03tS5IAbTHE5QGm+4iR8H3ZOFWsNUCu241rYIN
 TocqLhIQe/jVlRQFdJ96eB7WdJpmHnhjOmku32aEQHejnUI7YbTBYWohITerLbClxGuCN3QaCsu
 Q6xen8O4AeGUjx7McAXfXMfjtDpa5dnf8tbUzfPhtnd3As2dSP1LMc/pXU66QE6Yaret97P6L5j
 2ysqCyRQQFMtajh4T/A==
X-Proofpoint-GUID: Bq6dtyi6fDQ0zFpGxQndwCJSL0s3yB7U
X-Proofpoint-ORIG-GUID: Bq6dtyi6fDQ0zFpGxQndwCJSL0s3yB7U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMyBTYWx0ZWRfX7rqfrZTnz7tX
 M+huZV+YXt+SpEK6GUzowHIzJPozFvl9vtCK74VeQ9NMwaUkbQg0mnmox01HTISLPos98FG4w0F
 8Q2UlrDxxVeZGsjKr7r58egNLxrhcHwliwfdYcFAdme80odmLI27

On 28/08/2026 19:48, Kris Van Hees via DTrace-devel wrote:
> Centralize parsing of D scoping markers used by external type and symbol
> references.  The helper now returns the resolved scope and identifier
> pieces, supports kernel and userspace markers for both type and symbol
> lookup, and rejects empty operands, runs longer than two backticks, and
> repeated scoping markers as D_SYNTAX instead of falling through to lookup
> failures.
> 
> Recognize dotted scoped identifiers as a single lexer token so module
> names like foo.bar resolve as one external symbol reference.
> 
> Add lexer and type regression tests for malformed scoped identifiers,
> dotted scopes, empty scope operands, scope-kind mismatches, and scoping
> operators in declarations.  Update the sizeof unknown-symbol test to use
> a non-empty symbol name.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

One AI-assisted issue found here I think; D allows us to scope type references IIRC; i.e.

struct vmlinux`task_struct *task;

or sizeof(struct vmlinux`task_struct)

However the backtick support here also allows a backtick in local type declarations
which doesn't make sense:

struct vmlinux`task_struct {
      int replacement;
};

We can likely distinguish type declaration (no ` allowed) from scoped variable
declaration in dt_decl_sou()/dt_decl_enum() but I think we need to do so.
 
> ---
>  libdtrace/dt_decl.c                           |   6 +-
>  libdtrace/dt_lex.l                            |   5 +
>  libdtrace/dt_parser.c                         | 140 ++++++++++++------
>  libdtrace/dt_parser.h                         |   1 +
>  .../err.D_IDENT_UNDEF.scope-dot-kernel.d      |  19 +++
>  .../err.D_IDENT_UNDEF.scope-dot-kernel.r      |   2 +
>  .../lexer/err.D_IDENT_UNDEF.scope-dot.d       |  19 +++
>  .../lexer/err.D_IDENT_UNDEF.scope-dot.r       |   2 +
>  .../err.D_SYM_BADREF.scope-kernel-as-user.d   |  18 +++
>  .../err.D_SYM_BADREF.scope-kernel-as-user.r   |   2 +
>  .../err.D_SYM_BADREF.scope-user-as-kernel.d   |  20 +++
>  .../err.D_SYM_BADREF.scope-user-as-kernel.r   |   2 +
>  .../err.D_SYNTAX.scope-empty-bare-user.d      |  19 +++
>  .../err.D_SYNTAX.scope-empty-bare-user.r      |   2 +
>  .../lexer/err.D_SYNTAX.scope-empty-bare.d     |  19 +++
>  .../lexer/err.D_SYNTAX.scope-empty-bare.r     |   2 +
>  .../lexer/err.D_SYNTAX.scope-empty-dot-user.d |  19 +++
>  .../lexer/err.D_SYNTAX.scope-empty-dot-user.r |   2 +
>  .../lexer/err.D_SYNTAX.scope-empty-user.d     |  19 +++
>  .../lexer/err.D_SYNTAX.scope-empty-user.r     |   2 +
>  .../unittest/lexer/err.D_SYNTAX.scope-empty.d |  18 +++
>  .../unittest/lexer/err.D_SYNTAX.scope-empty.r |   2 +
>  .../lexer/err.D_SYNTAX.scope-multiple.d       |  19 +++
>  .../lexer/err.D_SYNTAX.scope-multiple.r       |   2 +
>  .../lexer/err.D_SYNTAX.scope-triple.d         |  19 +++
>  .../lexer/err.D_SYNTAX.scope-triple.r         |   2 +
>  test/unittest/lexer/tst.scope-user-explicit.d |  22 +++
>  .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d  |   2 +-
>  .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r  |   2 +-
>  .../err.D_DECL_SCOPE.scopeop-enumerator.d     |  16 ++
>  .../err.D_DECL_SCOPE.scopeop-enumerator.r     |   2 +
>  .../types/err.D_DECL_SCOPE.scopeop-ident.d    |  19 +++
>  .../types/err.D_DECL_SCOPE.scopeop-ident.r    |   2 +
>  .../types/err.D_DECL_SCOPE.scopeop-member.d   |  16 ++
>  .../types/err.D_DECL_SCOPE.scopeop-member.r   |   2 +
>  35 files changed, 414 insertions(+), 51 deletions(-)
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
>  create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
>  create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
>  create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
>  create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.r
>  create mode 100644 test/unittest/lexer/tst.scope-user-explicit.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
> 
> diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
> index 1f4936dd..68999422 100644
> --- a/libdtrace/dt_decl.c
> +++ b/libdtrace/dt_decl.c
> @@ -233,10 +233,8 @@ dt_decl_spec(ushort_t kind, char *name)
>  	ddp->dd_kind = kind;
>  	ddp->dd_name = name;
>  
> -	if (name != NULL && strchr(name, '`') != NULL) {
> -		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
> -		    "in a type name\n");
> -	}
> +	if (name != NULL && dt_scope_parse(name, NULL, NULL) < 0)
> +		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", name);
>  
>  	return dt_decl_check(ddp);
>  }
> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> index fd70aa0a..bf133676 100644
> --- a/libdtrace/dt_lex.l
> +++ b/libdtrace/dt_lex.l
> @@ -50,6 +50,7 @@ static size_t dt_input(char *buf, size_t max_size);
>  RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
>  RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
>  RGX_IDENT	([a-zA-Z_`][0-9a-zA-Z_`]*)|([0-9][0-9a-zA-Z_]*`[0-9a-zA-Z_`]*)
> +RGX_SCOPE_IDENT	[0-9a-zA-Z_][0-9a-zA-Z_]*(\.[0-9a-zA-Z_]+)+``?[0-9a-zA-Z_]+
>  RGX_INT		([0-9]+|0[xX][0-9A-Fa-f]+)[uU]?[lL]?[lL]?
>  RGX_FP		([0-9]+("."?)[0-9]*|"."[0-9]+)((e|E)("+"|-)?[0-9]+)?[fFlL]?
>  RGX_WS		[\f\n\r\t\v ]
> @@ -299,6 +300,7 @@ if (yypcb->pcb_token != 0) {
>  			return DT_TOK_INT;
>  		}
>  
> +<S0>{RGX_SCOPE_IDENT} |
>  <S0,SIDENT>{RGX_IDENT}	{
>  			return id_or_type(yytext);
>  		}
> @@ -728,6 +730,9 @@ id_or_type(const char *s)
>  	int c0, c1;
>  	dt_ident_t *idp;
>  
> +	if (dt_scope_parse(s, NULL, NULL) < 0)
> +		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", s);
> +
>  	if ((s = yylval.l_str = strdup(s)) == NULL)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
>  
> diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> index e71c0985..1fd0f5b4 100644
> --- a/libdtrace/dt_parser.c
> +++ b/libdtrace/dt_parser.c
> @@ -168,45 +168,96 @@ opstr(int op)
>  	}
>  }
>  
> +/*
> + * Parse the D scoping mark used in external type and symbol names.  A scoped
> + * name can contain one mark only: ` for kernel scope, or `` for user scope.
> + * Longer runs and repeated marks are malformed.  Return the scope kind as 0
> + * for no scope, 1 for kernel scope, or 2 for user scope.
> + */
>  int
> -dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
> +dt_scope_parse(const char *s, const char **scopep, const char **identp)
>  {
> -	static const char delimiters[] = " \t\n\r\v\f*`";
> -	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
> -	const char *p, *q, *end, *obj;
> +	static const char delimiters[] = " \t\n\r\v\f*";
> +	const char *mark = strchr(s, '`');
> +	const char *scope;
> +	size_t marklen = 1;
> +
> +	if (mark == NULL) {
> +		if (scopep != NULL)
> +			*scopep = DTRACE_OBJ_EXEC;
> +		if (identp != NULL)
> +			*identp = s;
> +		return 0;
> +	}
>  
> -	for (p = s, end = s + strlen(s); *p != '\0'; p = q) {
> -		while (isspace(*p))
> -			p++;	/* skip leading whitespace prior to token */
> +	if (mark[1] == '`') {
> +		marklen = 2;
> +		if (mark[2] == '`')
> +			return -1;
> +	}
>  
> -		if (p == end || (q = strpbrk(p + 1, delimiters)) == NULL)
> -			break;	/* empty string or single token remaining */
> +	if (mark[marklen] == '\0')
> +		return -1;
>  
> -		if (*q == '`') {
> -			char *object = alloca((size_t)(q - p) + 1);
> -			char *type = alloca((size_t)(end - s) + 1);
> +	if (strchr(mark + marklen, '`') != NULL)
> +		return -1;
>  
> -			/*
> -			 * Copy from the start of the token (p) to the location
> -			 * backquote (q) to extract the nul-terminated object.
> -			 */
> -			memcpy(object, p, (size_t)(q - p));
> -			object[(size_t)(q - p)] = '\0';
> +	for (scope = mark;
> +	    scope > s && strchr(delimiters, scope[-1]) == NULL; )
> +		scope--;
>  
> -			/*
> -			 * Copy the original string up to the start of this
> -			 * token (p) into type, and then concatenate everything
> -			 * after q.  This is the type name without the object.
> -			 */
> -			memcpy(type, s, (size_t)(p - s));
> -			memcpy(type + (size_t)(p - s), q + 1,
> -			    strlen(q + 1) + 1);
> +	if (scope == mark)
> +		scope = marklen == 2 ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
> +
> +	if (scopep != NULL)
> +		*scopep = scope;
> +	if (identp != NULL)
> +		*identp = mark + marklen;
> +
> +	return marklen;
> +}
> +
> +int
> +dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
> +{
> +	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
> +	const char *scope, *ident, *start, *obj;
> +	int scopekind;
> +
> +	scopekind = dt_scope_parse(s, &scope, &ident);
> +	if (scopekind < 0)
> +		return dt_set_errno(dtp, EDT_BADSCOPE);
>  
> -			if (strchr(q + 1, '`') != NULL)
> -				return dt_set_errno(dtp, EDT_BADSCOPE);
> +	if (scopekind > 0) {
> +		char *type;
> +
> +		/*
> +		 * If there is no explicit object before the mark, search all
> +		 * kernel or user objects depending on the mark width.
> +		 */
> +		if (scope == DTRACE_OBJ_KMODS || scope == DTRACE_OBJ_UMODS) {
> +			start = ident - scopekind;
> +			obj = scope;
> +		} else {
> +			size_t objlen = (size_t)(ident - scope) - scopekind;
> +			char *object = alloca(objlen + 1);
>  
> -			return dtrace_lookup_by_type(dtp, object, type, tip);
> +			memcpy(object, scope, objlen);
> +			object[objlen] = '\0';
> +			start = scope;
> +			obj = object;
>  		}
> +
> +		/*
> +		 * Copy the original string up to the start of this token
> +		 * into type, and then concatenate everything after the scoping
> +		 * mark.  This is the type name without the object and mark.
> +		 */
> +		type = alloca((size_t)(start - s) + strlen(ident) + 1);
> +		memcpy(type, s, (size_t)(start - s));
> +		memcpy(type + (size_t)(start - s), ident, strlen(ident) + 1);
> +
> +		return dtrace_lookup_by_type(dtp, obj, type, tip);
>  	}
>  
>  	if (yypcb->pcb_idepth != 0)
> @@ -2767,9 +2818,10 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  	dtrace_syminfo_t dts;
>  	GElf_Sym sym;
>  
> -	const char *scope, *mark;
> +	const char *scope, *ident, *markstr;
>  	uchar_t dnkind;
>  	char *name;
> +	int scopekind;
>  
>  	/*
>  	 * Look for scoping marks in the identifier.  If one is found, set our
> @@ -2779,18 +2831,16 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  	 * Otherwise we set scope to DTRACE_OBJ_EXEC, indicating that normal
>  	 * scope is desired and we should search the specified idhash.
>  	 */
> -	if ((name = strrchr(dnp->dn_string, '`')) != NULL) {
> -		if (name > dnp->dn_string && name[-1] == '`') {
> -			uref++;
> -			name[-1] = '\0';
> -		}
> -
> -		if (name == dnp->dn_string + uref)
> -			scope = uref ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
> -		else
> -			scope = dnp->dn_string;
> +	scopekind = dt_scope_parse(dnp->dn_string, &scope, &ident);
> +	if (scopekind < 0) {
> +		xyerror(D_SYNTAX, "syntax error near \"%s\"\n",
> +		    dnp->dn_string);
> +	}
>  
> -		*name++ = '\0'; /* leave name pointing after scoping mark */
> +	if (scopekind > 0) {
> +		uref = scopekind == 2;
> +		name = (char *)ident;
> +		*(char *)(ident - scopekind) = '\0';
>  		dnkind = DT_NODE_VAR;
>  
>  	} else if (idkind == DT_IDENT_AGG) {
> @@ -2810,7 +2860,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  	 * errno appropriately and that error will be reported instead.
>  	 */
>  	dt_set_errno(dtp, EDT_NOVAR);
> -	mark = uref ? "``" : "`";
> +	markstr = uref ? "``" : "`";
>  
>  	if (scope == DTRACE_OBJ_EXEC && (
>  	    (dhp != dtp->dt_globals &&
> @@ -2902,13 +2952,13 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  				xyerror(D_SYM_MODEL, "cannot use %s symbol "
>  					"%s%s%s in a %s D program\n",
>  					dt_module_modelname(mp), dts.object,
> -					mark, dts.name,
> +					markstr, dts.name,
>  					dt_module_modelname(dtp->dt_ddefs));
>  			}
>  
>  			xyerror(D_SYM_NOTYPES, "no symbolic type information "
>  				"is available for %s%s%s: %s\n",
> -				dts.object, mark, dts.name,
> +				dts.object, markstr, dts.name,
>  				dtrace_errmsg(dtp, dtrace_errno(dtp)));
>  		}
>  
> @@ -3014,7 +3064,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  
>  	} else if (scope != DTRACE_OBJ_EXEC) {
>  		xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
> -		    dnp->dn_string, mark, name,
> +		    dnp->dn_string, markstr, name,
>  		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
>  	} else {
>  		xyerror(D_IDENT_UNDEF, "failed to resolve %s: %s\n",
> diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
> index d74d658a..b9149220 100644
> --- a/libdtrace/dt_parser.h
> +++ b/libdtrace/dt_parser.h
> @@ -211,6 +211,7 @@ extern dt_node_t *dt_node_tstring(dt_node_t *, uintmax_t);
>  extern dt_node_t *dt_node_link(dt_node_t *, dt_node_t *);
>  extern dt_node_t *dt_node_cook(dt_node_t *, uint_t);
>  extern void dt_cook_taint_alloca(dt_node_t *, dt_ident_t *, dt_node_t *);
> +extern int dt_scope_parse(const char *, const char **, const char **);
>  
>  extern dt_node_t *dt_node_xalloc(dtrace_hdl_t *, int);
>  extern void dt_node_free(dt_node_t *);
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
> new file mode 100644
> index 00000000..2a267567
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Dotted kernel module scopes lex as a single external symbol
> + * reference.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo.bar`baz);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
> new file mode 100644
> index 00000000..89a9f9c5
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Module is no longer loaded
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
> new file mode 100644
> index 00000000..6b3dcfda
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Dotted userspace module scopes lex as a single external symbol
> + * reference.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo.bar``baz);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
> new file mode 100644
> index 00000000..7734e29f
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Module is no longer loaded
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
> new file mode 100644
> index 00000000..d332191b
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
> @@ -0,0 +1,18 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Kernel symbols cannot be referenced using userspace scoping.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(vmlinux``major_names);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
> new file mode 100644
> index 00000000..718b2b31
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d: [D_SYM_BADREF] line 16: kernel module 'vmlinux' symbol 'major_names' may not be referenced as a user symbol
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
> new file mode 100644
> index 00000000..bc7e8b9f
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
> @@ -0,0 +1,20 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: testprobe */
> +
> +/*
> + * ASSERTION: Userspace symbols cannot be referenced using kernel scoping.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(&testprobe`main);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
> new file mode 100644
> index 00000000..87169597
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d: [D_SYM_BADREF] line 18: user module 'testprobe' symbol 'main' may not be referenced as a kernel symbol
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
> new file mode 100644
> index 00000000..d7cff89f
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A bare userspace D scoping operator with an empty identifier is a
> + * syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(``);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
> new file mode 100644
> index 00000000..8e9cd1ff
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d: [D_SYNTAX] line 17: syntax error near "``"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
> new file mode 100644
> index 00000000..44b4f60e
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A bare D scoping operator with an empty identifier is a syntax
> + * error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(`);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
> new file mode 100644
> index 00000000..bbba5fe8
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d: [D_SYNTAX] line 17: syntax error near "`"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
> new file mode 100644
> index 00000000..5ead7b3e
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A dotted userspace D scoping operator with an empty identifier is
> + * a syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo.bar``);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
> new file mode 100644
> index 00000000..b07c07b1
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
> new file mode 100644
> index 00000000..d3a927d7
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A userspace D scoping operator with an empty identifier is a
> + * syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(bar``);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
> new file mode 100644
> index 00000000..dbf319ea
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
> new file mode 100644
> index 00000000..e32b3812
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
> @@ -0,0 +1,18 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A D scoping operator with an empty identifier is a syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo`);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
> new file mode 100644
> index 00000000..d78728b2
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty.d: [D_SYNTAX] line 16: syntax error near "foo`"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
> new file mode 100644
> index 00000000..5e236c45
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Multiple D scoping operators in one identifier are a syntax
> + * error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo``bar``baz);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
> new file mode 100644
> index 00000000..cefc56ad
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-multiple.d: [D_SYNTAX] line 17: syntax error near "foo``bar``baz"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.d b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
> new file mode 100644
> index 00000000..41f7391c
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: More than two consecutive D scoping operator characters are a
> + * syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo```bar);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.r b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
> new file mode 100644
> index 00000000..4474c502
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-triple.d: [D_SYNTAX] line 17: syntax error near "foo```bar"
> diff --git a/test/unittest/lexer/tst.scope-user-explicit.d b/test/unittest/lexer/tst.scope-user-explicit.d
> new file mode 100644
> index 00000000..2d649f6f
> --- /dev/null
> +++ b/test/unittest/lexer/tst.scope-user-explicit.d
> @@ -0,0 +1,22 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: testprobe */
> +/* @@runtest-opts: -e */
> +
> +/*
> + * ASSERTION: Explicit userspace module scoping resolves as a userspace
> + * external symbol reference.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(&testprobe``main);
> +	exit(0);
> +}
> diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
> index 56c93d43..4de9322d 100644
> --- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
> +++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
> @@ -16,6 +16,6 @@
>  
>  BEGIN
>  {
> -	printf("sizeof(`): %d\n", sizeof(`));
> +	printf("sizeof(`unknown_symbol): %d\n", sizeof(`unknown_symbol));
>  	exit(0);
>  }
> diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
> index 462469b7..0f46ad1e 100644
> --- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
> +++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `: Unknown symbol name
> +dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `unknown_symbol: Unknown symbol name
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
> new file mode 100644
> index 00000000..51068c20
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in enumerator names.
> + */
> +
> +#pragma D option quiet
> +
> +enum scopeop_enum {
> +	foo`bar
> +};
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
> new file mode 100644
> index 00000000..06ef912b
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in an enumerator name (foo`bar)
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
> new file mode 100644
> index 00000000..6042e208
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in declaration names.
> + */
> +
> +#pragma D option quiet
> +
> +int foo`bar;
> +
> +BEGIN
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
> new file mode 100644
> index 00000000..7b2e6797
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a declaration name (foo`bar)
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
> new file mode 100644
> index 00000000..5fe36a00
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in struct member names.
> + */
> +
> +#pragma D option quiet
> +
> +struct scopeop_struct {
> +	int foo`bar;
> +};
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
> new file mode 100644
> index 00000000..978ef79d
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in a member name (foo`bar)
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

