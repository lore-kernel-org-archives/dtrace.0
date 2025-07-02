Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA17F2D0C6E
	for <dtrace@lists.linux.dev>; Wed,  2 Jul 2025 15:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468788; cv=fail; b=cM69KWDT9N5ibx0N+NsMpo6BOQA7apX1u6fA/NUG71KrjeG5B7AZwu6+DfuYyycFJvcx6+gGgvwUI7fqMHseepJycQHlouqRblBAZ6KeeDnvur95q0RqhTQ1o5PaSzctUVmG0Fm7Kx7l7rRBghWU2+ekqDfFNxhV5j1zYmcDoRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468788; c=relaxed/simple;
	bh=e88JeMLxZLhEIWOTtT7PFjPbjndbAiJ5I7wCUb05WHg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GGgJTlvEhSVnPBXWraX3ne0jm+Qa4rPb7z34y2Gotkt4z1H08ZZRKcvGgESKBkJ5nNPUSm5k+nJM5afTPf+Q0viJHT1MM/dqum3SntDa/TSMHdQ/hKMk6PsroCwGh1o1AyQL/oE2p/t77AvuOAsRB4w2Y/JZiDh7ida41oLlOTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T/LEmyqc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O/5TPzka; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T/LEmyqc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O/5TPzka"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BiXOk003738
	for <dtrace@lists.linux.dev>; Wed, 2 Jul 2025 15:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=p+GCKZTU1FGkY5Et/Ys1+I/a0KxoOtOIUbbI+ylA7qc=; b=
	T/LEmyqc6fMicr7JHT/O9w+cUdu2TW2rHkrXoHkVL3lIhWCuQTNdbeLdZeIB6FgI
	Qy1ato8uT8vYuBVxb6QbdVYjIDy+icmywp8i8+4qsIi0AqdVkFGNjjJygVTyhM7q
	gNpsAQPQHoP5I/n82jstXFJTk++iJuOahL6ERlfle6wepdCCEALSWIE4X+r9yule
	1kro6qmXtZ7h9ZrLRhVAlUhXzO2Rp0mMfnql965kIJx4OJ2fBrAyWeAgpLMkjokq
	SH8rGFXmgrvAv3RwdpBRIGEVzttWwN4luNKR3Chqdd91xitdaGOfzzC/sqI3bctR
	G8HKjLJ9JJbSiK1yQqehPA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef777u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Jul 2025 15:06:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562E1lRF033625
	for <dtrace@lists.linux.dev>; Wed, 2 Jul 2025 15:06:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubbbbh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Jul 2025 15:06:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhZDvqO1Kf3sYqY74WCJulF6Jq3KOzhuREYqJAwe8vMXDaa0pNt3bzR1kPXHB8HGnqGoIZPQ94knoUjPZJENRU5bAuhjnUyhjlhbQknWId0wQWHLlsutla4KCAYu6gZZWbP/1I5+dIeY0HMSv/UF+N5peLSWID3pOK5qwA9PanDQVnVn3GxqCZSWtTgLNB7gM1N4Bid9BS+4jsV4QUAS5rGkxMWyDsZXHjfB+ovEoswRw9k+EeflD53TqD8W5N6zje7IrTC2+755ZJs5k4KtYclKoQANakIoKJnZveb6M5zw8G4oyE6KTNgaLDOYbagviQLZPoEQikxMbP2A+AaQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+GCKZTU1FGkY5Et/Ys1+I/a0KxoOtOIUbbI+ylA7qc=;
 b=NK1n4asAjwK8kzpBd5DabcXAG88d6P5ZYmIFWrouJGnJRsliApT6GhSAscYlvFWGoKRodbFeTg69UZlBFGcF4tkRsS0xJqvDz9VQWZ26CUiKQQWH00SZtGWNXzue6odxGWaEiDez1fVnOK5lrqcBWi7hV4KLAYIydKl0BpAGVb4++BFBH9Xq3FsvOlscdu6KLBosz5zd/hci96MblmI8W5VHT6IkEqJ2EUdGceNuWLjxvHicqvxtr298tgXOXPNubnyr607yPXhUEJlhh7v46q/cSAZNKAi624qHuKJ4MCBub7R3RESB2kncuKDVcpHqLDM4M9KHfneDL6xNlfQQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+GCKZTU1FGkY5Et/Ys1+I/a0KxoOtOIUbbI+ylA7qc=;
 b=O/5TPzkasBW0JfBXsPPZHEmeRXAgPosYY8Y+YLVjVpWXn7asCxRjizE5qy6oU0UfZZgziieS4OP5YnAK13qJLs9OQfvngNAW1YCnzfL1CwuBv3DAukANORgWs1/ENcsqlCYm1Ua++SGrw1UA2+jtYQVXLtjhgtSVETjslOKUNOM=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 CH4PR10MB8074.namprd10.prod.outlook.com (2603:10b6:610:23d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:06:20 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 15:06:20 +0000
Message-ID: <fb5b1e66-a2a5-4dd1-8c58-2477b1ca6894@oracle.com>
Date: Wed, 2 Jul 2025 16:06:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dtrace: add tcp provider
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-4-alan.maguire@oracle.com>
 <8ed88a3b-6e37-a696-d6bb-38745c144995@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <8ed88a3b-6e37-a696-d6bb-38745c144995@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::30) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|CH4PR10MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a92bde7-cfa3-4e80-a9e4-08ddb97a004b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGJ3UnpNd3BGMGFrVERGWDQwSUVoamdoYzhwVVVGb2hRNDFDTXNOMTFINGlM?=
 =?utf-8?B?Qk5OSWo2TmJxbFMxWE1WbFY3VEY3UEpOaWF2WnlCK2NOdUhOalZkMnZFdDgr?=
 =?utf-8?B?N2FKWHFEcVFvcW1NbTlBVWV2Q0FaOTJBaVQ5cnA5ZnBLVU1lNFZFUndqMndY?=
 =?utf-8?B?SzhpTjliQWVFbUtDOUN6MmNpNjJmYkJ6dm4rY0tQckZycnVqQ3JCMjJiV2RF?=
 =?utf-8?B?OHA1dkxSbXBJeDZXdmljOWZ1SEwwbzMxRU8yUjQ0KzJ5d2lCTWUrNmt5MzNr?=
 =?utf-8?B?eExkTFZsbUVrSDRBN2doUG5qWHRHQ3JSMDdmdjJBaHJuVXU4MERIMTFUeGRO?=
 =?utf-8?B?VUtNWWpSWG5WR3gxRURPNy9LMW5vOXU0dXJBckxhOTQ5VjVJbkhQUm5WdHVM?=
 =?utf-8?B?ejFoY0xsRTlRMVNKbDJTQU0wbEliVUpaMHYydWFqdzcyZURBcEErK3RRNmxH?=
 =?utf-8?B?cHN5TnZnbmtoWENKTFdDZ1Q1ZHdGRDVmMnRGSHlUY3Y1M2tFQkRoN2ZBbDhT?=
 =?utf-8?B?c3AveGFZb1NtMDd3M0lZOXBXb0RHTnpWR2EwWFRxVEZ5NGFoanVyWGtkamxO?=
 =?utf-8?B?eDltOVg0b3JkMStwQ242TlJuUXI3K05zcXpsM0RjbjgzdGo0QXRtbkIxZ2h2?=
 =?utf-8?B?Q2liYlJ1VzRteDNmTTVld2FST2toYXdVMy9YYmhDekFtUEFvZnB5anJwM3Jr?=
 =?utf-8?B?RjhkRzBmTE0yTUFNRVM1ZmRnM01aeTVramhnZGJodGZHVUg4MVBYYytwY2VH?=
 =?utf-8?B?Y21oZGhUVkJXRmFjQkoxR0gxM0pzTjVVS0NrMDNjaU9YTk5rbS93ZFE2UVRj?=
 =?utf-8?B?MHRnWXFvQ2JRekpOZFRKSlRLcUhZYTlKa2dUWjlOSXFVTkkyS0F1M1djcTM2?=
 =?utf-8?B?TUtsZStPcG5zYnd1MHE3UFlrbHVTc2lkUkdSUng5cFhTeXpjdlU3K3RZdXF6?=
 =?utf-8?B?V0FXcjNxTCtZVzBHbm9ZTFUrcUVTZ09tUWlPaDRkVzBMdEd3cm1HNVVGT0Jj?=
 =?utf-8?B?SjhURjZ4bHdITTFKbUZmU1VTSS9VSGZPUytVTnRGeXhxQnRQLzJHMlFySFpB?=
 =?utf-8?B?R0FobEsyTXJhNUsxQVZsQ0V5THFUczRENHVXaVZEaXhXdUl4TGtaRkJCNStZ?=
 =?utf-8?B?cFVjNzRVM0FkMmN0NXNXV3oxdlJ3RHg0WmZZcHVYRXNBbUgrYUEvOW1Ma1Rv?=
 =?utf-8?B?TW1RM1B3L2RBTWRFZ0xnaTQxRm43Mll6cy80VUhKUWVMUmxwN0F3djBLYkdz?=
 =?utf-8?B?UTlZRzVlbHluVk4zSHU3MHdhTXc3Mm93dlRpU1pUT3JZQnBmTVMyS28zSEt3?=
 =?utf-8?B?a3NqM0NGVlZkRWt2N3pjZmVQOVk0ZTZ3WFpIYVRYNHJobzlZZExyWGZ1NHVw?=
 =?utf-8?B?cW5zTmxianZoaS82NmpSS3J1TWJPSXdVdVRvNkk0SGMzLytxcjQyd3VRZklt?=
 =?utf-8?B?UC9KSGkvRDVSclZqeEZCWnVsZzlveVAvMmkzQTBpRlQxcUF2ZWoybVpDSlNs?=
 =?utf-8?B?eVREUmtvVTM3YkRpTitYN25hdW9ZN0VsaitHMncyVTh2aGxSS0hmNkhaam5I?=
 =?utf-8?B?M3BGRmx3K2lCbjRkVWxIOExMQmFuTDJCWUdOMHB3QTFpWG9CVE42akozM3lq?=
 =?utf-8?B?c2xPOVBiVGg3NFVIelZnc2l4Q0l0WEdaU1VJR1lWY2VmSDlRS2FiMVpkVzg2?=
 =?utf-8?B?Q3NFNkgzMUhHenNvZFpDd0tTbjJmWnlQMDQ0Mk42TGkrZ1hGc0tzUXJJdmRW?=
 =?utf-8?B?NjJvUEV2ZWprUGFCWko1MTVneGxBMk12c2tIOHNxYmdzemo2YjVoWnVoOWlH?=
 =?utf-8?B?S01WQkdrRUtaQ0N2SlVDY1QrSHVTTDNLcnFITzhsTUlxYzJzRlRxNk1JdlhN?=
 =?utf-8?B?RjlhdmxpT1d0aXBIYkxiTTV3VFI0bTVtYlpqQW82bUtiNW4zT3hiS3kzakxK?=
 =?utf-8?Q?Hg6/lIcGEsg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHFxTStCM05Qa1BWWWFUVzZmaVNrVnpwQTdNMzFaWGc3M0VCYmt1MGVQNDA2?=
 =?utf-8?B?QkNOcENYbWZ0eUF4UFU1c2J5UDRjWGNpVWtnd1VMdHUwVWpRM0RaNGdNaEZ0?=
 =?utf-8?B?UWZJNy91OXdjUTFWWE1rNGZkTktzUHVQa21iMGZRNFJSU0dyNHFLQ0xkM0JZ?=
 =?utf-8?B?ZGlwYndJM0d4cHlaa0daME96cWJweHczWGZmaU8vSnpaVjdQcFEyc2pVcEdB?=
 =?utf-8?B?Lzd4STBQWkZqQWFLeTZpUmgyN0E2N1N3cVcybHBwRGtwWTBFT0FiaFY1akVE?=
 =?utf-8?B?cktURnBReFRaL3I2Z0l0c1JJNW8xUEEwcU4wUU8rTm9aak5oUmZnTDRibWhP?=
 =?utf-8?B?NTNXejJLSXNvN2pjS2hXaEdrR0N2NTFMd2VhNmpxMjAwZStEQ3o1Y0o3TVBK?=
 =?utf-8?B?U1JlM3BDSGFxdEoxTlhCekhSdGZOSXZKYVl0dHBDZklxZUJnRGhCa0pxbGlI?=
 =?utf-8?B?aUtMU3d5eFJMR2JqeUZxOC9jRWJlNzMxM0FBci9aYkhCbVNUR0RseHRxY2lY?=
 =?utf-8?B?MFpVZmZ5TGJ5N0dzR0dyc1JjRXdTcmtJeFAyN0w2S0RBMFkxZllwNVhwVHZC?=
 =?utf-8?B?anNuU1VoTEJGTGpNeW5FU1M2Q3I4azFTczR4SXFXVDZrVkZ0SE4vV0JyVXpK?=
 =?utf-8?B?Q3FEbHZlSE4rdHQxTTdITjBHVjJrOTJ0SEo5ZnZzNHF0WE5jeU9oWHpPTmVu?=
 =?utf-8?B?WGs2anB5ZFEzZmZhM1VlelQ4Nzh6cHMyWi9WUzU0VUhLV2VTZGhTR1dNY0FR?=
 =?utf-8?B?ZFRtbTNMckZZUis0M0VqcXYzV2JCWS9aMk5uTGFxWGdmaE8vcDFPUWYwSXpm?=
 =?utf-8?B?bzg4VG5rMnlKQi9ad2g3VlcyQUI5aDBiR3VTTkdJME8wa3FnR0s2TElyRTM0?=
 =?utf-8?B?UDlTemkzZU56NDd4a2NTMHVUZE9MS3FyWllKSlppSVExcCtQdm56aGlveTFZ?=
 =?utf-8?B?OW56SUlLZEVHaDM2RWlMWk9ybFpOdXhQZkI5KzVYcTVWYnZNTmZDckdlNTJ1?=
 =?utf-8?B?cllldmpUVm5Gd1ZPajM5LzZrRFpRTTZzek5YZEZZZVUzeE1CV1U4ZzgxeGlq?=
 =?utf-8?B?cGNJSzRMMzUxSm1aaVJPcHVEWndjaXYyc3Y3NHFWbWVhWm9xckphMDhFVG11?=
 =?utf-8?B?MHZnMm9TLzlkTDhYTXhEaG1NMnBlaTk3ZnBzTzF1eG5SWC9EWDV2VEY5ZHps?=
 =?utf-8?B?Z1gxZllSL0wyQ243SVByMFJ4UlNwMjgvODVyVVVzbUcya0d3ZlA5eW5sVzYz?=
 =?utf-8?B?UzhvUXhRQ21jVWZtNjJtRk1tNGNhTWthQlBOUkNLN2ZlMzVaU05ZL3ZzeVhL?=
 =?utf-8?B?YzdjSDZuSURXMVl0TStlYjJxblBCZ1lGSC8rVWpYd3Z1QTBwSzIyNUR6QStZ?=
 =?utf-8?B?YUpOMi85RkNFN3dBamo5T2MxdjN0SWR1Q2QrLzRRVUxVbkxla0xmdzJJeFc2?=
 =?utf-8?B?dHl2cUxYcjFNQkZLYlpJM1JIdGY3TmxEUU5wMklXZXJkNVBhbWh3WHhqTU9W?=
 =?utf-8?B?Ukw0VXdlZS9uMWJPajRyZFkzY3IwNzNyazRrOUlxeXM0MFJ3RTN2NS9JOXZU?=
 =?utf-8?B?Ti8wbll3Q2lsUWlUaHF3NWsrNFBIUUtxTG1qUnRxRXVXTXJZOG93aE5DcTVN?=
 =?utf-8?B?bmJtSjV2K2lvWWpQTkdhWnZ3VHI0dm9QSTV5bVp3ZUpiNlJISkwwR2NaUzhu?=
 =?utf-8?B?eUtmcE9pcjhhVTV6RVFHVG9ZNjRDU2ErVmhQUXlURWJlMytpMWpJTlVLUVIw?=
 =?utf-8?B?a1BFbUFhQkYwYkh6YVV2RDlEdXg4UGhwNXJFU3BpUWYwWFA4SWN4aXZTSE5D?=
 =?utf-8?B?L3pBQ3VvWkp0WHprMnJUbksvKzhGMEtOd2l4SGpUZS9xTTYwaDlMK1FDTjhF?=
 =?utf-8?B?ZUlaVmpkSncwN3IxQ0hBOWMyQmxUc3B2UzZ4TjUzUkl3eDdiTmV1ZHNIVWRF?=
 =?utf-8?B?cisxMm9XNGo0THBnQnZSblVTOFQvR1RWZmpuNWtXTW0rRklZUjN2a1lzRGFw?=
 =?utf-8?B?QVV2c1Q3OGwzclRRNVBncG9FTXVDL2xPbGZNZWN5UGc0aEFTTUFQMENvZWVh?=
 =?utf-8?B?REIraGZjTzBCUnpLZFAzUkZkK1h1VGd5N3M1dXNacnE0SVprOFNwMFhOOVNp?=
 =?utf-8?B?YjBvOW1KbnR1TEgyVzZnTlRtVkFVT0cyb3R0cmwwQXFYQmZRQkFGdjFmaFRp?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5FjNpo8SlHW2TljJA2/YjMjUUZQS6rSdeg49Xw0qlA1kcyhflFCSbUwKoAY9+GalHkke18f+D0IEYNGN19PIZM/H3+pioZ1xFDju6qPxXM5IAs1Xg7RNyJeGFR60mWnkEf8Ti67F6fVFSOlXTsyJ3TOxytDp77HcKgNP+2X+IDXYwHHCyaq7RyQI3LfH+ibYw3tPxE2zXxDj27LJZbSz24Kd7SJkyhOoMyHA1sElRlOMTBi6JJIDnHwMqiU+9wVpPvP7EYoG5ca8DZBhLOHTv0YwhPabiqGLtbHT/gtWTHQtCnXIfVeztcbNCsZP5/34yvpI0R8hcw84+Q7HWeT0dB5IzKs9aBgZDYkzivWO+JiOYYJV5/fS729RJBGZWbT8AGlVbPaNIQoulitIISM9QxqO2H9iveizwOb5na0g0VGnnPlq14gpi75CTQJ9q55hrCkm+clR6trJAPDrYDLH5Q/lcyj+Ww0Hn6a6ttzLKWyFMp9S47jVxEsnv0VfY1lXNPZRzq1SqNpTGImnzt2cN5DT9GHM7mWTaHm+WVC5hp6tBLzSon2j5uPCy1TbhiDOysoOKIFI8fUTSfRLc+WR44ee4xOmtn8KnJMQs+MqETY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a92bde7-cfa3-4e80-a9e4-08ddb97a004b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:06:20.2993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdhA0wZzdiz7c/RcVp3XDNJXu4WS39KeIMKRbTwiv/79fLUIz8szPuXiJdXB/T5PLOPMVycHuNAHkVzC3i61YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020123
