Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB8C18FC8F
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730213531; cv=fail; b=t7AO6OVolDP0qrit5HBM0yQ9YaDYW+Zixgd3WixJh+6VOQNWJd4lVMk/AzU+LsaqG1wz1MW8CP40nj4Q2DTlhwp4h6tdjHt6IR2P1DtkelAXNcquGA1nO3rFcQ6Tr+LhSfB+Cbivy/ifff2SlpHG89Ae/ziOcrj6C9/F4dAOK8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730213531; c=relaxed/simple;
	bh=uyWnfpuxh283jswxPdD0iFT80JFPHZYhK/bY4xApv8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N8KP9CJesJFYby4KGvUB1SrsymnJeDzgzq2jlT7BomRHmY6GG0n/UsTeRttE+UBTF4ArSkO6dAry7sU+IK7vvwRJjyJJRzvyRohrwzpaylljQM+llLGg7ZxQgko6DvfKwYoltUPKMmMDA7JqTxQWf5I8sbzCst0ekdlxXgAHbyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DXnnPVQ0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z2gUjN+y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DXnnPVQ0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z2gUjN+y"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCbll4020941
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=EWmvrfVFIakynWrB+S
	JuyM1WhaONbcQwH4tEWD/yGCI=; b=DXnnPVQ0Cnuaj+W5CtoMj6JBtpb7ioGA+P
	K6cJBld+56wG/Dypt/ZWz/1Mg+UisbOxCoTkmCUU3odWOxJGiCQUnNhT5IPPdMzL
	83O5aVbgeAyW+ON/Cj8TglC6zcwyWNf10jhtmdO2hCPp7VDDN4eUbNx2iQNsWV6p
	KMjzkeinc4TUxdHFcVOM4Ps3Xp+gOqCJ+4wA0yyz/6I+fwDRkY62FByA9xUhcvNR
	6+oYTpR2dOCVEIWwW6afkXJf2pA7pDKpK88LcFXpWMVKE1cKJhxDSSundMVCM9NU
	9UKeo61O0Bu7ksgISCEllREo/psdnPdQ0HHdtGUO2zfKThYwjaew==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmdr50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 14:52:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEYuna034776
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 14:52:06 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd7rshr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 14:52:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGhgJ5LRPp2QIZX/r2ydDpmIGFUNt5qhxiAtr3+olr+PzZSJilFq++x+iMcwqHvYSefnfskTrinxlcH1YHLqwpRK/j2v3pyJ2NDxnYbdQcDdywzZUpBWklXBp+nCuz+b/zKjOtDLVPbEWSCQ0Q/hrfGyZO2/dYXXRPIfhCT31l8JFk5UMQX9xjgCu9gIVvkkk12txCQFBniF/BkySaoshcej2q2E0/clt9ipgjwrxpP8pBgSNQSpzQc5GXxhp2Vf71U17jwp1PSuCsgQooi9D4payRPQBQUtXl39sK+XqWa6PRqf8efcUmnG9bIB4gTkrFwxDfkf8hN5iEW02XL4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWmvrfVFIakynWrB+SJuyM1WhaONbcQwH4tEWD/yGCI=;
 b=G1GzDuAj0f9F2JCiXnV4aFVbo0UOnjNXgfVde1aHvPRdptqKUD1si3hXoYAiGOf830YUt2ouc67N6y5hRvBfQXp6uW+sj0f3wy//aS0cxLnO2Ztb3fBaFox9U6H7lInvAjS/ukX50X3WGFm5V6mjQgQoQiU28koDPO3u75dCk5ddE0L+/rI0m6pzQPlVf23Zm2b4wI/UdRAOfQXK2NWnWVHP6IqFfhnEZq0xuyqUlZOHgvieQiWQM2MB2sZ0yNHFSI9OJ9yN96lSOjUBpDY47hzEPIqwzFP2ht0VcF6nEdai9hWzi8d/TAIJaHRo7mwyqMGJwWb055Ue5XaqkNs+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWmvrfVFIakynWrB+SJuyM1WhaONbcQwH4tEWD/yGCI=;
 b=z2gUjN+yEwjE8RHT3fUSCCQvi0s5TbHMS+PQMpl34c7z2woNfU5y+t3sD2n3VMz/nIClsagXuN2Bs+XZGQ4soethyejUt6BmLSwMUg604HTpU4fUfUhUHiKUChjoqb6JUDpC8ehn1YqOMowW4UTtILbwSJJS5LpRQ+m+S3VnUyE=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BLAPR10MB5140.namprd10.prod.outlook.com (2603:10b6:208:320::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 14:52:02 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 14:52:02 +0000
Date: Tue, 29 Oct 2024 10:51:59 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] cg: add argument remapping in the trampoline
Message-ID: <ZyD2j89dTLpSNhT3@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-5-nick.alcock@oracle.com>
 <ZxfkWjbS1c0vXLvn@oracle.com>
 <87plnorxat.fsf@esperi.org.uk>
 <ZxvuWjuWbfweZmgj@oracle.com>
 <87msinoy2z.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msinoy2z.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:208:32a::34) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BLAPR10MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f57b9b-ebf3-43a8-0647-08dcf8293f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8fBWim5xJXvv1MfHbJQG4kiQdwZJcj6byHTaPM02ZIdvXZiAfIviOo4vMbyA?=
 =?us-ascii?Q?1qa873eH5GT/2P2gTh7OVnroFvtaYB2e4vvqjhNNqyzI2f1l91uNWlOrfHlS?=
 =?us-ascii?Q?7GBQFY3gxXgStthBm9t2KSEWiU0pFZcPvWEM7yhyCUX192acuN5V+9CALxy0?=
 =?us-ascii?Q?z/h5sGL6ITLWqeCkgUtl1S+gVw+8wbQBFUaWgUevst0I+2F6+rXf+L9eplrH?=
 =?us-ascii?Q?h6tWxWgkwJgbpSvHBP9ePWWXfZ7llqHli1jRZyhxoRt0PB34AbVipNP+M5/E?=
 =?us-ascii?Q?Wepkc3XjUYOuHODRm4WswpTuXuykSTcKg161EjBItlUkrhF1LMML9KRo3NQd?=
 =?us-ascii?Q?ubFB/hfRjz3HFMyAdRFVW2Pdf/0/qLqylFD4A37ivjHYNcqzc8elRWFffxP8?=
 =?us-ascii?Q?EgU45C5mPwNl+drxu1H1ung6Tg3CU5vpne7Hy7SM3qehL2WerBnOE0hCDwfv?=
 =?us-ascii?Q?jUCo1K9srGh1hhGwP6lMio/DrYDz6UoMPSQ0LFxDxQ48X5JRH7ojxj7kR6YO?=
 =?us-ascii?Q?6AeSiaMLHzlBfaZFyCIFeQPwpX5ugJRX8w55Qgi+g4ymmIAlRIPAWaK+2dZQ?=
 =?us-ascii?Q?YkGcmabLT5T2bO2gD4I64OFqfZEToF2Eei/n6KglUz2Sjl43NgrraKhdpXCE?=
 =?us-ascii?Q?Jnr7Lbh7N1fYfDC1+0UfONCAwwTZ3JItkPipyrL8hzihWfHjm06oG0+j/HdA?=
 =?us-ascii?Q?OHqU7mOWJM8nLiK27GOlY8jZINkvwe/PkfpLVXWEg9Eo0saTWM90kE0jyOnd?=
 =?us-ascii?Q?HKibnE17iK+6Z5dMavUoYRbQRT4w/T26gZYk9HiXIgGhO1tt8OLyXdZV0G87?=
 =?us-ascii?Q?miRj/kP+NbReHe1CqA07RIt42eAvQE1+IzoblCAwYIG4uUye7PjX5TfVm/yO?=
 =?us-ascii?Q?g3k0aeFfxcldPe9y/Go1NHU4eA3Jb5lB6dWrY0wjbXIleCAahTqoUMX4hueJ?=
 =?us-ascii?Q?vJ9y61ubVkxsfoPwObE/fIlJ+ugBQsI1t2mLBh3lA+EszZLJcLC6aZZ+EDzF?=
 =?us-ascii?Q?WFV1oWGlgmtFlSUvaddpWENr7kjzfjYYors2I07IVef8nxZg3/kiHV+Pk5F3?=
 =?us-ascii?Q?qTd+L9aK4N5kGZ78gxUV90FMAFHq2GE+L2Nzf/eUryP8bh4PLniSjOo/jCMG?=
 =?us-ascii?Q?aEG2P1MOb0jqJmHAZ9IyOo5kNuITDR/aUhbVGQW/cN3ChpNA7NlJh8PonLmB?=
 =?us-ascii?Q?mc9zVoHNNkuw0243BbT1wgTHlXl0A8D8Rw7i0ZoZAwXD4WZo0LNCXa3BkAnu?=
 =?us-ascii?Q?7jTt5iC86WObEd14ZBCdxHFBSqcHp/wTJvDMBZoDtunijxdFxjZ22xSgajJL?=
 =?us-ascii?Q?BA8Rf3RKC1SZT5jxQC16OJl5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MGbM8+aWOiiS3uJDTDD3kHkhp7q72Cz/uXPoD8HujeUXmtVfX7HoXIz7wmaP?=
 =?us-ascii?Q?uokSvZ0vcrQe/JtaX5XIy5jqnIJKMLNdJcqmKB5nX2eDl6MVjlTfM8gtusdz?=
 =?us-ascii?Q?iYuxDSXiDdu3m77sgSs+/nBEjLSxrPGxWOF7uWs/qyfgk07B0MfuVBbYPEsS?=
 =?us-ascii?Q?vEHftgChVqpB56kvQBv4eU2slO512vv74YhHJ0Yd5d949w79hMiE9NEizaLk?=
 =?us-ascii?Q?wwvvV9hhkUdX9/PrZSGzJQsio43JdxobEfokFRxjONKfzCW+kE1xiGoFyULG?=
 =?us-ascii?Q?30Ss3afOx3em/mz+9He8b3NBZEkmZGryWy+Bokm6DkUKzuB7ymJoDgPW6Tit?=
 =?us-ascii?Q?HlAW2Q6SrHqsHeHivP/6RTCDFsRU8aboaBtQVGX2jOprxDaS+AVAU4gQ3NTv?=
 =?us-ascii?Q?gvjEbrtwrFO3RqchxEtn3GmVGJYczoNd0YME2omQsqBqHghWD2CgeVaWW888?=
 =?us-ascii?Q?1kuEaPm7tVR1pk3WpwYEy2BscNzUzIzCu/MIVLW/a8Dz0UR0ByHjMUI3OpMZ?=
 =?us-ascii?Q?Bwo48UJ6ssiCFUYsFSAnDI/eafP0LhER2zpF91aCPZim7zZxrzs2Da6RCCDe?=
 =?us-ascii?Q?s6XW52SHC3dReQ8WzEUKyvaSQccrUJIavh+8lSx/Qqho7CMenE9bVvtxnP37?=
 =?us-ascii?Q?FAdN9Eh0s5PA1cPtchtkdDSD7HPjukvxmcYppGQ6QFAhp3Xc5Ygh/9YB8ul0?=
 =?us-ascii?Q?WWHoXgZP6rVi1u4vnZahpqZvEM0eZIZeKKLLHWXGpJSCYcVmvZu50AAcTICg?=
 =?us-ascii?Q?yTs0OcCOs45VDr7rNbeyW/G+DATrhAFAn3ZW07I+lbHV6PyexPpQLV1/47YN?=
 =?us-ascii?Q?BJz3XDFtoqMPN2M+mGKJfzPEVkdHw+WO7ZXcdzyb5tIBQfWwWSXjXGGqjRuq?=
 =?us-ascii?Q?CFyowXedS1vRViBJ19i1oo2wbBgvStc6CTc2wzs+veRUmr5m4IWL+cpw0sY4?=
 =?us-ascii?Q?oko2YEh3b2WCA0uDG1iJm0j4lNNnpO5Sq12I2vb4PmtAGHypILaEcvm7Yu+D?=
 =?us-ascii?Q?QmHNnm7P6WYpkhUPU/J9uJBnQQoVqMGA4AgEK4LPJvwZoZxJV6ee/2VVbLSz?=
 =?us-ascii?Q?nYC478M10Vjrl6bs/RgzDwjzlh7kOL7yyiVhQDs7VpFG4/1XKmd/rDIJPASD?=
 =?us-ascii?Q?7iVkU7wGaBcJ7ROqSGPUXHKsbLz1en83uB5pP3BzJTHtSKHPTwau+iX4/lLB?=
 =?us-ascii?Q?Y74Q3wfEK9ZeEN8b4Jx9ew8XowIvseCxK8CFx0jMVQYaj0uSSsQ/3jYDDa4l?=
 =?us-ascii?Q?HCWWZeAm7ebtlm7qc847zm4MZUYfFLuZ8Jo7rxZv1zrQHpUWX+8s7Mwu1PMQ?=
 =?us-ascii?Q?jMc66xePo962QVwtgGpMVXqwd6vwBiulYRYZ80msctSExPiGRqxd6tl3DB4Q?=
 =?us-ascii?Q?jJLIIGcTPKtaTu08Si1Q+cBht3u8lYSgeAEaGifFTSYhl8qr8qeBZU6mbSjJ?=
 =?us-ascii?Q?3oEQ1ajpuuC4aqDXT+r4swIbJsyPC+LAxdHVCJExteKPkuH0uMhP2P1XOYIR?=
 =?us-ascii?Q?zoBIeT2EqKrG7cLh3AZq1Cr8li39PGwS9APTSWF8gO4Qa93xbVqoQYOpn1xn?=
 =?us-ascii?Q?qzNXwJzBVoPP2JYNHj0znI/2NjeSRyFZs57Gfl8fvOr5QrBle6IH5SyHPTxF?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	79fKgcy3k0yyUULNGyao+aCfABYJCuOmLDmYK5qCdEA1lkQ9PY5anftFAhhZL/6WvO8uxIZ57hf+ZTMIXntQqARRf27mrxU2flOMIHkN+KZFGCCiV/8AIs4jgLWNvSZH+PlcaXuR5X1LLVSPLFq+rj1LTrB2Vbutlk/9jwTFa6zOG8uMSQ5z/kwlS5dTYEgZxebR9tuL3cOdiOaFvJJf+9UVb4y8rMPHdaPwJe6Bsspyes1xcWlgwiPoscT7NY95VJ+LgDpHRkxlJ74MykmpoKsI8Plg7Dndo3wjrk8RzC6hehDv3EIJddOBsN9XRaqCnb7wwbq3fSqNVQlayz3dqCTzQ3pwgpDtrLOr2ogw72hONrZf4vZurZbU3XsppjmxcScajopw1Q9b+f/36JOMp022YoeS1UseFPdd7/89T8NXp1g8Ekom3D+JieB0c7HtmvczyLbmllANIrq7kTt71GeiKz7EL3Tb5M5KdQQlzjMaIq5E67hhvTN2HBmsVPlj2ylITiAjj2ZMEgLmaZaWfOOz6LRyXP5qpvQNvdOT0o83yRzU6GOrhDWFfxLT1DLXBUiOwO9o+H/q6cvqKVDBnSVyxG7ycXQ1EkNmRCDUbcI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f57b9b-ebf3-43a8-0647-08dcf8293f6b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:52:02.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZinValjS4xaN0ZMy8DTPb6fhM1lsuCDmzE0baLeiGBnXEF+ZstwjsUaZWTRDJiYzKyMYsYwVJ3XTJ2Io/0UCPQGY6pApN5oPbqKMTTZpFZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5140
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_10,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290112
X-Proofpoint-GUID: 3jAcuLFKti7KiKn92KFob2w2-37wyX-c
X-Proofpoint-ORIG-GUID: 3jAcuLFKti7KiKn92KFob2w2-37wyX-c

