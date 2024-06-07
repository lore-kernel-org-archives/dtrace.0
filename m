Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443014B95F
	for <dtrace@lists.linux.dev>; Fri,  7 Jun 2024 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717786103; cv=fail; b=Kr86FYb+6TA9SNWGGQIXbWTFd+fQr6M6aI/s2cEV7R08CWZpJghhe2J3E8ipDexxh8f5XWNZnlaqMvoULN0T1YEx/M71YyJjfaLxvtHa+VdNiVbi6fELz9hnAdXiz+TNmRG4xvs8etO/KN+MOxJXHKOsI2ur0rEhaZPUADUMIls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717786103; c=relaxed/simple;
	bh=mgXWsmv8clMidG7UxerQtRkqEiuMu6W6/4LkBOD+LOs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=D2ZPKVoMpNNNfaPzR8ODfvHVo8QQh+MBx6ZDLoyE/zyHM6OV/Vk2y1RlSlRMvvahyLyUrCAP0+2Synu8fBQFflpTcwB9IKgK0FvlmiAuBGaNANjqfMffpoO2X8UgbUHS13Z56CO6kmZn9erRl0bBLLHO15rlEeEDv564e02xKC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YWHn1RRG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yMLrze3Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YWHn1RRG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yMLrze3Q"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 457CucpK029337
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 18:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=BbpWrew1PYrmnD0IFf0DXyHKVpZf96xsFRaO2oMoAfY=;
 b=YWHn1RRGxRvx0dnJcOOfDs0iU4BwZGLIFs7Gip5VEJQE545SdyAXwDxCAcsbnSZ61MYl
 rO1UOwpCM+A0O9D8mFgsMmNCp/UTgdlT7k5ESpEkYjWnp1mGs0jd5gUFQTynHi5qwskj
 i0ESD20VEbBHRRuFOWQX9TJ4qFygaLLitmZKO67oioQllYNeMDxU1DNw4wqwi2M12vGl
 vwM3vXTqjMP1N6wOR6Ma5eNl5pXWOiKrPN/YgZ+XapLAZag6d+24CcHmkHeYyZrfnkk5
 ypzIO82hJoTAk+ETQlJ6LlFjYIc0pv+kbo4pDhsKTYmVv9X+oyNn0MYiTt93LdfuNP23 Aw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbusx847-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 18:48:20 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 457Ie9oO016214
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 18:48:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrseu8n7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 18:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftYrqIZnW5qjScxzyNQyBsgEKlIZ7BjUfzn7AQWHNiNO9CSGXEFYOOGBbRbudqJrei9pF89xjsDbTFeDvhkDZymoeQdD7v9WXu0/dAqvjGFEKwufi5X7M+XT72c4PJiJR7fY6YkohJFaNhJmhGdkvVRfe7qeTWQtbuV4vbjtmoroSpBqxqYyeT4oKS0n9SMRhsCvt633aqcsbYCe2CoGBL7QvQNZmmVhePh0lCrU4UGZ+H0x4hs+Yrff0dVQZFDHa0TgCLyd1de3YflpP5FAp8X3YG6SW7NAIBTPUGg7FaKo7vbi7+uTdYgQtbh/xp4biU0OurN/AViZqJIilfxJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbpWrew1PYrmnD0IFf0DXyHKVpZf96xsFRaO2oMoAfY=;
 b=VUPeHIlpIS0O+6DskDxR0Vw/SPKfUymFOyQIBrNqp3leAPiqnhnmxbWuhVeyRS0fV0EGf4ric/qiBvdu3KYXLSb5llv/vZhYw//jTran9l5Stv171pY1e9kBSze7NvPCa3wH5KkPH+Upbt58oDQdveo0kyGmpfWmdc4SCfaZ3wbIXwVuL1+ZYUeKM0o+3XU5SeZU9HIcDlHqc2Z225FfcxxnTaonftE3F6+6DVKysaeOv8ex7GUy3S8RIIB9CkQJVoQAvdz1UFQmdIouxliE3V+olDoSRCgpOqFqVQbu4H7FXEEQAuUaZiWgLDLlnqiNCNEaN5c2rDE/YMpjsvowpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbpWrew1PYrmnD0IFf0DXyHKVpZf96xsFRaO2oMoAfY=;
 b=yMLrze3QVwuzDBjW32HkBZanCP9/cNxPWLlzG7n7Gk6Jx13HcVaKa4o1jq0pd64b4BrD9w3z3DlOwS/aJYSXeWVX1KlZlkLby2Ok7JvzngUJfwq+5CeP24RUiKZLhKU/q+qYDv0DcpeoYcMFjJYZgc55KFQbCPM+BRVYHypIAik=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 18:48:11 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 7 Jun 2024
 18:48:11 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Eugene Loh <eugene.loh@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 03/14] Let USDT module names contain dots
