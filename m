Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B5F1BD4EB
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 23:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731368672; cv=fail; b=QK14atWJhSswblSXKrj7gQmi68H+U0s6Ae8c7vjVBYI5/UIzJ0ralCikk6rZ2uUuBOnM4+5oX3CkZJPdeth+8UopscbLmS3ezP4EVE3793qydxb3+qZxVVZMk+0BsUHiEoCOJx2XjTnF6sbexhOZdG+o/+jsioc7/e5ow9VMLlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731368672; c=relaxed/simple;
	bh=A1TQrCgzrB8zz2EvA7DYkKaQ0rcNqWtrg7VAqfSyzds=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N0F+XhPh0QpyZpqEEGAaP7U3qqLmAG5ex4iq/Ntg1rQXQPf9zPnWPAmoPDYBgXvOqbwW64DejfKHVfiNUVQiLYkunGpUCEl9n0Tj3b8OilRjoXrs3MG3qqsZmXgasSGsVfTax4zqoIHpGHG+3mVEAaeJbo2D6b4mBxsyK/F1bII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NJIb84b+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LGJpZQg0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NJIb84b+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LGJpZQg0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABMtkON004786
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 23:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=JXpmAav6Ikbm0jcc2cUP1s5fVJgNHp/2uZo7QJOFENU=; b=
	NJIb84b+2YWprMpLXzfdIopepHHzR125U2wEF/n5hY39HULIId6iJTsErxiA9fpz
	i6C9N/ISBogyfpZ6Adcc69oEBodW7nOZShNiSLumydLpNIqhZhIkvUFKDTIagZXp
	LmVlZX9H0fxIHGLJ4mNBH4f5UGs3RiW3skGUETHJYKSq/EwoR+r8T+KMDMh3c/+r
	xA2X9VGMSz+TpPeyzXnYmLwft6Zv86qnHahSAur2poN8n+DfvgNv/UU7sh+jL5p+
	+muIDYPPDXyfv3cBj8oABPhkE0aAz9A8lHotoy0liiw/FhWe0wPM/OvjQ8w+rYcp
	nauiABifyxd6SHBKCdP57w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0hnbb1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 23:44:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABLfHbq024252
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 23:44:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx678svs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 23:44:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhIJJ3EiOxFH3ifcspcDanA/bbKJ6c1GUT5lee0Jsds1iJsFihJmdij8Us6csOojDqc1HtaPrTiLUefyFDyjCO6x/r+lrdZnn7WTTosfx39pd4HbwXlfmH9ofT6+Pldo9s64KSLklBKTPBUVFxaorxh39bQI9yFt9cHr/bTy2Pl+0dLQ3fIhK9RBORSUgXPU2Z/il3CcePTEFji4f1NZRsLnN2MWHYCcX0rowRj5WIUAsqjWzeBt0htGH9+qxH449hfnaXyabWcBly3oh2WsD7Zsdex6S8PqNNFAS2PbNe2dXN5y5MKARtlc2aKV7nJLKhuiRHd1Dqy7x2Y0Yw73yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXpmAav6Ikbm0jcc2cUP1s5fVJgNHp/2uZo7QJOFENU=;
 b=JADTamJo7dB7Lcugu+XAw9HvPioPrAREKFozYT+o9CWWjOm1X1nncB1dT19fMhctAYoHJXxvcGiFZC3BG2l+KIj2hWpzjzurXxZ2uivey8Sl4nxbpebCrK6jeltvHAm3AMc451GgCH1/0s+XMAR74RIEOGEk3zV7CP0Z07ETLoxFsN5uVjBsstrr3pjdWUorD5FWrG+VSLMjr6wsXjvdTBlFFYCTHGNWTB3c3+2cPxHqD0OIQlCbNTx4jcTH10wY+DBJPJqawrHr15MiY9bPU3GD+XvPcWc+ETwa0cIOWhPj2GM1XWHTyOpsDb76cGLxUxFXAG+Oa8Y94RQi7ZdbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXpmAav6Ikbm0jcc2cUP1s5fVJgNHp/2uZo7QJOFENU=;
 b=LGJpZQg0Lpi3zEyMXhZ3I0kfo/T1p/MgAriUJ0Y04GoWukfJiV7P5BRbj/YW3SvR5p/tmvlvOzOFpEfUhBZkIPg8f3WPZsri/EGB83DI3iKYzl/zgT1bBViqa1TejKGgWxgm+zinziFfKPfLnfKSkOyo1pM52n2eE0qoP2IKdbs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6813.namprd10.prod.outlook.com (2603:10b6:8:10b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 23:44:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 23:44:23 +0000
Message-ID: <f0dfca8f-b00b-529e-3ea8-f494d4aebbae@oracle.com>
Date: Mon, 11 Nov 2024 18:44:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] Allow arbitrary tracefs mount points
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241111160508.138914-1-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20241111160508.138914-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e41033c-94d0-48fc-71d6-08dd02aac56f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0RyQktrRUlnUFZLVlVPc29vRDJuamZDZEVET0RlR0NybHh0bEZHRUhBN0xq?=
 =?utf-8?B?ektJZUNBNVRmbmVOVXRIYlVWdG9DMEJuOVptdmV1elJIb2VJejNDcE5rclVl?=
 =?utf-8?B?TkU4d3RNMHFDamZ4UlJZczJkUkZVZTVyNC9Na2grdWs3cDFUM2UzY3d1bjBJ?=
 =?utf-8?B?MkdpQXkxUkU0SDlhN1Z6czRtZHV4RHFHbG4rMis3M2pJWCtrem5FOHJBK1Vz?=
 =?utf-8?B?SVg1ZE5HOEJ0TEVEanRwSEhONWQ4YlhGSFQxb1NDUUVueGNCZW9jbDFCaXE0?=
 =?utf-8?B?MGFMU2FucDJycmZGRjVjTU1TTHdoMjF3MU9OeDBHMkNzNEdpTmo1aTJ4V1lG?=
 =?utf-8?B?cmRIOTN4b0c4czJ1R0FMVzVHY1ZmVDJRNGJqQWlyWU9uV0dFWUNTQllwM01s?=
 =?utf-8?B?TUVzaHViYVloY2dvMGJBNzZKbVhyK3JYNklBT1VTY25GdjEzRmhVbFUxMCtY?=
 =?utf-8?B?TERMV3FBNERoMXcydHNlNjkrWGVwYzVROHQ4dFpoSENyQWZhZmxmY2FZZmE2?=
 =?utf-8?B?RUw3QVo1SHNUTlZNa2xwcmlZb2hjcU00cmJQQkZJbE0vamVON3JNN0hOUUFu?=
 =?utf-8?B?T2ZldzBoUEc2WFY4bVBLcFdabHlUMzBlYUFxSExvVXJsR2xySFdQb1A1Nk9C?=
 =?utf-8?B?aGZqd3hhWHNBRUtJSklIc2tWeUtCeGYwWGxMeERIR29yUHluQUZZanZCbGl4?=
 =?utf-8?B?SjF0aEJSeSsrVlM5bHFSMldNc1VnOHNRYlJwMGlNSWpPQWEyUHNEazBZQm9k?=
 =?utf-8?B?M2g0akV3SDhGRDdLWk41RXdNRG02ZnE5OEhLbzRQOXhTOFlPMXB4eVE2ekNy?=
 =?utf-8?B?Sld0aUFtS3FTcGptTjhxQUlWK05MWWZEbSt0N0NLSDY2YVZqMDNTQWluL3A3?=
 =?utf-8?B?dUUxZmtSS3RjTWhpSXhKRU5oVzJNMjIrVHZ0dVlkM2MyMldrK2RPYTBIU3pS?=
 =?utf-8?B?REMvdnY0WXd0emlWWGRDY2xpWkwxYnJZUlRDcFZUbk03RmFWa1BiOGIzekly?=
 =?utf-8?B?dGx1L2hhRTd3WjU2K3FNWlg3Q0xQaGQ5YlVFaThCaGNaSmpnNTYrRHhwQ1dE?=
 =?utf-8?B?MFBSM1BsNk41eStTenZZS2I5WlVsbHBpa1k0NHduQjJhWU5ONXo3SFRGYW81?=
 =?utf-8?B?aDliRzIzQm9Wd2ZWV3QweG9BcEE0eGdVOTZGS3lWaXBQeHpTVU5RNU9PRjF4?=
 =?utf-8?B?QUFPSWV4MElLZ2hyeWZwTU1JQzRMckcyTUpNamJXSHcyWGU4UnNzemJqQm1D?=
 =?utf-8?B?OGF1VHVOMGk4RDVHcWpLN0c5cW1iYmwweDNuWGJyOXlNUVhSMnpVQjI1eHhY?=
 =?utf-8?B?c3J2Qjc2WjVxSjBpQXlEaDRhM1dCQmR1SlBFNFh5Zno1czZONFdaaGpSNHo4?=
 =?utf-8?B?aVNiRzltMmRZVDZXdUpXbUxlR2xHNDZFWU9jcUhoeVJpc0EyQUZyQ2YxYlBm?=
 =?utf-8?B?c2dvTmorMTBOTzNpS0pyYzRYNXd0aGlXS2pLR0FFWC9HWHJkYzRubXBtSjEz?=
 =?utf-8?B?bktoeTIyTkNtNGR2TzV2Z04zeVRVczNoWmR4RktjcUZqZDExaGErbUJoMC9Z?=
 =?utf-8?B?QmFpOUFLM1NBUlJYVFBjK3FjWTAweW1FdU5kRmc1TC9pTFFPYnh2OVY4T3B5?=
 =?utf-8?B?S0htOWlKbEJzZSs4QjlQdUU3OTVpa3UwakVGSlYra1FuWWE4anBRT0t6T1VC?=
 =?utf-8?B?U1JxeCtHa2w0SXVzVDZWSDFDZmh6Qmh3OFVFWWhTcjNKdHk4UmUraUxySjcw?=
 =?utf-8?Q?T2kGRFuEoocXTFI/DH8m/FOT/S+kkM/WTYA3wQ3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGo0T1VURFVYeW1RRVhFLzN1Y1M5dndKY1UxdjVIb1kyMnFOcUVncGJpWXR3?=
 =?utf-8?B?YW5Yclp4bGlGejR6U3BNUVA2QThjK25iWGpnVHVEV0xwVmFxRzVUQ0tjVzc0?=
 =?utf-8?B?NEFkd0g3QWxaZHczSWY1endGVVZoMW95bVpFM0M0akZCMU5zTW1UU3Z5eHJr?=
 =?utf-8?B?TlBUV1lXTThmWWZTdkVNa3VSWkhmdVJoOWJRN1VGcXdqSXJmOE5rZVM1R3JQ?=
 =?utf-8?B?YjVOY0pqQlhhRWowWWI0bThBT0hXSmwzdlpCY1cwY2tldVVTQ2hpUkZaNGt1?=
 =?utf-8?B?WUxQZ3RGZ24rY3dFVmR6NGZZbTgzTnpDM2h0citEYUJMNHRZSGdrc2ZMYUo2?=
 =?utf-8?B?WmVwMWdZdEJxN0NOd3BkajI1Qjc4alg0eElNUXFHQTZEL2pUbDhzOCtRT2tK?=
 =?utf-8?B?dy9oN0J3S0FuWmp4SUtHSjhwTlAzZHRNblhPcUZVMFNaVSsyWmswZ3M1ZHRv?=
 =?utf-8?B?ZHRheUZHZlFpNGRtQzBQL1ZINVBSMWJQUVpxT2NOcVBWVi80dXN4SlI3S1dB?=
 =?utf-8?B?ZlBLVFV4eHZ1M2hTUXcrdXBRYW9YOFNkT1B4NmNlSldFem5uRGtnNkl4Y25x?=
 =?utf-8?B?cUhiWmlmVVY5NnB4YUMyZjFSd2poTGJlY25mRS9yQ2JBMmdzV1J0WGpTMTQy?=
 =?utf-8?B?ZEU0WjRvdTA2Y1BuOGpMamxaWCt4SEJnRkdRS3dGQ3V6QnltNjNQS2I1Q0lM?=
 =?utf-8?B?Z2RGQnQwU0l6RFd6ZUZRY0pkOWQ1SDk5dXc5S1Z5eWpFK1RrQ2EzT1lsaFdS?=
 =?utf-8?B?bWczRXpEUTUrbUhhZnpERnhuSGJHMmRkT1VwVy9UNjFQbDFPMnI0bzRONTNE?=
 =?utf-8?B?bkNILzVqYUNqSU85a0RPYmc1S293V29xdy9hL1NXN0tNbFBUdlVLWWR2MVRW?=
 =?utf-8?B?dEtXRVRqc1VHbjJDMDdJbVh4alFYWDMwaTFxVzNBdllsOHhjeHVYUldsZGdH?=
 =?utf-8?B?QjZ2cXlwU3RJVzZTREZnOC9PMVd6NzVUVGNVWE51N3N2K3NkWWpraTVZUlBF?=
 =?utf-8?B?NEY5dmY0ZXdTWGFiTFVNT0lIcFZsTXVmQmlteGVDTnRqb1l2dzhQdlVOZjRt?=
 =?utf-8?B?c3F1Vys1YXpQaE02dHNUa1hackkvT2Z2K1RLQzJRR0ZLRWErN0lSLzczQ0dl?=
 =?utf-8?B?ckF6QzBCRDVtdmg5eGc4ZTU1Y3lQenVBUzNpeVdUUnYyOVp1NDh6eVg5bjly?=
 =?utf-8?B?SEJaU0xoa25tR1V5RUFCbGc4QjUyTmF0aDArcE1EV1BpYmcxMUpydmZPRkpv?=
 =?utf-8?B?YVJQYU5WcFo1bWs1Umptb3JwVXVkczQrQkV6eGJwK0FVcmdnYTJLelpEZnZw?=
 =?utf-8?B?NW9FRjBTYWRJWlNSY3NSZmF1OFg0TXdiZ05PUXBLWXhmVlJ2b05YRUVLWGwy?=
 =?utf-8?B?bWxnWmNWSVZRSFpEZEh0Z2FlWmtKMVRTRDR1QmFudUxIUHdQVmxZQnp0cVJw?=
 =?utf-8?B?bFU4ZVUxei9oR1YzUnl3TEJLZkpGQkxydWpZaWN4RzM5Z3VNR2tQMlJFM2oz?=
 =?utf-8?B?SzdPK09xNklkY0k2c05vZlJBSUFKakhkdys1NVh4RVZ5dC9KL1p3TWc0K3o5?=
 =?utf-8?B?QmQ4VW5mbldYcWFGcE1aU0lVQktjQURBVjdMVGlMRDFzZW9TamM1VFE3SVRI?=
 =?utf-8?B?WFRDWU1Md0k3WUNHc3UzUDJsb1NkdEtrY25TaDZjRHFYMFQ3UTR6K2g4bFNW?=
 =?utf-8?B?MXFPVVNnWmx4S1NlcUZSUERJSnp6b052dlpRL0JzVlJjc1RBdkZoRzZZMXpL?=
 =?utf-8?B?d0dJb3owb28zOU9MNW1KK3NITFdNWnZLOERDd1RscStpU290bURTWFIxTzZv?=
 =?utf-8?B?Mnp5V3RCSDNBNnZQUStTbW01T2NPZURQdllUd0thZHlIYWdjY1NEcU0yZnll?=
 =?utf-8?B?RS9icS84Wm9XaE1iV2RzVEFZSGJDdXpPaTl5YlpJVVlMVEdXWVlIU1FuMDRB?=
 =?utf-8?B?dTRzY21NV2FrTEVmN3FhNTFjbU1ZK3Y4V1E5MU42TlNndlYxU3BrRU9jWjl6?=
 =?utf-8?B?YksxK1ZSUUZiMis2dFZoN2dSTHM5dlprTnpQMStFREpDTjlKeGl6L2x1Q2g0?=
 =?utf-8?B?OCtkVitjengrQ3czUVJQa0tManVaQWlFR28yd08rK2RrTFhjNS9sSUZyTHdw?=
 =?utf-8?Q?QG0qCP0Y8wLGeI4MCveP6Ns1/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YjSDpYfvZUpReebdWHO/0fx7zXsqP/1K6Eh5Hkqzc+mLmOZSL7OeKojSdX7A8EZZBZsDNwkyxPpfw+VInuhiWtwGznr9dPqaZHub45gHubwHPL77OgchA8tniYygRQiSvOc4kZMadNF/sJhx3Qs9qnLZAPxIJ1YXfAZXA4v1+qQtmjx4CcAtXwlAQf9HcKZsQ4vrzJ4kBpPtsHUB1lDQj6rgyBYftneQtADdchKnol7FB0Qz/EtuT+lCOFLEOwlPCVGbXyOLnWl3KyMC8foIwzfbaUTfs6rpvliBWQ2vdqoUMyPOtm7aoP5jrKvIVd9IUdaEJUs4qr5BWxcBPBwj/5GjxHD7ZZDdE37wugJSPwmU+98v6KrbcoWVhq8CxmOx6RfZ8iHCWEVGC0bUtGtL/DaJnuCiPNwXKzg3VnpphSqIj5nqAurjqJqyFoiUw7pnwUfN/yy2bODSfa5u1X1lks8B64jMMxx636Q5FKVL6klR3EKAHYPBLXxAS66JJcVPJRKrpve93VB9BOLJUr6jqfv1k4PKrhikqTq+bGUoCFqp3Rnpa8cr8oPu3Rm0vVgMypF+DEPSv42msgxYC1vCH3BdzllhXL10nC7Lu9b4shM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e41033c-94d0-48fc-71d6-08dd02aac56f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 23:44:23.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8q8lS0tRPmA3KV1sA67mEFGAIix+RuvThtLFTsSmDdyYF3dpV167W82k3qKICO+7tAT+/CMO4pZGa08JWMeRiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6813
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411110190
X-Proofpoint-GUID: dHptGMryMsM9ikuy9rS8rDQZpyGHHiaz
X-Proofpoint-ORIG-GUID: dHptGMryMsM9ikuy9rS8rDQZpyGHHiaz