On Tue, Oct 29, 2024 at 01:09:08PM +0000, Nick Alcock wrote:
> On 25 Oct 2024, Kris Van Hees said:
> 
> > On Fri, Oct 25, 2024 at 04:56:26PM +0100, Nick Alcock wrote:
> >> > However, I think it might be a good idea to have this function actually rewrite
> >> > the mapping data to become a pure i -> i mapping.
> >> 
> >> Can we guarantee that trampoline() is only ever invoked once, and that
> >> it's invoked after probe_info is called? If it changes the remapping
> >> array, any subsequent invocation will do the wrong thing. If it's
> >> invoked before probe_info, it becomes impossible for probe_info to
> >> adjust the xlated types appropriately.
> >> 
> >> This all seems like way too much coupling to me. At least done
> >> this way trampoline() is idempotent and doesn't depend on being called
> >> in the right (undocumented) order wrt probe_info.
> >
> > If the actual probe arguments (argN) are being reshuffled (which is what you
> > are doing by shuffling the arguments in the trampoline), then the mapping
> > needs to be updated to become an identity mapping i -> i).  Otherwise there
> > could be other code at some point that tries to apply the argument mapping
> > and that would be really bad.
> 
> OK so I tried to implement this and it all fell over as soon as I
> thought about it in depth. The problem is -- and you might not have
> realised this because it was different when I started and I had to move
> things around before anything would work -- trampoline() and
> probe_info() are functions defined on *different probes*. trampoline()
> is called on the underlying probes, and emits code for them that
> reshuffles the args according to the mapping info (while ignoring the
> types entirely); but probe_info() is called on the *overlying* probes.
> It digs down to *one* underlying probe to get the dt_uprobe_t, but it
> has no idea which one (if there is more than one): it's basically
> arbitrary.