References: <20240604181113.11505-1-eugene.loh@oracle.com>
	<20240604181113.11505-4-eugene.loh@oracle.com>
	<Zl98PpyXNh2aSbCL@oracle.com>
	<b3426a7f-c611-4758-a077-5f3aa81bd705@oracle.com>
Emacs: there's a reason it comes with a built-in psychotherapist.
Date: Fri, 07 Jun 2024 19:48:05 +0100
In-Reply-To: <b3426a7f-c611-4758-a077-5f3aa81bd705@oracle.com> (Eugene Loh via
	DTrace-devel's message of "Tue, 4 Jun 2024 18:30:49 -0400")
Message-ID: <87v82kmvx6.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0368.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::13) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 84923fe9-eae1-4d1f-e4f8-08dc8722619b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SlFsZnQ2Y1ZjSWF5ZEg3dytyZ25INE5EYXZNUkVaSjlycUp6aWYrRGdWcjJu?=
 =?utf-8?B?TWNiUS9QVTVDM2g3L2JRd2FZenZibzJvVVZOQnJEZ0xzUE1OamdrNFhDOGNN?=
 =?utf-8?B?YWNuMnRHWlFQODhYL0dqM3d4OGxuYm9yeWc3ODBDUXlSVXl5eHBsWmY4Tlpx?=
 =?utf-8?B?SllUVWRkSGVDdGRJUERCTWE3am0rU3VjbzUvVzRUUkoya282MEhsRTFPbk5h?=
 =?utf-8?B?SksySkRwa2NrRHgrUDJYMTRMVUdna2U4bStYdVJRSE9Ocml5NHRBRkdRUjkw?=
 =?utf-8?B?T2dmTEttM1p4OXNGTmU1VDBodjFiLzBnQUJ6dGpQS1pOTmN6dlBTOWN6K3hi?=
 =?utf-8?B?M1FHN2NXR2ZuTzJPVzNUVVd3b1pralJTQnJYMUhEb0VYZ0FFK0hjOVJ1Ymgz?=
 =?utf-8?B?YVRUYklTOGdQdENhNktVZUxYZ2R5WHBnY3AwamgzcjA2NUMzTTNacmFERUJY?=
 =?utf-8?B?K1VBL1V4VUxqZkF6YWI0TWVRUVlLcW9TaGQyOG9GcFluc1RZbnNuVUdFOFAz?=
 =?utf-8?B?dGpqZnZFWDdQWnB1Z1QrY1RDSDJINkVleEZJY3VlVDRYRnh6RFVtN0tnMWEx?=
 =?utf-8?B?Zmh1RUh5anVqdVpWcHZ1SGQ1UnA5S2czUmlNSUtYeFV6cmg4R2xDaE92UDNu?=
 =?utf-8?B?eXZ1N2pyRmdTNE0vdFBHSzFET21UalRuTExYOWtzYXRzbTVuWnRNMGN5VTFE?=
 =?utf-8?B?NkFLK0tkTVg2VVlPMkFxdU1Na1RlWm0vN0VGMWNrQ2E4RG80VE93SnZrVXhG?=
 =?utf-8?B?WDJ3amd3NUVhUzJ6VXJHQ0hITURteGxON2owaVcxRGdaM3FETk5KMUZjejdj?=
 =?utf-8?B?UEkreDA1eDRCS1Z6VzR5cGI5MWFBRmN1R3pmU0FIcU1mMUJSS3p2ZU90SG90?=
 =?utf-8?B?VzZOSkJ5M2M0UE1UdmhnNnVxNWgrcHZQanZiWlI5Mnh2WGZQMThiWnMvZkpn?=
 =?utf-8?B?T2JuQ0J5V3NFbE9kTHRKSnVTL3ZBenpBQjZBWFRpNFNVMnozKzl2R3NsaEZz?=
 =?utf-8?B?ZGtwRHNOeFpEUUtWYmI0V2U2ekZDenlOWU5lanBVcVRGYUhuUW9KVmQxODZQ?=
 =?utf-8?B?SHBVQTZZdzdLSzhZR3pRVFNNWnJBL3JBMXc0SVY2NVdaRE9PM2poamtvV25o?=
 =?utf-8?B?TXZwTTVCdlpHajFvQUx6cldTYlF5UU1HRG9icW1kWnNPVCtxd3I4Rk1NQnQ4?=
 =?utf-8?B?c0NVWEZrNld0Vno2K1RVLzNMYStvWG5GVkorY0N1d2YwNFVnVDk5aEZGYllO?=
 =?utf-8?B?ZmwvRnVwK3pMYWVsMWhoZXdMNDBDVE50SThVUzlsYjlBZmU5N3Z0WitINGJC?=
 =?utf-8?B?SGlaT0orLzd1SUZjdDMyNnU0TXZ6eVB5dTNjcERZaTc4RDViZzB1QmNPNzYv?=
 =?utf-8?B?NUVNQ2dGN3hqRmo3eHZGRVpldU9kVndlSTZncDduUHNkVWFBaUp0Y0swM0lF?=
 =?utf-8?B?Tk1qVExCaVJSamtCUXpJN05COWNBS2hYOXNvYkt4bTNVdTV1YXhOZmZoRGFv?=
 =?utf-8?B?MTczdVl5TFRxcVJtTDYwek1yVFBobzJSVUdpdFp6bTNqR0NMd3V0Z3hianNj?=
 =?utf-8?B?ME1BdUhnWlhuRmFYQ2hDa3dUejdpTVI2dkIrcDVDU0lCYXFIVWJXNHhzeTlK?=
 =?utf-8?B?UHhmSWxuUjV6cUVMdm0xc1ZKK2xrQ3FGVlJxL3FpMmpOWXB2Lzgvb2M2RnVL?=
 =?utf-8?B?OGpNVmE2dVpremhPVDh3dmRTcWpINWcwNGd1eWlseFJ5bmkwTFc5TVFmNjFa?=
 =?utf-8?Q?8ROYyubl/ti5D97DVLVtTNb1Jj9DfksNJnwj+xd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RElPejhyb2QwU3FkaTNYVjVvRDd3Mkc3TW90a29jTWU3RlBReFhRaWlwTHA0?=
 =?utf-8?B?aHFoTVY5OTlTM0hmVU1wVy9uTHk5R2M3S1V6Um1pbTN2MzRQVm1EVkZwMDlw?=
 =?utf-8?B?OHJKc2ZGKzRNZS9yejFibnNOZWtLQjRMNzlUMGFzVXFWRTh0UVBtRmszWGtl?=
 =?utf-8?B?djdDUXZXOUxjblFXakxNQWNPTmlwT1BOclBNMVN1SlB1dkl3aHVlL1FSSmtJ?=
 =?utf-8?B?d3JWNkIxUUZpQXpxUDZyL1ZCLzF6UHkwYUpxSWkvZGdDMi9mWWNvT2QvWEJz?=
 =?utf-8?B?eERsSGZEY2RYTXY2WWM1N2Rwd0dBR3dhREdEMVp0N3BXZHRUOVdDVGlFZlg4?=
 =?utf-8?B?eW95STcvTUloRDJnNEU5V2xiY1dZS1BZdjRJY2lKWUNtdFVvcnM1aGFFZmdZ?=
 =?utf-8?B?VE5TR0ZVSHpmelIydXdTNEtaNzFrSUhEKzhnVllacU0yVkQrck9wL1ZvY3o2?=
 =?utf-8?B?NkJucmE2U2ZtbUNVOE1PYlpKMlI5WFg3Rlk3NzVtSzJSVEJIcXM5YnNsWHYy?=
 =?utf-8?B?Mk9vS0V5dkxNQzBkUmR5U3U5QWRyaDZMY29wc2NhVi9SelZSNFkxVDFXOVVE?=
 =?utf-8?B?YkFtYVJyamRJMmRDSm5LelZVK1JrV2pYRHZSTGhkWUU2MmRZZUZlK1QzRnJZ?=
 =?utf-8?B?STBWeGJEb3ZnSjZrckJ0Tit1NkNHZmVxWnFxbG50Q01hcElvM2RqQUZwb2xH?=
 =?utf-8?B?THZDOG1DY0N0cDg3dTFhR3B6S0Q4YWhUckNhOTFraHZpQVlVYlgvd2phTFFj?=
 =?utf-8?B?dkh6UFJ1MVQ0UHMvVmZickpXUVhLbEZCdTVXNDRTSGNxVlduQTlSTTBnK3Z0?=
 =?utf-8?B?S1hTRUNoOFoycUpmWkoyY2R0V1VKcHo5K25EaEhiSng5NFc2Y0FnZnd3ZkUx?=
 =?utf-8?B?WW95RkVHT25aejBhYi9od3h1ZVRBZno4K29kckwySnRMODNtWStHSmhHZHNP?=
 =?utf-8?B?QXZvc0xPQWtaalZrSEM4WHFKZEVTNUYxYVlKN1VCQno2SXhrdVEyYk9oMDNm?=
 =?utf-8?B?aG9DenlldU1XTnMwTEJjOXlBKzNvWVRuT1VzUWtTbDRDZkhsSEt5bWhpbllu?=
 =?utf-8?B?K3IxelB3dUFpdnF5clVRTDVVZjU4SFhXeTlidk00dUxxSGFEZHhYeFcycFFu?=
 =?utf-8?B?Qm41ZE11WUc0a2lLbkYzNHY3SHpjRGQrSVRuU1locEQ4UllpN1ArRmRnOVVU?=
 =?utf-8?B?NzhzREs4aFV3U1B3NEJ1b29ITFQyd25vaGdzUHRPenphdllmVkF0NFRpK2VX?=
 =?utf-8?B?aTRyLy8vMXRETHliNkRBMS81RGtPS1Y3eFpCaTdSZ1NKZnFkYThrSDVYL1lQ?=
 =?utf-8?B?QnZhLzQxV3Qrb294OFNtdFJyYmhJcG9DMVFGeVZ6MDlpdzhPWDBsQmgzeFVR?=
 =?utf-8?B?TzhiaEdVWTNFQ2VzVzl1UFN2blJ2b25sZnZ5czBObW9BbGZES3B6MW5QUFpJ?=
 =?utf-8?B?bW9IUVp1QVZ5WmR1UUJscFpIVndINGd5M3h4L2VZZU9yVjRZbitWVTd4Mnh6?=
 =?utf-8?B?T2hsTlp5cmJ1eTBwWmVNbjJST3FIMGFBUjNsb3ZXWW52UDhGcmhuc0tyOWk0?=
 =?utf-8?B?eUJlMDJ4REJkeThKN0JKUjFrL3Q1ajZSYnlZRHZpZUtxVTAvang0cDZYY2o4?=
 =?utf-8?B?alVrdlUvQ0dJbEtpdFpxZVhlclJIL0VTWEM5enhHZXZ1czVSOTBaZEsvdXJ0?=
 =?utf-8?B?UWR0TVZFT0h4L3ZPcEw2THR3TDhaV3B1U0c3dTJJaEs4YzIySmlXQ2pvc0h6?=
 =?utf-8?B?OXdTeEtqWm9iek93SUF0SkJ3N2xOK3NkaUpvVVR3QUppYzZld1VOYXNGR3Bp?=
 =?utf-8?B?TU5veUVFTG9WQ0V3clhwV0RDSWVlb3dsa09XaEZocVRPTVhRQ0RRWUZqd0ha?=
 =?utf-8?B?SnB0SXpDNlpCK2MrbHJ6clpNQTJYQ2gzU2szOXRJODZha005MU5OL2xrVEcy?=
 =?utf-8?B?MWFtL2hUdExPaStQZ1kxb2Y2NjRmcVBDR1UxdGRsOVd2SGVSamYrVkNnRHRk?=
 =?utf-8?B?QVg4MXlzQ0VyMmhoSzNNN2hkbHJHc1UvUktrblJ5ZWgrUzAwVklkVitBUXFa?=
 =?utf-8?B?bXlEdU9nSDZjUDlKZ0t3cUZteDRqbVkxQUVPNks4eE9CMW96eUxVWVRjd3kv?=
 =?utf-8?B?QWc3dmZXMTU1Yi80TktvTVhyc3JvcnRqWVFWSGx4SWpxWUdIUXJPT3RCV1or?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qS0W3ZxdiV80/Ut9uYdO7COyqAapRd4w5p/JP90iJwepRKGx1WUiIhRYU8vocpgg1Rzv4wtGdXR+WNirMhIE0pFc1BlPdPHmDfxbH4SWVosPmtIaEdob9P5dfWP4gd7/Jdt+1rR5hrqgzNlLr/Kzsomet7NhO2JT2AqDkss6vQoqphU4kYOzj8b5y+NCXfuzTETQDOpjPeL8/TZeQb96tW8V2jv7uqXGTRjfO4A0KEqgy4iAVSS/OHwo19mwjOA9ex5/O6n0HBVtSCI+vS5XrLCagBe6+bcYqCzgYDoq6aGRBA7sOCcfNEEfMnAhMzTeA2ugzECY7OhK5WvBvv28Q/pV3eOLcTApQZM+5WvM5agrvaKGiAUgnoCCheIXtIp4sGynYrrHe+3x2/RgG4369qTZ5xG3n83hrg2Rh6vvqQpyoYJKFY9poHwtbaf1s1YHbuH8H3bW12PUV1rYbM+CxwHkSUhjmDsTD8pBRjnD0NzvfnJCIA264VKZnbcTyxP/0QOFwnmEtWSVO0+bOzUjPOBdyv5EGu2Ijbxw5PDgVh7sat1NXcoaPkrvpPNgSqoMH2naWzUboF0T5WJXOFm6W/HDm2v/6bMxsx6SmLqnwZg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84923fe9-eae1-4d1f-e4f8-08dc8722619b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 18:48:11.8467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ce79OMTW1j9QuLYx+mogNny76At/gGz6RaZ1OqsPMrvRGf7V6pvzsTZiz6d55q3NdnJ7P6jFzChP6Uo3UWR7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_11,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070137
