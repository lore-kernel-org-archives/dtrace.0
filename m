Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC9A1C84D7
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 23:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495005; cv=fail; b=oonTw8klMkIRAbntIikdUDdOHJQeouXC0o5aeOjCMv+hdIurzuA20/QTfKv3UNmJbnG9X5fIGNV/iY4VRkK+oo+RqeiHhjW8fD+XDHyn6chvzemtzIsHspDMZ1yR4nUyH6rnQ0To3MqtJdF7bGn8ha/qGXveAZonHCEss9BhYYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495005; c=relaxed/simple;
	bh=qF3u3xbgsJnF/flR89hNjf80aEyBsjjuUOSmaz3KwIY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mWNM65wnKih/hk5ZecQNdTdz9KOO458JKrV1qas7oM4tnxs44jV6n9ZpeiiClkdOn/IePiZJU+aKhCDsTjwBK+FZzkPD6U2Dzv2hGXaqAYxTz2l0Ge9eWDGT/iAQkWa7c9kYyaWhZWMefUfDwmWdGqGlb4BRoppvWdq3p6SIJyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FO1JwQCJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OQ4ckYIA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FO1JwQCJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OQ4ckYIA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBKZ0Ru2358288
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 23:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hk1L8SjdBV/HPtED33JXV4aGrKGSB7CQGPstm1RbEzg=; b=
	FO1JwQCJX7a8nUdtcJI/WCqqW1mapztV4ChCJRGq8Z8eFCTB5VD6ZthiNNFrInhJ
	8k+0vVvWMSwxIezhuDkqRIVNvSaTHvOd12bNsjfHbncPVt73rkA4a7EPE/RIzAKC
	wppHC2P5QzVFQywtqm9wpJKL5ru4W1ylbexA/mk41qoa57O8qLMui4FQtDaPO6Qf
	bOus+qcQkyiQkrOVCZdDi0QNHPM2WheX7TsKoi6VjkToPcGJUws7A6wh0dZtPbnp
	oiBkNHSpgnaDEroPnQp8aJIETR2KzkAFPXAmAuGkFTOpFCdykgx5MWXW+GigHUwt
	e8uwRYIJfR2zpZE0wMQW4A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ay9y32ww3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 23:16:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBKln3J040635
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 23:16:41 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxp65j2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 23:16:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSIChIBbrR+WOEL7uBrENh6LreB2ffB8MlwRSfd/D5NNCaifzA6WM1Q91A238TGIbAJBx7xiDJYoGzRUKrOKqNNCH9yynqI7ztBNUTscYThYyBq/kbXT00wCKbonsMLMtR3OReV09bq7dtmZtnpj6ewtrgir+88z5aUo48FAccWPDC8OZvyZUjrK+QUZUqbKH4Zo0MavNrWHBvbUF0ktTmVXisavEuWChOQbhJAG6aqk0eywkBTZjveWfJIXpEdg/vnrppaSJJWIHJ/THM4uN3VhSXGJrHWQ5Vpl8Q+jbFQ6tWAaqVpTCHPB+dg85E1EbuaCPT6RI3c+M25548ftsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk1L8SjdBV/HPtED33JXV4aGrKGSB7CQGPstm1RbEzg=;
 b=LRSXB/nbVdZUyVXhB2YigOBDsR4wcWtLxf4hBR79K2CgjI+X8t/fi2xc7uN5vhKTCse95vUsK2ctfISsRoiJ9tAYdWs7GKolFwGlgQpXw7nW/b5nMx9vq5ijLJ/xgIg06CnNt7nIRPtsctONkO1X1aw0elKOh2CnMgee8Ov27Psvvph9EtV6x2SZZNicjIgMaoSFP4zU9gereefsIGLqVMlDsJO4pTV8T5NoOo5P/14Kqf1u07gbXDdDtKoacViAkvVevB9RR/4hX+tHVTruihomQ7F7wXZ8K2ciHJY+ZIpJ6Udn0J6CQx1s+QClc/LAji/HqZLcIG8DFz/BJPQE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk1L8SjdBV/HPtED33JXV4aGrKGSB7CQGPstm1RbEzg=;
 b=OQ4ckYIAy5rqCb1UXTGQTX1Np2B8T+2Q1Cd4YUePZuWuCGMbj6qVcrvObfIFNPZdWSrcCPrqDExi55xbiXVVT6CGA11nLvwzzsHmfA1IPBObPdxQs4ACtUmjyOBYWeOPPluif7pyFC1rpyUG6y4Q0MG6mYM+wL6FQmb64qqqsAQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV3PR10MB7868.namprd10.prod.outlook.com (2603:10b6:408:1b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 23:16:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 23:16:39 +0000
Message-ID: <31311402-ac1d-3c3e-4e2b-5e0ae861deb1@oracle.com>
Date: Thu, 11 Dec 2025 18:16:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] bpf: allocate the buffers BPF map to fit
 highest CPU id
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522B465E54B5F7C69B0609EC2A1A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522B465E54B5F7C69B0609EC2A1A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV3PR10MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ba9ccf-0941-4f9d-c390-08de390b5655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nlk0RCtKbVFUalFWbHBPK0tJNmRVZmlTampxQ2liTWs5WHhIWVdYcElrZ0li?=
 =?utf-8?B?OVd1UjVtazM1S1R6VllsWkFMczg1ZUdVeXBOcFNaMkpGMnk1ZlhhZjFWRDUr?=
 =?utf-8?B?SWNnUFNpZ2xUUmVNTmk0cGQ0azJXa2poSWdQSmN2SEErc0JmWGE2SWFRTFdo?=
 =?utf-8?B?WkFlYi9iS2R0cXA1THpIOS9LaUNOaTZ4bkJhTGFsYUpUWE9NVGFxVzlMdDkx?=
 =?utf-8?B?ZzNSMXdMdDEzK09CUSt6OTlUUm41NnZMeVFMamlpbUgvU1lMZDNOTHdZdjZp?=
 =?utf-8?B?S2Z0TDcreDYxcVBNNG9HNS92dkROcjZiSldCY1RCZHF1dnJwZ053M2tOT1U4?=
 =?utf-8?B?RjQ2NTBkZGNhNjlqeU1KcXA3TFJ3ZFBhOEgxWnozNndLSFo4Z1lpdkNHM2R0?=
 =?utf-8?B?MURjbVlyNEhZbEJqMHoxOXUwdW44WjRZSk9KUEhrTStqckhvVytVTFlUa2Ny?=
 =?utf-8?B?NVQ2V3dzSlM4bnQrT1lLbnJ2aEd6ZHlBZ2pVMnJSTnJaaWJWeDd6cTRmOHc4?=
 =?utf-8?B?N25pVFpVVmtyVzRYUlkvc1V5enE2dTZseUIraGtvVHlWR3hmNUNQbEpuQ3ov?=
 =?utf-8?B?SWMxY1NnV0lRS2F5MWJpZnB2L3lUUUN5VUVaWFdBRmVNZ2VLeDlOWGc5ZHRi?=
 =?utf-8?B?bVBOUGRacXljd0lJKzN3WTJOVFNYNXRSbWZDa1JRTGhaTmw1cGFUOGlCUnpt?=
 =?utf-8?B?Q1orTndTU1ZROFJnd1R0cHlVYXNXZ2JCallBYmRzVmRZNGwrZVl1M1k2bXVy?=
 =?utf-8?B?RjluNjVnMDJGRTJadzdpbEZ5YWZwWGRaZmtxMW1kc1ZucVR3RTlUamlLbWwr?=
 =?utf-8?B?dGRuKzE0TERQcDA1VW9hWlJCVEhFTXF3aktPQVRZaFhrZFVpVTNDNWN4ZFNi?=
 =?utf-8?B?TWNUTTZ5UHlPZXk4MlhycVV0aTZ3OHYrNXYxU0JDT1J3ckZaVHlweVZLbDdn?=
 =?utf-8?B?aGQzbEJxZXpPQWJvNS9iRzRZOXFTSFFMbStNQ0VpbC9xdG1id2JKMVo5UEZB?=
 =?utf-8?B?SnhhSG16YnJZK3Z6TDNhbng3a1lHMDVFeEpWZ3dZY2t3dXZXMVdCMFE5Szgr?=
 =?utf-8?B?UDd0MUNtL2lUUG9Mbk0ycXN2N044ajVLZi9ZaVBFcm0vOFJFZTBRUExNVjla?=
 =?utf-8?B?Ui9naDRnUktKaVNrcmxudGdER1dZeG9VNjluUHB2TElydVlRQzNNcWNkamxM?=
 =?utf-8?B?L0w1U0VkK05peGhKTTJmanRDZnJaNE05QTFyWTdGQ2hBSDdFUmtLT3BBa3cr?=
 =?utf-8?B?Q0wzS2dQelNaU21xbFEzWDJTdXkzWGk5M1gvQlZuM2JHc2NoMTRWL2tJall1?=
 =?utf-8?B?bEw0cVFxWWp0OXduaGY0SXhtUTNWSG4vVG93UTVidVJHVG1RakN1OUNQRkVW?=
 =?utf-8?B?V0RVQ2FGMllpREwzWG1QNmNVR2w1Y3J5UmhPR1dQak5jNlNKTnk1MTlxTEFp?=
 =?utf-8?B?U1hxNWJvWGVDbnhuWTlHQ1k2STdTSk9MMDVkWXByZ1hBQ21Ec0NwSmFweTNQ?=
 =?utf-8?B?U2xKWlN5QWxGLzJFZWMxTmJKcVNsWG1QT1oyZ2h5bFlFOFRBcTlhMjlYTm82?=
 =?utf-8?B?U2FsTVprcUdOdHpGa3RXMlNrUlFnRjJ2MkMrd3V1SUttanhSYUg1NGdLaUpv?=
 =?utf-8?B?VnlzbEU3eUxNaTlCRkRqU2hrbkdlWUc2S01vNTU0QmtxQ1U0UU5RZk1QVWlC?=
 =?utf-8?B?LzV3TlpDNEJ0RUZVK25zSFJpMDF2cmxnMUtnQzY4TXVZYnRHSDdSMmhGRjU4?=
 =?utf-8?B?a1l5c3BlK09SSU5pNFFrWUMwbm83L3MwbVR4aEUvZ1FoZnpSS3B4K0EvTkoy?=
 =?utf-8?B?ekM3a2dDU0ZwY1kyVDh1aGRsNnBVWjQrbTZpYjVrMytSZmhJSWdWcUpXSjhQ?=
 =?utf-8?B?elJubXRoWVhDYXlYeE1NaWhNaE4yVWxKdjA2cDFoRmZlc0RJdDhMdHc5Y1Zj?=
 =?utf-8?Q?SONczeovGxIzPu5asXi8a34K3Z7pDfiD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWwzOHlDTVJ6ekszcW4wQWdzOWI4c1F2Nm9tUFRRV0Qzak5RaGt3b3NMVkV4?=
 =?utf-8?B?OUZ2M3NkYWllNGtGWDFXV2lVaGh2K21iUHZkaFY5Q0tObU55L0ZYeXNOV0kr?=
 =?utf-8?B?V0UrZDVxUzBKbHJBbkJ4Q3ptejhGK2FNWVlqenR2dmFaWlp3blhsTURVbGxp?=
 =?utf-8?B?UklEQXBLdmV1UU94eE95MUdKSjAzWE90SU5XOWV2ZzMweE1uZkpUME43bCt5?=
 =?utf-8?B?YkJPV1F3UHVFL2dEN1VLbm5vWWhmVjZGNEM3cGcwSnpMUm1BVnFjRWlIa3Jk?=
 =?utf-8?B?TWVFR1hVRk1NWHpIYzhKcTd0TFNETXFwaHJHTW1seENIaUYwK3hVQW5YSkN6?=
 =?utf-8?B?RGxKZEtTM3J2bVVDZHN5WVhiZm5iRUhqVjY2UnJWcnNnMm1zNTV0UGNoWmxu?=
 =?utf-8?B?elNTZ1hubVhSRFRJMVNnb2QxZkFBbWo4T0JET0FITGtWNlZES3IyZis4L0pM?=
 =?utf-8?B?MnVWNkxrZGYvWFpiZkxTeXpCMnEzb2hiNjczT3FydXRKa3ZUMHdRR3hBbVAv?=
 =?utf-8?B?RkRwbW5NWVB3SS90eWI5Q0xJR0pYY3VwdU9wWEEvb3ZBN2t4Y3k4MVRzSzIy?=
 =?utf-8?B?RFB5L3Z1WDN6YVltK2RRVzhPREx4SnZNaFZrYnQ4b0tSS3VHZHJMRjVpdkRh?=
 =?utf-8?B?TTN4czJnU09VK0psTzZ6S1NGeUV4U2UyR0NIYmpvRExpK3JheTdQME1QK3FP?=
 =?utf-8?B?N2JUUXpmbEovYWY0RSsvWEJoYjUvOCtTczdHbFNYR0gyaFhLNG1DSFAveWZ6?=
 =?utf-8?B?cUluMmpHWUgxMzA4bnI3dUlTUDdJTHBPRUt4WEFrT09IRFE3Z2JKdzg5TWMw?=
 =?utf-8?B?cG1FSmVLbkpMblJaVEsvT2RKcjF5cGJvdVRLN3BVaVA5ajQyczdydDN3b0pj?=
 =?utf-8?B?OG9PSjZTY1FJUUNCTVRBZ0grK2lwMnY5aUJxUmgrMk1vaTJabVBUQWJ5djNZ?=
 =?utf-8?B?bStCNktrQngvOVhwVmhzQUpFSllUajlMbWFqNit3eExaZ0dtTmxnWitWaFZK?=
 =?utf-8?B?WTM4SFhEQVlzNjlidlJ3b285TjdNVnlCS1Rucm9WNnRUSFVQdlU4SSsrdGxp?=
 =?utf-8?B?aXNyQWptaHpGZ0c4REhhWVdESUMweDBLdjhZZlpVZXY5TEJBcnBoWCs0QkZR?=
 =?utf-8?B?ZmVjNGNscDdhUGNQR2RIbXhpOW8vRDc1U0orK1UvNEw1aWVVaC82QUt4a3Ba?=
 =?utf-8?B?K1E0K0FkNFRMTThUY0QxNVNrZkJlQVc4VzBaa1p4VWlOaDI1cFVwVkRxLzVn?=
 =?utf-8?B?aGl2TTZIT1JnRmNoS0NZRVBzaVZycFNpVTNYd2w1MWJ6NlR0alZreERiL0Uz?=
 =?utf-8?B?WVk2bHQ1MW9GSU9iRGhnOW9hWUdVbkFoUHRId2xRd0tlQWE5QUx5SzZXOTVU?=
 =?utf-8?B?dVBFaytZRHBUaGxtMVpJZjJMUDBCSGhLdjdzV0lyWUlNYmpsaGlQWGJlejVR?=
 =?utf-8?B?blFOVk1iazJUMWVwWWpXR09adWJoWWhxbHRvOGtLUC96R2NNUEdsWUJMcWoz?=
 =?utf-8?B?QVFzK2o5WTlIV1NKR08zQ2p6VmJZRDJIaFovU0JaaWlaRzBKYS8wSS80blRs?=
 =?utf-8?B?TzBlZGJsNGg5Ym1KcHFQWHR1Q0h5SFlGTXQvSytvOHgxSVVlRkt2OVY1Ky82?=
 =?utf-8?B?S3JvbFYvNkRlT2ltVklXSUNxVk0ydlJvQ1hCVE4ramVlNzYvWVNLSFJ6VDk4?=
 =?utf-8?B?d0s4Sk5VMFZwTnRXOGNrQVVjYlNDd3g1di9aenhvSHhJUEhpMTVEbWJkVDF2?=
 =?utf-8?B?bDFYNzU5YWhqVzlqc1kwUHZvUFBLRFpxaGJpdXE3ZFMyVmVCNFFZTEhjbFZl?=
 =?utf-8?B?RVRqYVpYWC84b0tUZVFNcGpjSW9TbTM2dG1sc1FXY0RZazMrQkk3RTBiNUFh?=
 =?utf-8?B?TkttOEh2ZFlIVFpnampwM1pZaVlxWENuVEhvQVRLenpzZmNZZzhOZGR2Undk?=
 =?utf-8?B?ZHpwOWNySXdMbGtuM1NaZXVKVTFvZWpNc1FyTTJVTFowN1ZmL3F1OTlJTDI0?=
 =?utf-8?B?WVUyYUxXeUNjTmRYQ0RrS0Z4T2ZrcWlLeGdWenp1SzJzY2N2VDBBQmFoSGtk?=
 =?utf-8?B?aGN1NE9MdnNvcytUOHpoWUJ1MjNwNzNVVS9rWUNUYnBSenI5OFFlQ2pnMVRP?=
 =?utf-8?Q?YoT0dm9EK4ENpYoZ1FtjoL0G3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P628gr9NbQqb+i4XMhLHfMXGt59XVW2KbXyxO8SC9fS2FC+VHLPMT3LTb8v1UJn3t8HE3/z/GtOcXrHlpV7PT3aXMzT/iCr2DveLvEsx1kXgGWF7IcvU1uVVmtp/iat3iXYYIXUK9rWJTMYQTJki92JOg1dRuCx1teRlhX52YsWPpN+0h+S/9zsMmCo4nASVPmzVEU+RBd1d8PrG1g9gsKIxoZgNhAHeDY7uRXGub842wLghOqRQtBFX72XdDownTSn1olVCvjYsur0f3y1ruQA6fjPmqvhIUTrVk9jPjlRmZy8zr3GQCejZxR2UQxEZui4UAYMabdS01bRibvzsXjIUjgTcdnawJHQ5M+KKwdyJvREdoW4lh5FY62xZQKg5bGkVEdxW+QOUb3JQmrlkU3+iXzw/CPb47bjeifUtDxVdqO8N5rSXfnzhMwf47QCTt89zRQcw1x6yl4APnWiw6VxsWbUhIfemBZYMGNdUUD6tSfLFeEoNH+0qRyDkjRf7JFofYBKtoJ+3f8YmCv5bHSKmA6J5B6RjwLOerCBztgEu+aqoYCYTRQUSuQvs/Zc14ssIN3ZnQdMs9GvBD6iRT85lhTb8klGmTGiFjJgqtb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ba9ccf-0941-4f9d-c390-08de390b5655
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 23:16:39.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIcQkLVE7g56RplTQQu4WRnOqcnFMFabdXepY3E731ijqgqufwwgSp3Z+F9IwmP+0BXUCH+pVmt49I/yJfzXqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7868
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512110188
X-Proofpoint-GUID: Bsy05VpXMA_mLm-O3hjWZH-5kXfgTMdt
X-Proofpoint-ORIG-GUID: Bsy05VpXMA_mLm-O3hjWZH-5kXfgTMdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE4OCBTYWx0ZWRfX5EpgLLeKDkoC
 sBFMe1x38jZqufTTOB264NWnaJhntXG2RRuXZheTH6PhVsEpZ6TCOp1pQcdPrZ41peNqMqLUunh
 Hn1ubYtGR/vDhUTLEZSOkbqKfAPic4MJ4OB1BQqpA/vsPQ/uh9WDnXhm5HWJ+ffbzOCRufzmTcd
 vBMs/61PSFV9YMQS64kK5RlzJH/ZeitNCiD0U2zHfR4NSuO+ayhQQctWFX7N7eueLVmlSMGdnvJ
 ZPEnFtgknDZHXHVDDmNV0mW3fR/Xf2d5PCCUHyBOxDpEnqK8hyDOAzuVBkPmzt3Ru1xpx4gpG4i
 VmyojZCJcBazKhZO/gLExXB0teRZWzyo7UFDjmbszYoRvQ8869CS1yc+YRDfEEFBnUYddJMk9Nb
 op4KxoliWSsak8RK59gZB7VPfUkLDIi5x1VhDay7RoReeilJLlM=
X-Authority-Analysis: v=2.4 cv=YJeSCBGx c=1 sm=1 tr=0 ts=693b50da b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Ln7yEr8hudJd4hI6Zp0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12110

On 12/11/25 17:22, Kris Van Hees via DTrace-devel wrote:

> Even when less than the possible number of CPUs are online, the 'buffers'
> BPF map should be allocated based on the highest possible CPU id because
> probe data is written to the bufer

s/bufer/buffer/

I guess a problem here is that we do not test this case.  It would be 
hard, but I suppose we should change this situation?

What are the chances of our at least writing out what is per online CPU 
and what is per possible CPU id?  That way, a future developer would 
(hopefully) not have to reverse engineer this stuff.

It seems to me that this patch is an improvement over the status quo.  
On the other hand, given the limitations on what we're doing -- notably, 
the lack of regular, automated testing -- that should probably at least 
be acknowledged in the commit message.

> that corresponds to a given CPU id,
> which could be part of non-sequential CPU id configurations.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_bpf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 0a57b7d2..6568a572 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
>   {
>   	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
>   			   sizeof(uint32_t), sizeof(uint32_t),
> -			   dtp->dt_conf.num_online_cpus);
> +			   dtp->dt_conf.max_cpuid);
>   }
>   
>   /*