X-Proofpoint-GUID: rs7ui0MDTVjvx2U68vu3QvXuT0ft-Q_a
X-Proofpoint-ORIG-GUID: rs7ui0MDTVjvx2U68vu3QvXuT0ft-Q_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNCBTYWx0ZWRfX8NQbGV3NiiIg Fax5DJ1aEbxHnanfvZHaYhY4Su2qi1psC1fujiePUh6pnIc23AJ3MdeHHH6gMh5dBC+AIqxE2t7 ZmygnS0REAiPlGmZPqjx9EXR6nNCIRKXJANlDWym+KcVRmzHf2U+ziaNG4fhk4XfUmxzQ3SHDGT
 DLdx6CXT7IUygfsdE6pQ9izK44EQtbAZucQU2fYC16SZrofvUCdPrbTqFmt4dhA2DuJvEBecdAN RVWuDyR4S2lnIMXqTlwahC2I8/vwwdTL2y1Due1nI/Fj87tFX5ONGHC2LE5/4vHgVeqnKOWJddw +HAji4/f0tPtjWtYynemTo710BxAAegM3QxWjSwnmDL+d+HLRaoxzn5zms1g5Hra1MC3s4G+0K/
 32hLLYIybp7nec1S0D3Hb0lZDbX4yAhpH1f08wpenlYYipVhWWd5cgjRq7k4g/RckussUDCn
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=68654af0 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1XWaLZrsAAAA:8 a=Q_szzjoxG14dAW9L8lAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 02/07/2025 00:16, Eugene Loh wrote:
> I'll try reading this some more, but there is much I do not understand. 
> For now:
> 
> I think tcp.d needs an updated Copyright year.  Also, there seems to be
> a missing ">";  check "<unknown" in the tcps_raddr assignment.
> 