Should dt_prov_uprobe.c's attach() free prb?  It looks like a free(prb) 
got lost in the patch.

Not big deals, but...

Various files have some leading spaces instead of tabs.

In test files, you often have a construct like this:
         if [[ ! -e $tracefs/MYFILE ]]; then
                 [... error ...]
         fi
         MYFILE=${tracefs}/MYFILE
This is not a big deal, but why not
         MYFILE=${tracefs}/MYFILE
         if [[ ! -e $MYFILE ]]; then
                 [... error ...]
         fi

In many place you indent some declarations in a way that's no longer 
needed?  E.g., dt_prov_dtrace.c's attach() or in uprobe_create() and 
uprobe_delete().

Finally, there are two forms of use of dt_tracefs_open().  In one, the 
int fd is used directly:
         int fd = dt_tracefs_open(dtp, fmt, ...);
         [... use fd ...]
         if (fd >= 0) close(fd);
In the other, the int fd is used only to produce a FILE pointer:
         FILE            *f;
         int             fd;
         fd = dt_tracefs_open(dtp, fmt, ...);
         if (fd < 0)
                 return -ENOENT;
         f = fdopen(fd, "r");
         if (f == NULL)
                 return -ENOENT;
         [... use f ...]
         fclose(f);
Admittedly, the second is a special case of the first, but that second 
case occurs commonly enough (10x!) and is complex enough that it's worth 
supporting with its own wrapper -- maybe some dt_tracefs_open_fp(), 
which calls dt_tracefs_open().

