Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B762015530C
	for <dtrace@lists.linux.dev>; Tue,  2 Jul 2024 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719923425; cv=fail; b=XecC25Bk5xWxho0UjIaF6m2ZxsLjH5WWhdfUgdLrsQot4Og6Ef11DuxyVTK032uBqIQ/fySYneA0/oDGuiJdqaF3JZCTigwMS1ljy4p8arGGVNI4xHYAXyhXh56eF2JmMrEBUaAWw6v+shzy1G+spOF7s4939ubFK6iKj3FkP8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719923425; c=relaxed/simple;
	bh=kXZIRW61dW0qw7slrc6r0zvojzp2mwqvolE+936gNgY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tgmL8qbDKF6FspfW0vmoNYna3AP+YRSbwzwd8VJ0fLtKUGi5OB9s0Ysk1/iPkcAKaQASTqVh4E7CJvzfj6IXIPryJ2z/CZ5JQl6oEcDUE1anwbdnr2NZtjLfrrHTlachp6zPGKQSxiazidK8mjsWSlogNwn0hCHx4MFO0y/jILo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L/Qelbk0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tjBQix+C; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L/Qelbk0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tjBQix+C"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4625MVJZ006431
	for <dtrace@lists.linux.dev>; Tue, 2 Jul 2024 12:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=3dilIGXZZa9egSdrcP8L3ORtz3665iguZcA35giXTxU=; b=
	L/Qelbk0QB09KsDVIpwu41gUSnb7Ek72w5ZixFYTOQaiywR0pppyNTNjz7g92QHP
	6iVRmk1FFZGCAPFCqvg3AdALm48rud5A2kOf7Ahf7H4PueSSJxFol1iFR2c9+UKz
	nPZd26jUjYdvurbWC+scayclS+sXApnXuHywVGP4p7RH1TzHxGO2pQEbVBgCA9ED
	7zBUGMXfkLdd+Cq91qrT0OC7Y5JHDfEVgek6TeYr4Z/TP4YOlpDWHWNY8FW62fml
	dpBKc0mmjnAf3SzNfBROCdyzIWlYba5ST2RSmBrAivtDA61/1d6zewTVEyAePzxa
	2hvVPIzaiylL9e4LQi9few==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40296awrsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Jul 2024 12:30:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 462B1YbU026117
	for <dtrace@lists.linux.dev>; Tue, 2 Jul 2024 12:30:21 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qdsrw0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Jul 2024 12:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLlSAKkthsfYjTx8ci/VGpfoU30ev+GxaIs+kxM0DxMBkEd1lPkq6Ts9jEciJWy2xn4mjTs2q43yA2oTZp8bDu/MHMa2vLeHNxYUniDO+SSbfjrISdR1qRpxAjwLuR18CRwLauDmDW7ioppN0m/LlnsaTO69VpAUPa2lITZofPwMWpHji1imybmANUvH7c8FSXZGUKFMnUEnY6YxopG7TLR5E2TcUQ67h7hTAY7WS3d8dIBH2f3nWAL7LG1KG+qDU5oJdw6aw+LWXveaR2vPEGcCiM9JpQ6ZIbGLr6l+wi6ivTqg6copYiuOjMdajX6hyi5LO3qyQrVh8AIdI1saAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dilIGXZZa9egSdrcP8L3ORtz3665iguZcA35giXTxU=;
 b=N66+oiEBpQx5K8+EDGFnsrn4PaNQ9kKRhCTwb4a4y7jVR8BsjWxrHzQNFhAh8YHKiPh5s4XQaEF3DWaCkO8X4eQv3dbdCEO8BJa15Xuq4fKjI4XMcCtB3yu8F+dVV4j2YqX/WAYxY19nS3R8HKAVwjy7VHE/rfPaIcfXLA39Tv7t1d4aULJO+p7K1RJmz9dY16r+du1JmXwKsmW0pHF2IiMcK6loV4dB5/BkNEBE/DenImCDgeSPjpN2KGjDahGHWr4HODvkkJk7IEeMq5i/ip9OyrTyKbs+qAYCAR6Ww74K4tSSJ6yA9U3A0b1VDV/5iGSbI9kAtl6JESUmePESvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dilIGXZZa9egSdrcP8L3ORtz3665iguZcA35giXTxU=;
 b=tjBQix+CearTmTgyrJ/7yntf5zOvkK4GsOwREecFO49S1By8IILlc4a3m659wZcxILNtSCKE732uiGo/30N37IqGRdI3WEP7cJul/dcRHt0iWUp8JX7IlSipBu9R4nD6qI2NkIc9pIDu3OE55qUwfxJzsZzALsPP6qxB40DMKSU=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by SJ0PR10MB5664.namprd10.prod.outlook.com (2603:10b6:a03:3e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 12:30:17 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 12:30:16 +0000
Message-ID: <2630cd6e-0f7d-4a05-a711-85d251045b13@oracle.com>
Date: Tue, 2 Jul 2024 13:30:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240426133327.578092-1-alan.maguire@oracle.com>
 <Zn8xVd+r8SzmLGH9@oracle.com>
 <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
 <ZoLeWRMOnCoecHmx@oracle.com>
 <2b83e5e2-adf1-4a5b-abf8-a83fbaf65abe@oracle.com>
 <ZoLrt+Q/DWf6K9q4@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <ZoLrt+Q/DWf6K9q4@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0487.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::6) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|SJ0PR10MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b8b2b0-5bb3-408f-e107-08dc9a92baa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UUxqREQxRGFiRUhLZk5oWHhPSlpSNktLdnBVRlNZY0hoYUo0WjdSMFZUcElM?=
 =?utf-8?B?anBCRlMrdkVMMS9sOTdmK2lhTGI3MU5hcFRieTVvVlZtL3RJZXY5UmxkUzk2?=
 =?utf-8?B?Z0hKdFM1TmVJVnNPcW1sMlBFb2lUQS90RU1TTVhBU3pCaE51Umx1ci9GbGRF?=
 =?utf-8?B?ejdFeUw5SzBPTUp6S2xZaXd6eTlSRXJEc0xsRk44S3pTTmNldVNOQVY4Q003?=
 =?utf-8?B?ZGNkM01xZkxBc0pvaHNQbHIxU2FaZXJWdUl6RGkzT3RzeWFIRkwyZkNjYy8z?=
 =?utf-8?B?NWRHUFJIa2hhZ2dvOHdJRFc1L0RlZzFYeTNGSlFQdGV0aDlGdCtaZzkyVWsv?=
 =?utf-8?B?aE1ucVZiUkt1M0JhVDk3VEoyWnpRZjFIcnprTXR2TzU3NHBnZWExMUFPQ1RV?=
 =?utf-8?B?U0hTYXBpbFdWZkwwVkF2SWowK3cwNzhHT2tEYjVpNStncm52OHhhLzdSVEY0?=
 =?utf-8?B?N1BuWjRQemY4eHJUQ2VweVhHMjlpNlRIWk1vOTdibVJRb2REQXVWc3QyYmdC?=
 =?utf-8?B?T0ZqU3dobm15VXByNEliUXp0VG9jZ0ZCNWdkYmcyMXc5ZnhLbStIa29yNU1v?=
 =?utf-8?B?b01oeXlsMGkxeUtSTS9ZVGtGN2I1QmJCZ0l3NHZMTStrZWlTSnFYOXE0eXg3?=
 =?utf-8?B?bDlVL01NLzAwRU5XcVVWNEJXQ3FCbTNGc2o0SWtGaTB6QlRQZGVTZlFvSU5q?=
 =?utf-8?B?aEhUdi9ZdEpJZlJjZVhBZUdqVkhjVW9JcjdoWTNVNEtKSUsyKzZuMklKWFFk?=
 =?utf-8?B?aVFWUVFWQndrTGJORTcveU41c0pCUm1KcEFiNFBCdzlUMEcyQzNkMFpTdGZ4?=
 =?utf-8?B?M01MTjJreTFuYSsxaGsybSsvWlB2N3BVU1JCaFBob0NhNlFEMTU0d1orNjQ5?=
 =?utf-8?B?S1ZjTU95ajVuSDZLREJsNmZmZDc4QXVwUUpZU05aeVVrTllFOEJrSVNRZTNL?=
 =?utf-8?B?MmdjRjdpSmdibjJQNXgrSjRJdElTaUxCMUI2RjFFS0dWbnpobXU0L1lXc3Nx?=
 =?utf-8?B?TW42b0svTWVSTlZzTDJuSlc3Z0dMS1FoQlRPUEZxLzVaVnlYMnM1QU13WDUz?=
 =?utf-8?B?UkdOK01BME1uSWJ4b1FmQkZaTUZXTkYzdm9WT3gxR1kzTCs1L0l4MEFoZGU4?=
 =?utf-8?B?UzZYanBFTkU5Mlk5d1FhUnVTNG4yempMZzZiNkNTQ0Z5RW81ak16NXdhOC9z?=
 =?utf-8?B?dzk5UEJLeGQ0eG1RUXVZK3RZZ29rZCt1ditMRDZtQlFRNVVIZWVHQ1FpYlNB?=
 =?utf-8?B?SUU2UEpIc1BJZ0wrZXh3dlBFSndHaDdrZGEzQ21NZUU5YnpNR3QxVWdONUdI?=
 =?utf-8?B?L3lCcXpZbHZRQVRHM2RISld4VXBrVjYybER2QUlUVWlJZkdSb3RhSFVUZHl5?=
 =?utf-8?B?TUlaMFdIYmw0bENtZGJncnQ5c0FOSkw4SWZWU3llY25RTjAyZ1lGKzJuaC9W?=
 =?utf-8?B?NjlleUE0MFVMbi9vT2xLbFh2cXJIWmhFZmc4VGMzOWV5cXJEV2h4eUkxS0gy?=
 =?utf-8?B?Q2JQY3hjdUZJVnlWcWlLenlkbGxwUzg0K09kanpFTlBqZDhTOXh4ZXBPSFpT?=
 =?utf-8?B?MjlWbzEyeTJGaUFNSDdWM0pwRm52YUczbUZEZ29xL0NlTWlyUnJxVUhIS3RE?=
 =?utf-8?B?Z3Vzdlh2V2NXVlFVWWxFeVpOZ2FZa3oyWnYwdzdGSVpKNU1iSWZsOVcyTE81?=
 =?utf-8?B?ZmdqU1pmWGRBZEpGK0pZUTFYOWFOUGMrRFhBLy9xMFJyV2N1YW1FMmMxR0hN?=
 =?utf-8?B?dzM1dUNnTmVTM0QyWldSQVZYYnh2NUFtdHJrdjNVbDF1NUZsZDByNk1UV05M?=
 =?utf-8?B?akZrZGVDdFI2c3JTdmxCdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnRNd2NES2xDVWIzbHlyZFMweUpmUzB5WSs1N3c3ZXRoaXBTYSt5R3E0ZzBX?=
 =?utf-8?B?VlNBaERzdDdSY0lNUEJLYmpaMmZ6Z09wQzhTL3paUXFRMU9qblc2eXhvS1Er?=
 =?utf-8?B?Mk5FYXI2RHMrbGhydkk4QUlxd0xwb0VjdFNiU2lSYVdJbUFCNmVWV2JVVmJF?=
 =?utf-8?B?YmErTHdZRzJOYkZLWlZSN2lZdThyMzQyYVJubFlVeGl4VTRxcFBScW1qYTVP?=
 =?utf-8?B?a3VPSSt3eTZFbW1QbEtsK1VnTllkMktGRVFhN2ZSZU8rbzFaNXJPWTBieVRO?=
 =?utf-8?B?RkpnbUZwQ0VVTzlPYVYxYi9VdVlXRHE0endKSlA1T2FVSXhnUkZqV3hnVTlv?=
 =?utf-8?B?RXdhT0hIY0c0eXRnak9aUzlLU2dWK1lOODU5YytmV0NheW8rVzE2a2N5ZlZV?=
 =?utf-8?B?bzgxeEp5WTBtb1V1MFBCcENLMmVXeXR6cnZ3MytCNVBuN3RvTXJnNTlveWJF?=
 =?utf-8?B?b2Z6WEVMaGRNcDRsZ1owTW82bVNrWndrZ1l3R3kzMW90c3lZUTBDU05tamRN?=
 =?utf-8?B?RnNXdGxZbjI1OTd0Y0ZxMWxuaWJlZE1oSmgvM0hEaUovTFZTWTZ1Y0JlVkZq?=
 =?utf-8?B?enF5amRoendEaEFza2hLdmx0ZDErUlcxemRCTDhvQkduU1NFSjBsU3RPUjFU?=
 =?utf-8?B?ZXJSK1hxbGlVSVM3RzUxSDZhbkhBRWVmMytGRm5paFI4eWV1R1RHSnlmZWU1?=
 =?utf-8?B?blBjV1ZNL2ZPdlF3L1pXUVdEQVU5UFlPbHlkczJpSWFhM2JkcEs1dWJkUXdN?=
 =?utf-8?B?MHVYbEtoSEp5cCtVVDFIZ2lOYTdGWG9KWG5iOW9TbTIzTnhiVTl2K3o3WWVo?=
 =?utf-8?B?R2dSbVp4eUpSdTB1M2Q1NjFlVlQ3bzFwVWdnbDB1T01IRW1FU1M3ZkJRR0xX?=
 =?utf-8?B?U0xzdkI4OEJ4d1NRdEI3K21RYloyd1BBTGV2dytkUy84NTh0Y2hkL1RHU2NI?=
 =?utf-8?B?UlAvQkZpOTRPWFFPWjlpcE5jMDN0VXY2NFpWRkVldUFKWDJweWxFM2tEb1RD?=
 =?utf-8?B?UGxFb1RuSFZkdm12SVc0dXphbTQ4andoeWw4NHFuTXZXaitSQkwzNmhiTVZw?=
 =?utf-8?B?dHpVbGQ0MU40dm5oZXR0MHdKcXJDZ25wUDh1Ym94V2V6d1FWc0tCemJEVkFn?=
 =?utf-8?B?UkYydGN4anRiMEpIUGp2NlZ2NVB6K3U0THlTMlZQT2FxTG45OVVUWFBPNkw2?=
 =?utf-8?B?ZGQ5ZVR0dExwQzNqclE5L3RNeE5QTFk1UHNHQml0ZUdoWDlWYkVOOHdMYkN5?=
 =?utf-8?B?cXdyMlBzd2FscXU4djFROUZTLzBwTmxsNnVHSjBPOElwdmpmZUVrSUFCbFhh?=
 =?utf-8?B?cWVtSjg1QXJFSzJ2YVJWZlk3cUJUVkpndERGODdKemFBeWU5UkVrTHVFNTli?=
 =?utf-8?B?ZTQyZzNYZGJRTGFoU1ozR2xFWlM3UEV3UGxoMmRVMlpjL3E0ZzdtVzJaY3JF?=
 =?utf-8?B?b21WeWI5L25DTTY0cGk5d3RVV3hJbzU3bHVsd0h2c2EvNWQ5MFBnWUc4anor?=
 =?utf-8?B?ejFaNVhHQXcyU0dYMStTY1dIWm83Z0FvVVd3SzBta01MQ0JCVFp1OEZGYjlI?=
 =?utf-8?B?MVk4ZStGNUZZcEgvbVlZR0t1K2tqSEp1MUw5NFRzc2tXRUNNT1owbmt1NVBO?=
 =?utf-8?B?OXlLRFFGU1FGTUIrM1RuWTFxUVJJWGdFT1hzaXhrdzEwaE9DT0ZTeG52QmFR?=
 =?utf-8?B?TDJHOUlPeUpqK1NTeFROQjdxbWRFT0RUVGtrNG1JOVg3VVFyZTVSMEU1NVFo?=
 =?utf-8?B?OTVjV1lhdGZUR3Zjdm5TZ3IwVm42YVFBN2xNQ0JlRnlTVDRUOURhdXMrcy9T?=
 =?utf-8?B?VmFjNGlNSE5tL1ZjUVJMN0YxTDVWZVBBYnlNQjV6akJuTFd1T2NOSmpqTkNu?=
 =?utf-8?B?aitNaTF2MDR0V0hvaHhEaTdDSmlHR1duSlNCbXV3VVJGbFhhbUxiYWtsclR2?=
 =?utf-8?B?YXlnY0gvSUYyTUQzY0hmL0llQWtHTENqc1VpL0V3aVRCM3NKemF4UzB2TG5O?=
 =?utf-8?B?ekFzcGJYM3NQSnc3L1JrVy95ZHRUWXJyMGludEFya2t5S0ZiUFlrQ2JudmhG?=
 =?utf-8?B?MXhwbFU0NkFRbG82ZHloNll6akhlN2dUT3VWNXpRaW9PQjJlUVU0TDZYeWVp?=
 =?utf-8?B?eDgwUHBISDhXSkU0MzBJQ3ZWQU9yNnNKNEFIWHlXN0VuQ21yeStNRHp5d2xG?=
 =?utf-8?Q?/BZmtg00MPE+lsPlD8DXQqQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	vHRR3c8oQi1fRo8cqemiVrZr8J+KBdxwvh1wgPwoDyz30AKsfCW46vNOODsEBXk4c/uAQ4dt+bziOX+ULxDx+9xEnZ1iw8lejJ+sn7yXs4BpZS9KpT4C+ih1QKywfdwRLIRqP4c/d3HjhQPNUAwHiecs/12R7qWMS99/66tNB9tiG4rZakWyJKFHIQbTYO5Pu0HAfCncJrwg/srlZYp5yWzcup+7C8nV77z3t9TlmFi9MfNhhLnj7CMSAuUKeOQqbnNmYdc0XRRRDNv1lOrGpgIBPM/35Eukne6jAvbsaXH/IxNxKY7ZbXdxFQZAtbdL4vH9axYV7LUll8vTClq3VziXszrtHFUI7rvkATAuxyZEe/Y/ENsC7/LHIU45nH0AtUZCWujWXaNQVSvhswcdZEl4X9Fe/2TphNVn+1+pwWm/XdyEYkGD0ikiVO1qAMlU0LF20cZzfVpT2XNNZhKlV4zZviqvPRNsNl6tL1FZXDpvZfxQn5zHDxDm52uI3RF8X2E5lwkNcSogUdoscDBmHzXpNAYfNr6YB3XLHyWS+T2UJoT0SFbTve520H7UMux8Syth3pq+SvhGlBjHMoONvoAMcms8bCPRsPDg5OEMGnY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b8b2b0-5bb3-408f-e107-08dc9a92baa0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 12:30:16.7907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ct7nRPX5tJkCUu2IcFnWBX+q6vamvVhWdhvR7CdtYK/iJOXfv6rlRKF5OfnOTIK7yqfIEK36/LPMJqcqODicLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5664
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_08,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407020092
X-Proofpoint-GUID: D72Q7hNx-BHqqUR14ImYj-kYcwd4j8M7
X-Proofpoint-ORIG-GUID: D72Q7hNx-BHqqUR14ImYj-kYcwd4j8M7