will fix, thanks!

> With this patch, should we also git rm test/unittest/tcp/test.x?
>

true, will do.

> On most VMs,
>     test/unittest/tcp/tst.ipv4remotetcp.sh
>     test/unittest/tcp/tst.ipv4remotetcpstate.sh
> xfail due to missing remote.  Are we okay with "shrugging our shoulders"
> like that?
> 

Yeah, I don't think the remote test is robust enough. Specifically in
OCI it seems to always fail. I'd suggest we replace it with creating a
network namespace with IP addresses configured on top of veths to
simulate the remote case, the codepaths will be the same. I've done this
in other test suites and it works well.

> Meanwhile, my one non-OCI VM ran those tests.  The first test passes. 
> The second one consistently reports
>     -tcp:::state-change to time-wait - yes
>     +tcp:::state-change to time-wait - no

I hit some of these failure during development; adding the
fbt::tcp_time_wait:entry probe helped. Is that inlined or something
perhaps (grep tcp_time_wait /proc/kallsyms)?

> and occasionally reports stuff like
>     dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
> invalid address (0x1fc0c0000000000) at BPF pc 287
>     dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
> invalid address (0x225b80000000000) at BPF pc 287
> 

ah, ok there must be a null deref somewhere. Haven't seen this before;
what kernel version/arch is this?