X-Proofpoint-ORIG-GUID: s3Yb6zNk8GgE1qaUUkNfPyRWNPPHZMNI
X-Proofpoint-GUID: s3Yb6zNk8GgE1qaUUkNfPyRWNPPHZMNI

On 4 Jun 2024, Eugene Loh via DTrace-devel stated:

> On 6/4/24 16:42, Kris Van Hees wrote:
>
>> I do not know what to do with this patch.  Either it is correct and then=
 the
>> code should not be #if 0 .. #endif, or it is not, and then the patch sho=
uld
>> not exist.
>
> I was looking for feedback.=C2=A0 If we're good with the patch, the "#if =
0 / #endif" stuff will be removed in the final version of the
> patch.
>
>> Consider that the tst.dlclose1.sh test has output like this:
>> test/unittest/usdt/tst.dlclose1.sh: Running timeout --signal=3DTERM 41 t=
est/unittest/usdt/tst.dlclose1.sh /home/kvanhees/dtrace-bpf-user/build/dtra=
ce
>> PASS.
>> started pid 68990
>>     ID   PROVIDER            MODULE                          FUNCTION NA=
ME
>> 97026 test_prov68990        livelib.so                                go=
 go
>>
>> So that shows that the module component certain can contain a period (.)=
,
>> so the module component can certainly contain a period (.)
>
> Right.
>
>>   whereas we know
>> that the function component cannot.  Likewise, provider name cannot cont=
ain
>> period as far as I know, nor can the probe name.  So, only the module na=
me
>> seems to be an issue.
>
> There are basically two distinct cases here.
>
> In the dof_stash.c case, I note that we are checking a string of the form=
 "%s:%s:%s:%s" to see if it is "." or "..".=C2=A0 That simply
> does not make sense.=C2=A0 I think the indicated code should be removed.

Yes -- that was a mistake. What we want to ensure is that none of the
probe components *consist solely of* "." or "..". This has to happen
before any attempt is made to write them to the DOF stash, and before
any attempt is made to *look them up* in there, to avoid unintended path
traversal.

This is, I'm afraid, a security issue in the presence of potentially
malicious DOF: we can't just do nothing.

--=20
NULL && (void)