Yes, that is correct.  It is also not really important in the sense that by
their very nature the underlying probes *must* be identical in terms of the
argument data.  After all, the argument data is defined at the level of the
meta-probe (the probe as defined in the provider declaration that gets
processed with dtrace -G at build tie to generate the DOF).  So it is always
associated with all the tracepoints for that probe (and each tracepoint has
its own uprobe and thus also its own underlying probe).

None of this matters though in terms of how the argument data is stored.  If
you can store it in raw format, you can also store it in dt_argdesc_t format.

> So we cannot possibly have the trampoline() for the underlying probe go
> changing the dt_uprobe_t's mapping unless we can be absolutely sure that
> the trampoline() for all the underlying probes is called before the
> probe_info() for *any* of the overlying probes. Are we really sorting
> things like that? I thought this was a TODO, if that...

Changing how you store the data does not change the logic you already have in
place to handling the mapping of arguments, etc.  It is just a change in
how things are stored - not a change in behaviour.

> I tried storing the arg info in dt_argdesc_t structures in the
> dt_uprobe_t too and it rapidly turned into *another* nightmare, because
> now instead of one allocation for all the args at once we have one
> allocation per arg, plus up to two more for its arg type strings -- but
> we can't just hand the argdesc back to probe_info()s caller wholesale
> because it frees it after it's done with it! So we'd actually have to
> loop through them and copy the whole thing (including all the arg
> strings) and then do the *same thing* in the underlying probe freeing
> function, and all this complexity buys us what? The ability to save four
> lines in probe_info() going through the nargv so we can index it like an
> array (which we'd have to do the nargc *and* xargc in your scheme).

Really?  Your current patch stores the argument data in dt_uprobe_t in
create_underlying() using 3 allocations each with a memcpy.  The alternative
could use a single dt_calloc(dtp, psp->pps_xargc, sizeof(dt_argdesc_t)) and
a loop to populate the elements.  It would have to do 2 strdups per argument
or you could be fancy and copy all type strings as a single memcpy() into the
first argument and store pointers into that for the rest for the other args.
As long as we have our own code to free all that, such an opitmization can
certainly be used.

The loop to find the strings in the combined memory blobs therefore gets done
here (once) instead of in probe_info (every time that gets called).

You already need to allocate an dt_argdesc_t array and populate it within
probe_info because that is what the caller expects, so the work to do that
does not change, other than that you are making a deep copy of the dt_argdesc_t
array already available from the underlying probe rather than needing to
construct one from raw data for every call to probe_info.

> Sorry, this seems again to have zero benefits and a great deal of extra
> complexity.

Pretty much the same complexity, and you gain the benefit of actually storing
the argument data in the structure format that exists for that very reason.