On 11/11/24 11:05, Nick Alcock wrote:
> So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
> canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
> this requires an explicit mount, and a great many installations have not
> done this and perhaps never will.  So if the debugfs is mounted on
> /sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
> as it used to, as another tracefs mount.  And of course there's nothing
> special about the "canonical location": it's up to the admin, who might
> choose to remount the thing anywhere at all.
>
> To make this even more fun, it's quite possible to end up with the tracefs
> on /sys/kernel/debug/tracing, but an empty directory at /sys/kernel/tracing
> (I got that during testing with no effort at all).
>
> All this means that the existing DTrace hardwiring for tracefs/eventsfs
> locations isn't good enough.  Instead, hunt for a suitable tracefs mount with
> getmntent(), and add a function to open files under that directory, allowing
> the path to be created using a printf-style format string (mimicking the
> things we used to do with EVENTSFS defines and the like).  This is actually
> all we need; there is no need to ever return these paths at all, so there
> is no clogging up the code with free()s -- and actually there's a
> noticeable simplification in most cases.
>
> Tested with both in-practice-observed locations of debugfs, and the
> obviously crazy and bad-in-a-format-string path of "/%s/%s/%n" to make sure
> that is properly rejected.
>
> Bug: https://github.com/oracle/dtrace-utils/issues/111
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   include/tracefs.h                             | 14 ----
>   libdtrace/dt_error.c                          |  3 +-
>   libdtrace/dt_impl.h                           |  3 +
>   libdtrace/dt_open.c                           |  1 +
>   libdtrace/dt_prov_dtrace.c                    | 27 +++----
>   libdtrace/dt_prov_fbt.c                       | 37 ++++-----
>   libdtrace/dt_prov_rawtp.c                     |  9 ++-
>   libdtrace/dt_prov_sdt.c                       | 34 +++++---
>   libdtrace/dt_prov_syscall.c                   | 31 +++----
>   libdtrace/dt_prov_uprobe.c                    | 42 +++++-----
>   libdtrace/dt_provider.h                       |  1 -
>   libdtrace/dt_subr.c                           | 80 +++++++++++++++++++
>   runtest.sh                                    |  8 ++
>   test/unittest/funcs/tst.rw_.x                 |  7 +-
>   test/unittest/providers/tst.dtrace_cleanup.sh |  9 ++-
>   test/utils/clean_probes.sh                    | 12 ++-
>   16 files changed, 207 insertions(+), 111 deletions(-)
>   delete mode 100644 include/tracefs.h
>
> diff --git a/include/tracefs.h b/include/tracefs.h
> deleted file mode 100644
> index d671f51adefc..000000000000
> --- a/include/tracefs.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/*
> - * Oracle Linux DTrace; simple uprobe helper functions
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -#ifndef	_TRACEFS_H
> -#define	_TRACEFS_H
> -
> -#define TRACEFS		"/sys/kernel/debug/tracing/"
> -#define EVENTSFS	TRACEFS "events/"
> -
> -#endif /* _TRACEFS_H */
> diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> index 213f0d9e1385..9c4a2b32888e 100644
> --- a/libdtrace/dt_error.c
> +++ b/libdtrace/dt_error.c
> @@ -98,7 +98,8 @@ static const struct {
>   	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
>   	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
>   	{ EDT_PCAP, "Missing or corrupt pcap() record" },
> -	{ EDT_PRINT, "Missing or corrupt print() record" }
> +	{ EDT_PRINT, "Missing or corrupt print() record" },
> +	{ EDT_TRACEFS, "Cannot find tracefs" }
>   };
>   
>   static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 68fb8ec53c06..950cb34819aa 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -354,6 +354,7 @@ struct dtrace_hdl {
>   	char *dt_module_path;	/* pathname of kernel module root */
>   	dt_version_t dt_kernver;/* kernel version, used in the libpath */
>   	char *dt_dofstash_path;	/* Path to the DOF stash.  */
> +	char *dt_tracefs_path;	/* Path to tracefs.  */
>   	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
>   	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
>   	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
> @@ -643,6 +644,7 @@ enum {
>   	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
>   	EDT_PCAP,		/* missing or corrupt pcap() record */
>   	EDT_PRINT,		/* missing or corrupt print() record */
> +	EDT_TRACEFS,		/* cannot find tracefs */
>   };
>   
>   /*
> @@ -713,6 +715,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
>   
>   extern int dt_gmatch(const char *, const char *);
>   extern char *dt_basename(char *);
> +extern int dt_tracefs_open(dtrace_hdl_t *, const char *fn, int flags, ...);
>   
>   extern ulong_t dt_popc(ulong_t);
>   extern ulong_t dt_popcb(const ulong_t *, ulong_t);
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index e1972aa821e7..775830f64492 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1317,6 +1317,7 @@ dtrace_close(dtrace_hdl_t *dtp)
>   	free(dtp->dt_cpp_argv);
>   	free(dtp->dt_cpp_path);
>   	free(dtp->dt_ld_path);
> +	free(dtp->dt_tracefs_path);
>   	free(dtp->dt_sysslice);
>   	free(dtp->dt_dofstash_path);
>   
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 34b5d8e2467f..670954beb4c9 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -23,8 +23,6 @@ static const char		funname[] = "";
>   
>   #define PROBE_FUNC_SUFFIX	"_probe"
>   
> -#define UPROBE_EVENTS		TRACEFS "uprobe_events"
> -
>   static const dtrace_pattr_t	pattr = {
>   { DTRACE_STABILITY_STABLE, DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON },
>   { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -229,11 +227,9 @@ out:
>   static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   {
>   	if (!dt_tp_probe_has_info(prp)) {
> -		char	*spec;
> -		char	*fn;
> -		FILE	*f;
> -		size_t	len;
> -		int	fd, rc = -1;
> +		char		*spec;
> +		FILE		*f;
> +		int		fd = -1, rc = -1;
>   
>   		/* get a uprobe specification for this probe */
>   		spec = uprobe_spec(getpid(), prp->desc->prb);
> @@ -241,7 +237,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   			return -ENOENT;
>   
>   		/* add a uprobe */
> -		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> +
>   		if (fd != -1) {
>   			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
>   				     GROUP_DATA, prp->desc->prb, spec);
> @@ -252,16 +249,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   			return -ENOENT;
>   
>   		/* open format file */
> -		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
> -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
> -		fn = dt_alloc(dtp, len);
> -		if (fn == NULL)
> +		fd = dt_tracefs_open(dtp, "events/" GROUP_FMT "/%s/format",
> +				     O_RDONLY, GROUP_DATA, prp->desc->prb);
> +		if (fd < 0)
>   			return -ENOENT;
>   
> -		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
> -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
> -		f = fopen(fn, "r");
> -		dt_free(dtp, fn);
> +		f = fdopen(fd, "r");
>   		if (f == NULL)
>   			return -ENOENT;
>   
> @@ -296,7 +289,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>   
>   	dt_tp_probe_detach(dtp, prp);
>   
> -	fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
>   	if (fd == -1)
>   		return;
>   
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 21f63ddffc73..e20d0283d956 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -43,8 +43,8 @@
>   static const char		prvname[] = "fbt";
>   static const char		modname[] = "vmlinux";
>   
> -#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> -#define PROBE_LIST		TRACEFS "available_filter_functions"
> +#define KPROBE_EVENTS		"kprobe_events"
> +#define PROBE_LIST		"available_filter_functions"
>   
>   #define FBT_GROUP_FMT		GROUP_FMT "_%s"
>   #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> @@ -65,6 +65,7 @@ static int populate(dtrace_hdl_t *dtp)
>   {
>   	dt_provider_t		*prv;
>   	dt_provimpl_t		*impl;
> +	int			fd;
>   	FILE			*f;
>   	char			*buf = NULL;
>   	char			*p;
> @@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
>   	if (prv == NULL)
>   		return -1;			/* errno already set */
>   
> -	f = fopen(PROBE_LIST, "r");
> +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +        f = fdopen(fd, "r");
>   	if (f == NULL)
>   		return 0;
>   
> @@ -363,16 +368,14 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   {
>   	if (!dt_tp_probe_has_info(prp)) {
> -		char	*fn;
> -		FILE	*f;
> -		size_t	len;
> -		int	fd, rc = -1;
> +		FILE		*f;
> +		int		fd, rc = -1;
>   
>   		/*
>   		 * Register the kprobe with the tracing subsystem.  This will
>   		 * create a tracepoint event.
>   		 */
> -		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
>   		if (fd == -1)
>   			return -ENOENT;
>   
> @@ -383,19 +386,13 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   		if (rc == -1)
>   			return -ENOENT;
>   
> -		/* create format file name */
> -		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> -			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
> -		fn = dt_alloc(dtp, len);
> -		if (fn == NULL)
> +		/* open format file */
> +		fd = dt_tracefs_open(dtp, "events/" FBT_GROUP_FMT "/%s/format",
> +				     O_RDONLY, FBT_GROUP_DATA, prp->desc->fun);
> +		if (fd < 0)
>   			return -ENOENT;
>   
> -		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> -			 FBT_GROUP_DATA, prp->desc->fun);
> -
> -		/* open format file */
> -		f = fopen(fn, "r");
> -		dt_free(dtp, fn);
> +		f = fdopen(fd, "r");
>   		if (f == NULL)
>   			return -ENOENT;
>   
> @@ -431,7 +428,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>   
>   	dt_tp_probe_detach(dtp, prp);
>   
> -	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
>   	if (fd == -1)
>   		return;
>   
> diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> index 778a6f9cde90..c6b3c7947b3c 100644
> --- a/libdtrace/dt_prov_rawtp.c
> +++ b/libdtrace/dt_prov_rawtp.c
> @@ -38,7 +38,7 @@
>   static const char		prvname[] = "rawtp";
>   static const char		modname[] = "vmlinux";
>   
> -#define PROBE_LIST		TRACEFS "available_events"
> +#define PROBE_LIST		"available_events"
>   
>   #define KPROBES			"kprobes"
>   #define SYSCALLS		"syscalls"
> @@ -64,6 +64,7 @@ static const dtrace_pattr_t	pattr = {
>   static int populate(dtrace_hdl_t *dtp)
>   {
>   	dt_provider_t	*prv;
> +	int		fd;
>   	FILE		*f;
>   	char		*buf = NULL;
>   	char		*p;
> @@ -73,7 +74,11 @@ static int populate(dtrace_hdl_t *dtp)
>   	if (prv == NULL)
>   		return -1;			/* errno already set */
>   
> -	f = fopen(PROBE_LIST, "r");
> +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +        f = fdopen(fd, "r");
>   	if (f == NULL)
>   		return 0;
>   
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index 675e0458ca4c..2c07707e04b4 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -36,7 +36,7 @@
>   static const char		prvname[] = "sdt";
>   static const char		modname[] = "vmlinux";
>   
> -#define PROBE_LIST		TRACEFS "available_events"
> +#define PROBE_LIST		"available_events"
>   
>   #define KPROBES			"kprobes"
>   #define SYSCALLS		"syscalls"
> @@ -62,7 +62,8 @@ static const dtrace_pattr_t	pattr = {
>   static int populate(dtrace_hdl_t *dtp)
>   {
>   	dt_provider_t	*prv;
> -	FILE		*f;
> +	int		fd;
> +        FILE		*f;
>   	char		*buf = NULL;
>   	char		*p;
>   	size_t		n;
> @@ -71,7 +72,11 @@ static int populate(dtrace_hdl_t *dtp)
>   	if (prv == NULL)
>   		return -1;			/* errno already set */
>   
> -	f = fopen(PROBE_LIST, "r");
> +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	f = fdopen(fd, "r");
>   	if (f == NULL)
>   		return 0;
>   
> @@ -192,16 +197,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   			      int *argcp, dt_argdesc_t **argvp)
>   {
> +	int				fd;
>   	FILE				*f;
> -	char				*fn;
>   	int				rc;
>   	const dtrace_probedesc_t	*pdp = prp->desc;
>   
> -	if (asprintf(&fn, EVENTSFS "%s/%s/format", pdp->mod, pdp->prb) == -1)
> -		return dt_set_errno(dtp, EDT_NOMEM);
> +	fd = dt_tracefs_open(dtp, "events/%s/%s/format", O_RDONLY, pdp->mod, pdp->prb);
> +	if (fd < 0)
> +		return -ENOENT;
>   
> -	f = fopen(fn, "r");
> -	free(fn);
> +	f = fdopen(fd, "r");
>   	if (!f)
>   		return -ENOENT;
>   
> @@ -223,15 +228,18 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	int			argc = 0;
>   	dt_argdesc_t		*argv = NULL;
>   	dtrace_typeinfo_t	sym;
> -	FILE			*f;
> +	int			fd;
> +        FILE			*f;
>   	uint32_t		id;
>   
>   	/* Retrieve the event id. */
> -	if (asprintf(&str, EVENTSFS "%s/%s/id", prp->desc->mod, prp->desc->prb) == -1)
> -		return dt_set_errno(dtp, EDT_NOMEM);
>   
> -	f = fopen(str, "r");
> -	free(str);
> +	fd = dt_tracefs_open(dtp, "events/%s/%s/id", O_RDONLY,
> +			     prp->desc->mod, prp->desc->prb);
> +	if (fd < 0)
> +		return dt_set_errno(dtp, EDT_ENABLING_ERR);
> +
> +	f = fdopen(fd, "r");
>   	if (!f)
>   		return dt_set_errno(dtp, EDT_ENABLING_ERR);
>   
> diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> index 20843c6f538e..3f816a0d6ba1 100644
> --- a/libdtrace/dt_prov_syscall.c
> +++ b/libdtrace/dt_prov_syscall.c
> @@ -38,7 +38,7 @@
>   static const char		prvname[] = "syscall";
>   static const char		modname[] = "vmlinux";
>   
> -#define SYSCALLSFS		EVENTSFS "syscalls/"
> +#define SYSCALLSFS		"events/syscalls/"
>   
>   /*
>    * We need to skip over an extra field: __syscall_nr.
> @@ -61,7 +61,7 @@ struct syscall_data {
>   
>   #define SCD_ARG(n)	offsetof(struct syscall_data, arg[n])
>   
> -#define PROBE_LIST	TRACEFS "available_events"
> +#define PROBE_LIST	"available_events"
>   
>   #define PROV_PREFIX	"syscalls:"
>   #define ENTRY_PREFIX	"sys_enter_"
> @@ -71,7 +71,8 @@ struct syscall_data {
>   static int populate(dtrace_hdl_t *dtp)
>   {
>   	dt_provider_t	*prv;
> -	FILE		*f;
> +	int		fd;
> +        FILE		*f;
>   	char		*buf = NULL;
>   	size_t		n;
>   
> @@ -79,8 +80,12 @@ static int populate(dtrace_hdl_t *dtp)
>   	if (prv == NULL)
>   		return -1;			/* errno already set */
>   
> -	f = fopen(PROBE_LIST, "r");
> -	if (f == NULL)
> +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	f = fdopen(fd, "r");
> +        if (f == NULL)
>   		return 0;
>   
>   	while (getline(&buf, &n, f) >= 0) {
> @@ -195,23 +200,21 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   		      int *argcp, dt_argdesc_t **argvp)
>   {
> +	int		fd;
>   	FILE		*f;
> -	char		fn[256];
>   	int		rc;
>   
>   	/*
>   	 * We know that the probe name is either "entry" or "return", so we can
>   	 * just check the first character.
>   	 */
> -	strcpy(fn, SYSCALLSFS);
> -	if (prp->desc->prb[0] == 'e')
> -		strcat(fn, "sys_enter_");
> -	else
> -		strcat(fn, "sys_exit_");
> -	strcat(fn, prp->desc->fun);
> -	strcat(fn, "/format");
> +	fd = dt_tracefs_open(dtp, SYSCALLSFS "/sys_%s_%s/format", O_RDONLY,
> +			     (prp->desc->prb[0] == 'e') ? "enter" : "exit",
> +			     prp->desc->fun);
> +	if (fd < 0)
> +		return -ENOENT;
>   
> -	f = fopen(fn, "r");
> +        f = fdopen(fd, "r");
>   	if (!f)
>   		return -ENOENT;
>   
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 205014617586..4bd834276912 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1116,13 +1116,13 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
>    * uprobe may be a uretprobe.  Return the probe's name as
>    * a new dynamically-allocated string, or NULL on error.
>    */
> -static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> -			   uint64_t addr, int flags)
> +static char *uprobe_create(dtrace_hdl_t *dtp, dev_t dev, ino_t ino,
> +			   const char *mapping_fn, uint64_t addr, int flags)
>   {
> -	int	fd = -1;
> -	int	rc = -1;
> -	char	*name;
> -	char	*spec;
> +	int		fd = -1;
> +	int		rc = -1;
> +	char		*name;
> +	char		*spec;
>   
>   	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
>   		return NULL;
> @@ -1132,8 +1132,8 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
>   		goto out;
>   
>   	/* Add the uprobe. */
> -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> -	if (fd == -1)
> +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> +	if (fd < 0)
>   		goto out;
>   
>   	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
> @@ -1153,8 +1153,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>   {
>   	dt_uprobe_t	*upp = uprp->prv_data;
>   	tp_probe_t	*tpp = upp->tp;
> +	int		fd;
>   	FILE		*f;
> -	char		*fn;
>   	char		*prb = NULL;
>   	int		rc = -1;
>   
> @@ -1163,7 +1163,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>   
>   	assert(upp->fn != NULL);
>   
> -	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
> +	prb = uprobe_create(dtp, upp->dev, upp->inum, upp->fn, upp->off,
>   			    upp->flags);
>   
>   	/*
> @@ -1177,12 +1177,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>   				  upp->flags);
>   
>   	/* open format file */
> -	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
> -	free(prb);
> -	if (rc < 0)
> +	fd = dt_tracefs_open(dtp, "events/%s/format", O_RDONLY, prb);
> +	if (fd < 0)
>   		return -ENOENT;
> -	f = fopen(fn, "r");
> -	free(fn);
> +
> +	f = fdopen(fd, "r");
>   	if (f == NULL)
>   		return -ENOENT;
>   
> @@ -1251,21 +1250,20 @@ done:
>    * Destroy a uprobe for a given device and address.
>    */
>   static int
> -uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
> +uprobe_delete(dtrace_hdl_t *dtp, dev_t dev, ino_t ino, uint64_t addr, int flags)
>   {
> -	int	fd = -1;
> -	int	rc = -1;
> -	char	*name;
> +	int		fd = -1;
> +	int		rc = -1;
> +	char		*name;
>   
>   	name = uprobe_name(dev, ino, addr, flags);
>   	if (!name)
>   		goto out;
>   
> -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
>   	if (fd == -1)
>   		goto out;
>   
> -
>   	rc = dprintf(fd, "-:%s\n", name);
>   
>   out:
> @@ -1297,7 +1295,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
>   
>   	dt_tp_detach(dtp, tpp);
>   
> -	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
> +	uprobe_delete(dtp, upp->dev, upp->inum, upp->off, upp->flags);
>   }
>   
>   /*
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 8f143dceaed7..4598a380b950 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -12,7 +12,6 @@
>   #include <dt_impl.h>
>   #include <dt_ident.h>
>   #include <dt_list.h>
> -#include <tracefs.h>
>   
>   #ifdef	__cplusplus
>   extern "C" {
> diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
> index d5dca164861e..9887c4fc5ffa 100644
> --- a/libdtrace/dt_subr.c
> +++ b/libdtrace/dt_subr.c
> @@ -20,6 +20,7 @@
>   #include <assert.h>
>   #include <limits.h>
>   #include <sys/ioctl.h>
> +#include <mntent.h>
>   #include <port.h>
>   
>   #include <dt_impl.h>
> @@ -998,3 +999,82 @@ uint32_t dt_gen_hval(const char *p, uint32_t hval, size_t len)
>   
>   	return hval;
>   }
> +
> +/*
> + * Find the tracefs and store it away in dtp.
> + */
> +static int
> +find_tracefs_path(dtrace_hdl_t *dtp)
> +{
> +	FILE *mounts;
> +	struct mntent *mnt;
> +
> +	if ((mounts = setmntent("/proc/mounts", "r")) == NULL) {
> +		dt_dprintf("Cannot open /proc/mounts: %s\n", strerror(errno));
> +		return dt_set_errno(dtp, EDT_TRACEFS);
> +	}
> +
> +	while ((mnt = getmntent(mounts)) != NULL) {
> +		/*
> +		 * Only accept tracefs paths that do not contain percent
> +		 * characters in their mounted paths, since we use this
> +		 * to augment a format string in dt_tracefs_vfn().
> +		 */
> +		if ((strcmp(mnt->mnt_type, "tracefs") == 0) &&
> +		    (strchr(mnt->mnt_dir, '%') == NULL)) {
> +			dtp->dt_tracefs_path = strdup(mnt->mnt_dir);
> +			break;
> +		}
> +	}
> +	endmntent(mounts);
> +
> +	if (!dtp->dt_tracefs_path) {
> +		dt_dprintf("Cannot find a suitable tracefs path.\n");
> +		return dt_set_errno(dtp, EDT_TRACEFS);
> +	}
> +
> +	dt_dprintf("Found tracefs at %s\n", dtp->dt_tracefs_path);
> +
> +	return 0;
> +}
> +
> +static char *
> +dt_tracefs_vfn(dtrace_hdl_t *dtp, const char *fn, va_list ap)
> +{
> +	char *full_fn;
> +	char *str;
> +
> +        if (!dtp->dt_tracefs_path)
> +		if (find_tracefs_path(dtp) < 0)
> +			return NULL;		/* errno is set for us. */
> +
> +	if (asprintf(&full_fn, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
> +		dt_set_errno(dtp, EDT_NOMEM);
> +		return NULL;
> +	}
> +
> +        if (vasprintf(&str, full_fn, ap) < 0) {
> +		str = NULL;
> +		dt_set_errno(dtp, EDT_NOMEM);
> +	}
> +	free(full_fn);
> +	return str;
> +}
> +
> +int
> +dt_tracefs_open(dtrace_hdl_t *dtp, const char *fn, int flags, ...)
> +{
> +	va_list ap;
> +	char *str;
> +	int fd;
> +
> +	va_start(ap, flags);
> +	if ((str = dt_tracefs_vfn(dtp, fn, ap)) == NULL) {
> +		va_end(ap);
> +		return -1; 			/* errno is set for us. */
> +	}
> +
> +	fd = open(str, flags, 0666);
> +	free(str);
> +	return fd;				/* errno is set for us. */
> +}
> diff --git a/runtest.sh b/runtest.sh
> index 46b532d7e161..fbf4e60c82a9 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -607,6 +607,14 @@ elif ! /usr/bin/cpp -x c -fno-show-column - /dev/null < /dev/null 2>&1 | \
>       export DTRACE_OPT_CPPARGS="-fno-show-column"
>   fi
>   
> +# Find the tracefs.
> +tracefs="$(awk '$3 == "tracefs" { print $2; exit; }' /proc/mounts)"
> +if [[ -z $tracefs ]]; then
> +    echo "Cannot find any tracefs mounts in /proc/mounts.  Some tests will fail." >&2
> +fi
> +
> +export tracefs
> +
>   # More than one dtrace tree -> run tests for all dtraces, and verify identical
>   # intermediate code is produced by each dtrace.
>   
> diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
> index 29c581116154..06e1f0b3c3eb 100755
> --- a/test/unittest/funcs/tst.rw_.x
> +++ b/test/unittest/funcs/tst.rw_.x
> @@ -1,6 +1,11 @@
>   #!/bin/sh
>   
> -FUNCS=/sys/kernel/debug/tracing/available_filter_functions
> +if [[ ! -e $tracefs/available_filter_functions ]]; then
> +	echo no tracefs found
> +	exit 1
> +fi
> +
> +FUNCS=${tracefs}/available_filter_functions
>   
>   if ! grep -qw  _raw_read_lock $FUNCS; then
>           echo no _raw_read_lock FBT probe due to kernel config
> diff --git a/test/unittest/providers/tst.dtrace_cleanup.sh b/test/unittest/providers/tst.dtrace_cleanup.sh
> index 4ac59ccb4315..69e3ab369caf 100755
> --- a/test/unittest/providers/tst.dtrace_cleanup.sh
> +++ b/test/unittest/providers/tst.dtrace_cleanup.sh
> @@ -1,7 +1,7 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2020, 2022, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   
> @@ -14,7 +14,12 @@
>   ##
>   
>   dtrace=$1
> -UPROBE_EVENTS=/sys/kernel/debug/tracing/uprobe_events
> +if [[ ! -e $tracefs/uprobe_events ]]; then
> +	echo "no tracefs/uprobe_events" >&2
> +	exit 67
> +fi
> +
> +UPROBE_EVENTS=${tracefs}/uprobe_events
>   
>   out=/tmp/output.$$
>   $dtrace $dt_flags -n BEGIN,END &>> $out &
> diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> index 8292b3096424..8372e8a26da7 100755
> --- a/test/utils/clean_probes.sh
> +++ b/test/utils/clean_probes.sh
> @@ -1,9 +1,13 @@
>   #!/usr/bin/bash
>   
> -TRACEFS=/sys/kernel/debug/tracing
> -EVENTS=${TRACEFS}/available_events
> -KPROBES=${TRACEFS}/kprobe_events
> -UPROBES=${TRACEFS}/uprobe_events
> +# We can't work without the tracefs: just give up quietly.
> +if [[ ! -e $tracefs/available_events ]]; then
> +    exit 0
> +fi
> +
> +EVENTS=${tracefs}/available_events
> +KPROBES=${tracefs}/kprobe_events
> +UPROBES=${tracefs}/uprobe_events
>   
>   # Check permissions
>   if [[ ! -r ${EVENTS} ]]; then