> The non-remote tests fail on OL8 UEK6 (x86 and arm).
>     dtrace: failed to compile script /dev/stdin:
>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> inet_ntoa arg#1 (ipaddr_t *):
>     Unknown type name
>

This is a weird failure; I see it on some systems but not on others.
In tcp.d we have

#pragma D depends_on library net.d

which contains the typedef for ipaddr_t ; it seems that's not enough to
pull in the typedef reliably. I suspect there is a timing element
involved here in when the net.d library is included. Perhaps there is a
better way to define ipaddr_t ; would using a builtin typedef in
_dtrace_typedefs_32/64 work better perhaps?


> The probe names are
>     tcp:ip:*:*        Solaris
>     tcp:vmlinux:*:*   DTv1
>     tcp:vmlinux::*    with this patch (that is, no more function)
> I guess precedents have already been set for other SDT providers;  so,
> okay.  Just noting for my own sake.
> 

> Meanwhile, the typed args[] have changed in number and type from Solaris> to DTv1 to this patch.  Does that merit discussion?
> 

Hmm, that's not intentional (aside from the additional INBOUND/OUTBOUND
etc which we use to help inform translation). Do you see other changes
aside from them? Thanks!

Alan

> On 6/10/25 09:58, Alan Maguire wrote:
>> Based upon various fbt probe points support TCP send, receive,
>> state-change, accept-established, accept-refused, connect-request,
>> connect-established and connect-refused probes.
>>
>> A few tweaks were needed to tcp.d to support the probes fully.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>   libdtrace/Build         |   2 +
>>   libdtrace/dt_prov_tcp.c | 405 ++++++++++++++++++++++++++++++++++++++++
>>   libdtrace/dt_provider.c |   1 +
>>   libdtrace/dt_provider.h |   1 +
>>   libdtrace/ip.d          |   1 -
>>   libdtrace/net.d         |   6 +-
>>   libdtrace/tcp.d         |  52 +++---
>>   7 files changed, 443 insertions(+), 25 deletions(-)
>>   create mode 100644 libdtrace/dt_prov_tcp.c
>>
>> diff --git a/libdtrace/Build b/libdtrace/Build
>> index 7e6e8a38..a5439354 100644
>> --- a/libdtrace/Build
>> +++ b/libdtrace/Build
>> @@ -59,6 +59,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
>>                 dt_prov_sched.c \
>>                 dt_prov_sdt.c \
>>                 dt_prov_syscall.c \
>> +              dt_prov_tcp.c \
>>                 dt_prov_uprobe.c \
>>                 dt_provider.c \
>>                 dt_provider_sdt.c \
>> @@ -117,6 +118,7 @@ dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
>>   dt_prov_sched.c_CFLAGS := -Wno-pedantic
>>   dt_prov_sdt.c_CFLAGS := -Wno-pedantic
>>   dt_prov_syscall.c_CFLAGS := -Wno-pedantic
>> +dt_prov_tcp.c_CFLAGS := -Wno-pedantic
>>   dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
>>   dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
>>   diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
>> new file mode 100644
>> index 00000000..75e1e3a9
>> --- /dev/null
>> +++ b/libdtrace/dt_prov_tcp.c
>> @@ -0,0 +1,405 @@
>> +/*
>> + * Oracle Linux DTrace.
>> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights
>> reserved.
>> + * Licensed under the Universal Permissive License v 1.0 as shown at
>> + * http://oss.oracle.com/licenses/upl.
>> + *
>> + * The 'tcp' SDT provider for DTrace-specific probes.
>> + */
>> +#include <assert.h>
>> +#include <errno.h>
>> +#include <netinet/in.h>
>> +
>> +#include "dt_dctx.h"
>> +#include "dt_cg.h"
>> +#include "dt_provider_sdt.h"
>> +#include "dt_probe.h"
>> +
>> +static const char        prvname[] = "tcp";
>> +static const char        modname[] = "vmlinux";
>> +
>> +enum {
>> +    NET_PROBE_OUTBOUND = 0,
>> +    NET_PROBE_INBOUND,
>> +    NET_PROBE_STATE
>> +};
>> +
>> +static probe_dep_t    probes[] = {
>> +    /* does not fire on UEK7 unless rawfbt; no idea why... */
>> +    { "accept-established",
>> +      DTRACE_PROBESPEC_NAME,    "rawfbt::tcp_init_transfer:entry" },
>> +    { "accept-refused",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::tcp_v4_send_reset:entry" },
>> +    { "accept-refused",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::tcp_v6_send_reset:entry" },
>> +    { "connect-established",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::tcp_finish_connect:entry" },
>> +    { "connect-refused",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::tcp_reset:entry" },
>> +    { "connect-request",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::ip_queue_xmit:entry" },
>> +    /* ip6_xmit has > 6 args so cannot fentry on aarch64; use rawfbt */
>> +    { "connect-request",
>> +      DTRACE_PROBESPEC_NAME,    "rawfbt::ip6_xmit:entry" },
>> +    { "receive",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::tcp_rcv_established:entry" },
>> +    { "receive",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::tcp_rcv_state_process:entry" },
>> +    { "receive",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::tcp_v4_send_reset:entry" },
>> +    { "send",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::ip_queue_xmit:entry" },
>> +    /* ip_send_unicast_reply has 10 args so cannot fentry; use rawfbt */
>> +    { "send",
>> +      DTRACE_PROBESPEC_NAME,    "rawfbt::ip_send_unicast_reply:entry" },
>> +    { "send",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::ip_build_and_send_pkt" },
>> +    /* ip6_xmit has > 6 args so cannot fentry on aarch64; use rawfbt */
>> +    { "send",
>> +      DTRACE_PROBESPEC_NAME,    "rawfbt::ip6_xmit:entry" },
>> +    { "state-change",
>> +      DTRACE_PROBESPEC_NAME,    "sdt:::inet_sock_set_state" },
>> +    { "state-change",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::tcp_time_wait:entry" },
>> +    { "state-change",
>> +      DTRACE_PROBESPEC_NAME,    "fbt::inet_csk_clone_lock:entry" },
>> +    { NULL, }
>> +};
>> +
>> +static probe_arg_t probe_args[] = {
>> +    { "accept-established", 0, { 0, 0, "struct sk_buff *", "pktinfo_t
>> *" } },
>> +    { "accept-established", 1, { 1, 0, "struct sock *", "csinfo_t
>> *" } },
>> +    { "accept-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
>> +    { "accept-established", 3, { 3, 0, "struct tcp_sock *",
>> "tcpsinfo_t *" } },
>> +    { "accept-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t
>> *" } },
>> +    { "accept-established", 5, { 5, 0, "unsigned char", "int"} },
>> +    { "accept-established", 6, { 6, 0, "unsigned char", "tcplsinfo_t
>> *" } },
>> +    { "accept-established", 7, { 7, 0, "int", "int" } },
>> +
>> +    { "accept-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t
>> *" } },
>> +    { "accept-refused", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
>> +    { "accept-refused", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
>> +    { "accept-refused", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t
>> *" } },
>> +    { "accept-refused", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
>> +    { "accept-refused", 5, { 5, 0, "unsigned char", "int"} },
>> +    { "accept-refused", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
>> +    { "accept-refused", 7, { 7, 0, "int", "int" } },
>> +
>> +    { "connect-established", 0, { 0, 0, "struct sk_buff *",
>> "pktinfo_t *" } },
>> +    { "connect-established", 1, { 1, 0, "struct sock *", "csinfo_t
>> *" } },
>> +    { "connect-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
>> +    { "connect-established", 3, { 3, 0, "struct tcp_sock *",
>> "tcpsinfo_t *" } },
>> +    { "connect-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t
>> *" } },
>> +    { "connect-established", 5, { 5, 0, "unsigned char", "int"} },
>> +    { "connect-established", 6, { 6, 0, "unsigned char", "tcplsinfo_t
>> *" } },
>> +    { "connect-established", 7, { 7, 0, "int", "int" } },
>> +
>> +    { "connect-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t
>> *" } },
>> +    { "connect-refused", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
>> +    { "connect-refused", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
>> +    { "connect-refused", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t
>> *" } },
>> +    { "connect-refused", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t
>> *" } },
>> +    { "connect-refused", 5, { 5, 0, "unsigned char", "int"} },
>> +    { "connect-refused", 6, { 6, 0, "unsigned char", "tcplsinfo_t
>> *" } },
>> +    { "connect-refused", 7, { 7, 0, "int", "int" } },
>> +
>> +    { "connect-request", 0, { 0, 0, "struct sk_buff *", "pktinfo_t
>> *" } },
>> +    { "connect-request", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
>> +    { "connect-request", 2, { 2, 0, "__dtrace_tcp_void_ip_t *",
>> "ipinfo_t *" } },
>> +    { "connect-request", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t
>> *" } },
>> +    { "connect-request", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t
>> *" } },
>> +    { "connect-request", 5, { 5, 0, "unsigned char", "int"} },
>> +    { "connect-request", 6, { 6, 0, "unsigned char", "tcplsinfo_t
>> *" } },
>> +    { "connect-request", 7, { 7, 0, "int", "int" } },
>> +
>> +    { "receive", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
>> +    { "receive", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
>> +    { "receive", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
>> +    { "receive", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
>> +    { "receive", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
>> +    { "receive", 5, { 5, 0, "unsigned char", "int"} },
>> +    { "receive", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
>> +    { "receive", 7, { 7, 0, "int", "int" } },
>> +
>> +    { "send", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
>> +    { "send", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
>> +    { "send", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
>> +    { "send", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
>> +    { "send", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
>> +    { "send", 5, { 5, 0, "unsigned char", "int"} },
>> +    { "send", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
>> +    { "send", 7, { 7, 0, "int", "int" } },
>> +
>> +    { "state-change", 0, { 0, 0, "void *", "void *", } },
>> +    { "state-change", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
>> +    { "state-change", 2, { 2, 0, "void *", "void *" } },
>> +    { "state-change", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t
>> *" } },
>> +    { "state-change", 4, { 4, 0, "void *", "void *" } },
>> +    { "state-change", 5, { 5, 0, "void *", "void *" } },
>> +    { "state-change", 6, { 6, 0, "struct sock *", "tcplsinfo_t *" } },
>> +    { "state-change", 7, { 7, 0, "int", "int" } },
>> +
>> +    { NULL, }
>> +};
>> +
>> +static const dtrace_pattr_t    pattr = {
>> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING,
>> DTRACE_CLASS_ISA },
>> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE,
>> DTRACE_CLASS_UNKNOWN },
>> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE,
>> DTRACE_CLASS_UNKNOWN },
>> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING,
>> DTRACE_CLASS_ISA },
>> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING,
>> DTRACE_CLASS_ISA },
>> +};
>> +
>> +/*
>> + * Provide all the "tcp" SDT probes.
>> + */
>> +static int populate(dtrace_hdl_t *dtp)
>> +{
>> +    return dt_sdt_populate(dtp, prvname, modname, &dt_tcp, &pattr,
>> +                   probe_args, probes);
>> +}
>> +
>> +/*
>> + * Generate a BPF trampoline for a SDT probe.
>> + *
>> + * The trampoline function is called when a SDT probe triggers, and
>> it must
>> + * satisfy the following prototype:
>> + *
>> + *    int dt_tcp(void *data)
>> + *
>> + * The trampoline will populate a dt_dctx_t struct and then call the
>> function
>> + * that implements the compiled D clause.  It returns the value that
>> it gets
>> + * back from that function.
>> + */
>> +static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>> +{
>> +    dt_irlist_t    *dlp = &pcb->pcb_ir;
>> +    dt_probe_t    *prp = pcb->pcb_probe;
>> +    dt_probe_t    *uprp = pcb->pcb_parent_probe;
>> +    int        direction, have_iphdr;
>> +    int        skarg = 0, skbarg = 1, tcparg = 0;
>> +    int        skarg_maybe_null;
>> +    int        skstate = 0;
>> +
>> +    /*
>> +     * We construct the tcp::: probe arguments as
>> +     * follows:
>> +     *      args[0] = skb
>> +     *      args[1] = sk
>> +     *      args[2] = ip_hdr(skb) [if available]
>> +     *      args[3] = sk [struct tcp_sock *]
>> +     *      args[4] = tcp_hdr(skb)
>> +     *      args[5] = sk->sk_state
>> +     *      args[6] = sk->sk_state
>> +     *      args[7] = NET_PROBE_INBOUND (0x1) | NET_PROBE_OUTBOUND (0x0)
>> +     */
>> +
>> +    if (strcmp(prp->desc->prb, "state-change") == 0) {
>> +        int newstatearg;
>> +        int skip_state = 0;
>> +        int check_proto = IPPROTO_TCP;
>> +
>> +        /* For pre-6.14 kernels, inet_sock_state_change() to
>> +         * TCP_SYN_RCV is broken in that the cloned socket has
>> +         * not yet copied info of interest like addresses, ports.
>> +         * This is fixed in 6.14 via
>> +         *
>> +         * commit a3a128f611a965fddf8a02dd45716f96e0738e00
>> +         * Author: Eric Dumazet <edumazet@google.com>
>> +         * Date:   Wed Feb 12 13:13:28 2025 +0000
>> +         *
>> +         * inet: consolidate inet_csk_clone_lock()
>> +         *
>> +         * To work around this we trace inet_csk_clone_lock and
>> +         * use the reqsk (arg1) as the means to populate the
>> +         * struct tcpinfo.  We need then to explicitly set the
>> +         * state to TCP_SYN_RCV and also skip the case where
>> +         * inet_sock_set_state() specifies TCP_SYN_RCV otherwise
>> +         * we will get a probe double-firing.
>> +         */
>> +        if (strcmp(uprp->desc->fun, "inet_csk_clone_lock") == 0) {
>> +            skarg = 1;
>> +            newstatearg = 2;
>> +            check_proto = 0;
>> +            emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2),
>> +                        BPF_TCP_SYN_RECV));
>> +        } else if (strcmp(uprp->desc->fun, "tcp_time_wait") == 0) {
>> +            skarg = 0;
>> +            newstatearg = 1;
>> +        } else {
>> +            skarg = 0;
>> +            newstatearg = 2;
>> +            skip_state = BPF_TCP_SYN_RECV;
>> +        }
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7,
>> DMST_ARG(skarg)));
>> +        emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>> +        /* check it is a TCP socket */
>> +        if (check_proto) {
>> +            dt_cg_get_member(pcb, "struct sock", BPF_REG_6,
>> +                     "sk_protocol");
>> +            emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0,
>> +                         IPPROTO_TCP, exitlbl));
>> +        }
>> +        /* save sk */
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7,
>> DMST_ARG(skarg)));
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
>> +
>> +        /* save new state */
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7,
>> DMST_ARG(newstatearg)));
>> +        if (skip_state) {
>> +            emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, skip_state,
>> +                         exitlbl));
>> +        }
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(6), BPF_REG_6));
>> +
>> +        /* save sk */
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_6));
>> +
>> +        /* save empty args */
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
>> +
>> +        /* NET_PROBE_STATE */
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(7),
>> +                    NET_PROBE_STATE));
>> +        return 0;
>> +    }
>> +
>> +    if (strcmp(prp->desc->prb, "accept-established") == 0) {
>> +        direction = NET_PROBE_OUTBOUND;
>> +        have_iphdr = 1;
>> +        /* skb in arg2 not arg1 */
>> +        skbarg = 2;
>> +        skarg_maybe_null = 0;
>> +        /* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
>> +        emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
>> +                     BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB,
>> +                     exitlbl));
>> +    } else if (strcmp(prp->desc->prb, "receive") == 0 ||
>> +           strcmp(prp->desc->prb, "accept-refused") == 0) {
>> +        direction = NET_PROBE_INBOUND;
>> +        have_iphdr = 1;
>> +        if (strcmp(uprp->desc->fun, "tcp_v4_send_reset") == 0 ||
>> +            strcmp(uprp->desc->fun, "tcp_v6_send_reset") == 0)
>> +            skarg_maybe_null = 1;
>> +        else
>> +            skarg_maybe_null = 0;
>> +    } else if (strcmp(prp->desc->prb, "connect-established") == 0) {
>> +        direction = NET_PROBE_INBOUND;
>> +        have_iphdr = 1;
>> +        skarg_maybe_null = 0;
>> +    } else if (strcmp(prp->desc->prb, "connect-refused") == 0) {
>> +        direction = NET_PROBE_INBOUND;
>> +        have_iphdr = 1;
>> +        skarg_maybe_null = 0;
>> +        skstate = BPF_TCP_SYN_SENT;
>> +    } else {
>> +        direction = NET_PROBE_OUTBOUND;
>> +        if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
>> +            /* NULL sk in arg1 not arg2 (we dont want ctl_sk) */
>> +            skarg = 1;
>> +            /* skb in arg2 not arg1 */
>> +            skbarg = 2;
>> +            have_iphdr = 1;
>> +            /* tcp hdr in ip_reply_arg * */
>> +            tcparg = 6;
>> +            skarg_maybe_null = 1;
>> +        } else if (strcmp(uprp->desc->fun, "ip_build_and_send_pkt")
>> == 0) {
>> +            skarg = 1;
>> +            skbarg = 0;
>> +            have_iphdr = 0;
>> +            skarg_maybe_null = 1;
>> +        } else if (strcmp(prp->desc->prb, "connect-request") == 0) {
>> +            skstate = BPF_TCP_SYN_SENT;
>> +            have_iphdr = 0;
>> +            skarg_maybe_null = 0;
>> +        } else {
>> +            have_iphdr = 0;
>> +            skarg_maybe_null = 0;
>> +        }
>> +    }
>> +
>> +    /* first save sk to args[3]; this avoids overwriting it when we
>> +     * populate args[0,1] below.
>> +     */
>> +    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));
>> +    /* only allow NULL sk for ip_send_unicast_reply() */
>> +    if (!skarg_maybe_null)
>> +        emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>> +    emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
>> +
>> +    /* then save skb to args[0] */
>> +    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
>> +    emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>> +    emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
>> +
>> +    /* next save sk to args[1] now that we have skb in args[0] */
>> +    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
>> +    emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_6));
>> +
>> +    /*
>> +     * ip_hdr(skb) =
>> +     *    skb_network_header(skb)    =    (include/linux/ip.h)
>> +     *    skb->head + skb->network_header    (include/linux/skbuff.h)
>> +     */
>> +    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
>> +    dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
>> +    if (have_iphdr)
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
>> +    else
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
>> +
>> +    if (have_iphdr) {
>> +        dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6,
>> +                 "network_header");
>> +        emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2),
>> BPF_REG_0));
>> +    }
>> +    /*
>> +     * tcp_hdr(skb) =
>> +     *    skb_transport_header(skb) =        (include/linux/ip.h)
>> +     *    skb->head + skb->transport_header    (include/linux/skbuff.h)
>> +     */
>> +    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
>> +    if (tcparg) {
>> +        /* struct ip_reply_arg * has a kvec containing the tcp header */
>> +        dt_cg_get_member(pcb, "struct kvec", BPF_REG_6, "iov_base");
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>> +    } else {
>> +        dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>> +        dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6,
>> +                 "transport_header");
>> +        emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4),
>> BPF_REG_0));
>> +    }
>> +
>> +    if (!skarg_maybe_null) {
>> +        /* save sk state */
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
>> +        dt_cg_get_member(pcb, "struct sock_common", BPF_REG_6,
>> +                 "skc_state");
>> +        /* ensure sk state - if specified - is what we expect */
>> +        if (skstate)
>> +            emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, skstate,
>> +                         exitlbl));
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(6), BPF_REG_0));
>> +    }
>> +    emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(7), direction));
>> +
>> +    return 0;
>> +}
>> +
>> +dt_provimpl_t    dt_tcp = {
>> +    .name        = prvname,
>> +    .prog_type    = BPF_PROG_TYPE_UNSPEC,
>> +    .populate    = &populate,
>> +    .enable        = &dt_sdt_enable,
>> +    .load_prog    = &dt_bpf_prog_load,
>> +    .trampoline    = &trampoline,
>> +    .probe_info    = &dt_sdt_probe_info,
>> +    .destroy    = &dt_sdt_destroy,
>> +};
>> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
>> index 0c621197..798e67ee 100644
>> --- a/libdtrace/dt_provider.c
>> +++ b/libdtrace/dt_provider.c
>> @@ -41,6 +41,7 @@ const dt_provimpl_t *dt_providers[] = {
>>       &dt_sched,
>>       &dt_sdt,
>>       &dt_syscall,
>> +    &dt_tcp,
>>       &dt_uprobe,
>>       &dt_usdt,
>>       NULL
>> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
>> index 59a8d62e..4db89b45 100644
>> --- a/libdtrace/dt_provider.h
>> +++ b/libdtrace/dt_provider.h
>> @@ -87,6 +87,7 @@ extern dt_provimpl_t dt_rawtp;
>>   extern dt_provimpl_t dt_sched;
>>   extern dt_provimpl_t dt_sdt;
>>   extern dt_provimpl_t dt_syscall;
>> +extern dt_provimpl_t dt_tcp;
>>   extern dt_provimpl_t dt_uprobe;
>>   extern dt_provimpl_t dt_usdt;
>>   diff --git a/libdtrace/ip.d b/libdtrace/ip.d
>> index f8b77f12..d59bb436 100644
>> --- a/libdtrace/ip.d
>> +++ b/libdtrace/ip.d
>> @@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =    20;
>>    * to the net namespace (nd_net in struct net_device).
>>    */
>>   typedef uint64_t    netstackid_t;
>> -typedef __be32        ipaddr_t;
>>   typedef struct in6_addr    in6_addr_t;
>>     /*
>> diff --git a/libdtrace/net.d b/libdtrace/net.d
>> index 6ac34287..45b5cba3 100644
>> --- a/libdtrace/net.d
>> +++ b/libdtrace/net.d
>> @@ -25,9 +25,13 @@ typedef struct conninfo {
>>        string ci_protocol;    /* protocol (ipv4, ipv6, etc) */
>>   } conninfo_t;
>>   +typedef __be32 ipaddr_t;
>> +
>>   /*
>>    * We use these values to determine if a probe point is associated
>> - * with sending (outbound) or receiving (inbound).
>> + * with sending (outbound) or receiving (inbound) or a state-related
>> + * probe (i.e. neither in our outbound).
>>    */
>>   inline int NET_PROBE_OUTBOUND =        0x00;
>>   inline int NET_PROBE_INBOUND =        0x01;
>> +inline int NET_PROBE_STATE =        0x02;
>> diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
>> index 54e310cb..d4beea87 100644
>> --- a/libdtrace/tcp.d
>> +++ b/libdtrace/tcp.d
>> @@ -8,7 +8,6 @@
>>   #pragma D depends_on module vmlinux
>>   #pragma D depends_on library net.d
>>   #pragma D depends_on provider ip
>> -#pragma D depends_on provider tcp
>>     inline int TH_FIN =    0x01;
>>   inline int TH_SYN =    0x02;
>> @@ -60,7 +59,7 @@ typedef struct tcpinfo {
>>       uint32_t tcp_seq;        /* sequence number */
>>       uint32_t tcp_ack;        /* acknowledgment number */
>>       uint8_t tcp_offset;        /* data offset, in bytes */
>> -    uint8_t tcp_flags;        /* flags */
>> +    uint16_t tcp_flags;        /* flags */
>>       uint16_t tcp_window;        /* window size */
>>       uint16_t tcp_checksum;        /* checksum */
>>       uint16_t tcp_urgent;        /* urgent data pointer */
>> @@ -111,13 +110,16 @@ translator tcpinfo_t < struct tcphdr *T > {
>>       tcp_seq = T ? ntohl(T->seq) : 0;
>>       tcp_ack = T ? ntohl(T->ack_seq) : 0;
>>       tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> -    tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>>       tcp_window = T ? ntohs(T->window) : 0;
>>       tcp_checksum = T ? ntohs(T->check) : 0;
>>       tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>>       tcp_hdr = (uintptr_t)T;
>>   };
>>   +inline int tcp_fullsock[struct tcp_sock *sk] =
>> +    (((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
>> +     ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>>   /*
>>    * In the main we simply translate from the "struct [tcp_]sock *" to
>>    * a tcpsinfo_t *.  However there are a few exceptions:
>> @@ -158,47 +160,45 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>               ((uint32_t *)&((struct sock *)T)-
>> >__sk_common.skc_v6_daddr)[2] &&
>>           ((uint32_t *)&((struct sock *)T)-
>> >__sk_common.skc_v6_rcv_saddr)[3])
>>           : 0;
>> -    tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
>> +    tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
>> +        tcp_fullsock[T] ?
>>           ntohs(((struct inet_sock *)T)->inet_sport) :
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>> -        ntohs(((struct sock *)T)->__sk_common.skc_num) :
>> +        ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>>           ntohs(arg7 == NET_PROBE_INBOUND ?
>> -        ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)-
>> >source) :
>> +          ((struct tcphdr *)arg4)->dest :
>> +          ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>>           ntohs(arg7 == NET_PROBE_INBOUND ?
>> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr
>> *)arg4)->dest) :
>> +          ((struct tcphdr *)arg4)->source :
>> +          ((struct tcphdr *)arg4)->dest) :
>>           0;
>>       tcps_laddr =
>>           T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>>           inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>>           T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>>           inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
>> -        arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> -        &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)-
>> >saddr) :
>> -        arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> -        &((struct ipv6hdr *)arg2)->daddr :
>> -        &((struct ipv6hdr *)arg2)->saddr) :
>> +        arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
>> +        inet_ntoa(&((struct iphdr *)arg2)->daddr) :
>> +        arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
>> +        inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>>           "<unknown>";
>>       tcps_raddr =
>>           T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>>           inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>>           T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>>           inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
>> -        arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> -        &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)-
>> >daddr) :
>> -        arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> -        &((struct ipv6hdr *)arg2)->saddr :
>> -        &((struct ipv6hdr *)arg2)->daddr) :
>> -        "<unknown>";
>> -    tcps_state = arg6;
>> +        arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
>> +        inet_ntoa(&((struct iphdr *)arg2)->saddr) :
>> +        arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
>> +        inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
>> +        "<unknown";
>> +    tcps_state = arg7 == NET_PROBE_STATE ? arg6 :
>> +        T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>>       tcps_iss = T ?
>>           T->snd_una - (uint32_t)T->bytes_acked : 0;
>>       tcps_suna = T ? T->snd_una : 0;
>> @@ -229,3 +229,9 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = I;
>>   };
>> +
>> +/* For tracepoint, the last state is in the sock state, next passed
>> as arg6 */
>> +#pragma D binding "1.6.3" translator
>> +translator tcplsinfo_t < struct sock *S > {
>> +    tcps_state = S ? S->__sk_common.skc_state : 0;
>> +};