On 01/07/2024 18:47, Kris Van Hees wrote:
> On Mon, Jul 01, 2024 at 06:21:19PM +0100, Alan Maguire wrote:
>> On 01/07/2024 17:50, Kris Van Hees wrote:
>>> On Mon, Jul 01, 2024 at 09:06:32AM +0100, Alan Maguire wrote:
>>>> On 28/06/2024 22:55, Kris Van Hees wrote:
>>>>> Looking at this again, I am wondering why we don't just add type info to the
>>>>> data record?  Since we know the type of the data items being added to trace
>>>>> records (and type is expressed as ctfp and type id), we might as well store
>>>>> that in the record.  And that would make this entire situation pretty much a
>>>>> non-issue because the record would already comtain all that we need to know
>>>>> to consume it and print it.  No need to pass a module id.
>>>>>  in 
>>>>> If the issue is that modules could get unloaded and thereby some pointers
>>>>> might become invalid, then perhaps the solution would be to always copy the
>>>>
>>>> Yeah, I think (as well as modules going away) the other worry is record
>>>> corruption, so dealing in direct pointers is too risky I think.
>>>>
>>>>> type to the D dict (I think that is the right one - I always mix C and D).
>>>>> And since that one is always around, there would be no need to associate an
>>>>> id with the module and pass that.
>>>>>
>>>>> Perhaps doing such a copy is the best action here?  And we may need to look
>>>>> at other cases where typed data from modules might be stored, and if there are
>>>>> any others, they may also be subject to possible issues when modules are
>>>>> unloaded and in that case would require a similar type copying action?
>>>>>
>>>>
>>>> I looked to see if there any CTF APIs to simplify recursive type
>>>> copying, and  I couldn't find any and that's my worry - this sort of
>>>> copying could get complicated fast. The other issue is size - a lot of
>>>> the kernel types will pull in a massive number of dependenent types
>>>> (print()ing a skb will pull in sockets, task_structs etc). Duplicating
>>>> all of that in the D dict would be expensive I suspect. The other danger
>>>> is introducing multiple types of the same name into the D dict might
>>>> complicate things for other consumers of it.
>>>
>>> I mistakenly thought that we already included code in DTrace that performs
>>> type copying, but I cannot find it so perhaps I was mistaken (or it is more
>>> obscure).
>>>
>>> But then something else occured to me...
>>>
>>> This is all compile-type-known data.  In other words, none of this is passed
>>> in the actual trace buffer.  That means that we have a lot less worries about
>>> how to store this information.  So, look below at your patch and some comments
>>> that I think make it even easier.
>>>
>>
>> Thanks; more below..
>>
>>>> The worst case scenario in the current patch series - that the module
>>>> goes away - means we can't print the type info, but that's not the end
>>>> of the world really. Certainly in the kernel case most modules tend to
>>>> stay loaded.
>>>>
>>>>> On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
>>>>>> when generating code for print() action we need to identify source
>>>>>> of CTF; is it shared CTF, cdefs or ddefs or another module?
>>>>>> Introduce a module id scheme where the module id can be stored
>>>>>> at cg time for later retrieval at print time; this allows us
>>>>>> to later look up the module and its associated CTF without relying
>>>>>> on possibly freed pointers.
>>>>>>
>>>>>> Under the hood, the id scheme uses a monotonic counter coupled
>>>>>> with the hash of the modules name; the latter allows us to quickly
>>>>>> look up the right bucket via dt_htab_find_hval().
>>>>>>
>>>>>> This fixes an issue encountered when using a shared kernel type
>>>>>> with alloca()ed memory; DTrace assumed the type was in ddefs
>>>>>> and it wasn't so it wasn't displayed.  This change fixes that and
>>>>>> all tests continue to pass.  Also tested that it works with
>>>>>> kernel module-defined types now:
>>>>>>
>>>>>> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
>>>>>> CPU     ID                    FUNCTION:NAME
>>>>>>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
>>>>>>                                             (struct ieee80211_hw) {
>>>>>>                                              .conf = (struct ieee80211_conf) {
>>>>>>                                               .listen_interval = (u16)10,
>>>>>>                                               .long_frame_max_tx_count = (u8)4,
>>>>>>                                               .short_frame_max_tx_count = (u8)7,
>>>>>>                                              },
>>>>>>
>>>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>>>>> ---
>>>>>>  libdtrace/dt_cg.c      |  7 ++++++-
>>>>>>  libdtrace/dt_consume.c |  7 +++++--
>>>>>>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
>>>>>>  libdtrace/dt_htab.h    |  2 ++
>>>>>>  libdtrace/dt_impl.h    |  1 +
>>>>>>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
>>>>>>  libdtrace/dt_module.h  |  1 +
>>>>>>  libdtrace/dt_printf.c  | 12 +++++++++---
>>>>>>  libdtrace/dt_printf.h  |  2 +-
>>>>>>  9 files changed, 72 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>>>>>> index 27246a40..30cccdaf 100644
>>>>>> --- a/libdtrace/dt_cg.c
>>>>>> +++ b/libdtrace/dt_cg.c
>>>>>> @@ -20,6 +20,7 @@
>>>>>>  #include <dt_dctx.h>
>>>>>>  #include <dt_cg.h>
>>>>>>  #include <dt_grammar.h>
>>>>>> +#include <dt_module.h>
>>>>>>  #include <dt_parser.h>
>>>>>>  #include <dt_printf.h>
>>>>>>  #include <dt_provider.h>
>>>>>> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>>>>>  	ctf_id_t	type = addr->dn_type;
>>>>>>  	char		n[DT_TYPE_NAMELEN];
>>>>>>  	size_t		size;
>>>>>> +	dt_module_t	*dmp;
>>>>>>  
>>>>>> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>>>>>>  	type = ctf_type_reference(fp, type);
>>>>>>  	if (type == CTF_ERR)
>>>>>>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
>>>>>> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>>>>>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>>>>>>  			ctf_type_name(fp, type, n, sizeof(n)));
>>>>>>  
>>>>>> -	/* reserve space for addr/type, data/size */
>>>>>> +	/* reserve space for addr/type, module identification, data/size */
>>>>>>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>>>  			      sizeof(uint64_t), 8, NULL, type);
>>>>>> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>>> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
>>>>>>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>>>  			      size, 8, NULL, size);
>>>
>>> Here you add a data item in the trace buffer that will actually not store
>>> anything at all.  That got me thinking...  And then you store the data size
>>> both as the specified size of the data item *and* as extra argument.  That use
>>> of the extra argument is unnecessary since the size is already being added
>>> to the record as dtrd_size (which gets its value from the 4th arg to
>>> dt_rec_add().  That means we can use the dtrd_arg for something else.
>>>
>>> So...  how about you do the following:
>>>
>>> 	/* reserve space for addr and data (modname and type as extra arg) */
>>> 	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>> 			      sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_name);
>>
>> Maybe I'm misunderstanding here but isn't there a concern if dmp goes
>> away before we collect trace data this string will no longer be valid? I
>> _think_ if we were to store the module name we'd need to store the
>> string itself in the trace record. The module id approach was an attempt
>> to remove the need to store and retrieve full strings while not exposing
>> us to the potential risk of invalid pointer dereference. Sounds like the
>> trace record storage implementation was inefficient but that was the
>> intent at least.
> 
> Easy... replace
> 	(uint64_t)dmp->dm_name
> above with
> 	(uint64_t)strdup(dmp->dm_name)
> 

Right but then I've got to

- allocate a string per print() action
- free them later (presumably on DTrace cleanup?)
- when consuming the record, I've got to compute the hash on the name
string to do the module lookup by name, rather than by id where it is
pre-computed at cg time. This adds overhead to each consume action.

If you insist I'll do it as this needs to get fixed, but I do think the
module id approach is cleaner.

Alan
