Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80056127E34
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595054; cv=fail; b=ERXQ3YHyNT19i4nmxx2ZKPCFW0ZnIDH1A6CdrdvMVQJPvqL6uhI03ylWz5ckigT3+OV1bEmIwtJx8+KJitt+jbmqdEmymaHx/wiiE6ok+cNnHY7yc9IQHi9Hk6ioUTGVS8BMYwlE61QWIiqp+eD+InpdQq7aosHarN3piBdslbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595054; c=relaxed/simple;
	bh=o9szy/wplI9FuVFljjHV3f39C54Cjk0BxSskigTP+vI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=kj598xy7JOf5sgF6FS0scTzlrH5irOMpG2gLr1OwS3NEpCyEhsdsfyy8Qxpr+e2lL2HgvKjjQ1cr7KkxmWDUKpu7Em36bGd50az4t/7Ou/jOWVDto7EkdzyX2FsJe3IeJ/zOhSv62GjRaOO5zU21a1yJa48z30T70neMRgf4p7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=boWDh4as; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f0v+SKvF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="boWDh4as";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f0v+SKvF"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44OMDmrX028965
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=N7SgTTggJKi0J9SqRZwIE5dnktBmVTpsWL1Hh8S3IqU=;
 b=boWDh4astDBSgPioOboQ0hiX/IeBq53PQGtV8Z2bErULbVOyuLLwfC7R8web4W63hSY+
 q2jn+Mh33saF4nffcW7jrZZ6JqjrSRNyhv8Lw9JFpeHVwgxEsIHA7rLJDLKf/wc8mOxi
 i/NXwqOY3Q60PSId6r8TMhRGHd8T+qbKPapcLe+d9w4wZUXH+VEI0lXR6we2vyt5A5aL
 QXnGTOraEz4yf4oQ1uZEyX155Qvz98SBdRKii2LlpIsjoWd2ULzojIP5PnYFfvaHCu84
 aPLx9pjEo3uAOsQ+sTPpnJrRa8tF7t6ma9fsJ1L8ukxiDNnLnLD7HP9YeBTEWC4olEpe gA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6k8ddh4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:31 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44OKxow7037886
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsjg3rg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE132xesCvftCTn2/NcT7Rkkv1lLuQrkKQkaeJrJ/F8FK+eeU/lFzGiTtgWXh+RXj9clQSFQjcEqX3b/3zOjmRCUvlB12hzrRWTZonOucBZNEeOcFlfqP7U2VTZXKCrcthtI9qMoI+OzV6BAtgtNNEbZi4S1wsuJwtPPCGpEvtgwCvpTSlZTk0mN0Rk7L8wVadsB0Xxv5v0jOhyMnbskvG2LWVTr2oquUkYQlcsvAtDzlKDJ7IOP6sUhBz5CcBZNfQm+t2ar+X9MWlde0IKTe9DXJucF5iKGbM+sqcOErBi5vdf177bav3hPdvq5G9dKpnO8hzM3gut2OTZos8wgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7SgTTggJKi0J9SqRZwIE5dnktBmVTpsWL1Hh8S3IqU=;
 b=H+sKsCe4a8RtbhR6k0RahDt5djjNtBijq4yGVBNMteFLg8kQN8fgR7ZDyO2jQ4Sl2E1JgiVCJ812ePEp4YtG8xHjQo9yEQWWRspk7xOTa+vby84g1JOYS8dXwPy3TLrYNkC1Z9C9jFBwNcoJeYAz2sTs12joy9IP1MPdr0KEyWcUxAki+CzpGV3WQQ9uXoo0/GZUnghhYM6y27XxfQ3BWL1lRJ5Wmv+y6rzlE2Nl1vknMhM8J0l+DvYwotSPUDtoYi5RWQo3XRcMZegUfcCOCrfZBzFZslSb8pRus124UjSUF3oWzDoHYy4N4lZ+JD89hv83oQRnSYcRjdW3DUJ86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7SgTTggJKi0J9SqRZwIE5dnktBmVTpsWL1Hh8S3IqU=;
 b=f0v+SKvFa8p9FMgoJ5Scsp+Vm4i/RE2YXwe7dDN4cp4oGCl89RyWTdKX366rjUJNOkosWyTSrPG/BLhCZdOn3MK65rQrgxMln5D+oLbmfYjf+N314AosiTQ7ZxmmDwQS1adD1C4HTfb2XfhUu9V7WBQzUeBPEjcYmhFd/Ujh6G4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6324.namprd10.prod.outlook.com (2603:10b6:303:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 23:57:27 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 23:57:27 +0000
Date: Fri, 24 May 2024 19:57:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] bpf: add check for -masm=normal BPFC option
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB628715DC697A128358B59508C2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da417c8-2370-4bfd-2d3e-08dc7c4d440e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fdFsLfJA6CARPW5hGu5AIKn/kiVMCSVUkqgu5jYzFnDErBLVjAqxIUyHKHAa?=
 =?us-ascii?Q?/Q9xWTse/qBnv7Vip/AEQERhfNmj23HIcgmsZ0e8D23wlHr16svf4RzB/s68?=
 =?us-ascii?Q?lKhWIhrFCCZraFFwSzjD3MxFgx0ZFStISY/dsdObPb5eK7otrlsXTonO/5rx?=
 =?us-ascii?Q?JmW3EcvxTtHwBQJmcnXvJFQKkIIUsmjco9GbeCufLvQff9AR0Jtga7zG1XWb?=
 =?us-ascii?Q?vjVqahkcZNxlKAG/b+x89ok9X2a72YFWsivBUxzb014X9eSGTvHUVuojxX8F?=
 =?us-ascii?Q?d0f32PHRDzIQ4zjR+Vos3fw0NYF5guTY04l2fj6GQjmALpLB5kPymIxtivU2?=
 =?us-ascii?Q?EEwT90miGkwhanVon8iJz8gkXL+ZjZ7UIpBvdzVfkRutd7NUnUWer6Y91eDD?=
 =?us-ascii?Q?cL9SwGi0E4LrxP8D7umAO6lKTGPsJoH2IuZ3ElKcCIpP45v/1Hro2c0Bs46r?=
 =?us-ascii?Q?O/RKDwwebBaN1tr381R944g0vUP44iRJ03/6LHhG2OHYyPdvmr+8P4tp73XW?=
 =?us-ascii?Q?WcU00a2OHt6gwVk5stY4uLIqNbYEu3Y7sktw5NYScEmGjwoL4V7zTjVGaMkf?=
 =?us-ascii?Q?ISI+w+32Qo3OEaW7gM60b5UAL1X2SFhCFutWNZKebIvZEHasq05VVHHBzcGP?=
 =?us-ascii?Q?RmylUG0LiDXyXRIttr6qcp1eJZJaSQ2McMCTUm0HPEKzqzWGVPkdZhRkIWl+?=
 =?us-ascii?Q?NUE1QvpqKuMTr+tyhWbVtOGNK/DpB2cER6QR0pkq6axEek4esjOBUw0/jQTn?=
 =?us-ascii?Q?bePmf6u2hvVdo//xT2pDfVp+FH7I58zOX8wjfd+6yYgmpf/MXFuY1mdqyJZU?=
 =?us-ascii?Q?xCGC/troddOZSOcTNepqQb9tUs53jN2FFI8FgZqlIBDWzE+dDPqA2Nl94RCp?=
 =?us-ascii?Q?ptNJ7oUNFzWYq9Ees+iy/LKxeyGandjSZ7lLJzYNKWwfd273qipA82jm1OVY?=
 =?us-ascii?Q?zw+szGjM72UZglcjEaFS/pZ3rC1Sei6b7VqKIObpmcMlsnLyOko3u4wbZgcE?=
 =?us-ascii?Q?hDgMF6Q8GPT/uTccI3P33U/2Te6rx7uY/uqRxPPWluT7UkyZye6lFb/Z6RY/?=
 =?us-ascii?Q?0RyxEp0uZYmb3oaCl/fBWoskbSUqvbx9wtR8yQKjNzDyHHszTh95J16DiucI?=
 =?us-ascii?Q?rnXKLeIJLDecaHjeWoaEjnrYmt0dBntEHSprEsKqgordD/aC9hAluup/qBes?=
 =?us-ascii?Q?lQijb6dcq5Zu/PTythT885yKXPnNtIy3VcfljFwxn95I18GyGCROHf4TvsBi?=
 =?us-ascii?Q?TrGMy8AlvfSkHghcAmESRv/tOP51jHUVr2IXoikCAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L2u/NwSXSLAuDyLDA1sCstg5vHHv/K/NkCd+QFrXDLEmO7s/4dD2DyzrlDWr?=
 =?us-ascii?Q?s2S34A8Y33p8ESPM6JLpsbsRzKoGH5aTKsz6ToEMY9JCVmXx++HrVCCN/XSP?=
 =?us-ascii?Q?dvQADxowNgPkpBC3IwSVpa+JQtHsYdGhav256PUo/9ydOe/eutKG+nqxBLuS?=
 =?us-ascii?Q?qMlpQnLn+7XOqTTFXIdlG9x8kZBPJgvNcwIAbWflHen72j3Z7/iWXi39dK4w?=
 =?us-ascii?Q?APjZ73AP/hQwd7Fk21rndlji8LJcPCLXuHMM0CnYl26W4R8cFBTchS5X2WVP?=
 =?us-ascii?Q?GLzXuHgaJtsDUVKJk09zS9i/zNYVlSKyq7rxyHc4JDkFhA3pfyT14AGfjpJF?=
 =?us-ascii?Q?qtrYjj9m5ie/GcIjvpyHhEJBXoGKkR1ZPTvtwxXnqzhKFFZ5E2vjeAKT2YLb?=
 =?us-ascii?Q?qyxRrQEC1xdVhDTvA+AaXMJ22qgkBQxNh0gyH3DRYOYDaALe3TpZemfKdXEY?=
 =?us-ascii?Q?iXg47vB+PvTXTfo+eCyZU5JtO/9cchKK2s0pJ0c3bgU+rt1vWVc+wuNiKi8o?=
 =?us-ascii?Q?F8CFUY17IsSH3SSPnXmQjIDeSdoYl7G9OB8/lsOBrKTrCMk6pFPEx5X1dbal?=
 =?us-ascii?Q?pxQSd//iY4QQsRmmAMs5Q1dTboDvygVg1eufFzPzWhPKZX/ow6ztAZl32v3H?=
 =?us-ascii?Q?VFazNUhYqGxyIKbRirAl97tmhx21HkQriiArpk4qZUdNaSZ2/nbsUoJ7BYUK?=
 =?us-ascii?Q?f5X0FKSQerFuPDIfLcdPQcoS+4nT42BzPQY0PDFpbjuaO7fBaawU8n3XF6t5?=
 =?us-ascii?Q?c42R+w8JZ851oDN8oQFmwQi4/hLC02qIW9kp7tTALAxQz4KAa0OV4Vq6kcme?=
 =?us-ascii?Q?J9Sw73IEIb5BvyYGovjA75k/yQyvw57sTaSeLT6DMkrIy4E0hqRQpEPZTEYa?=
 =?us-ascii?Q?yk4vYQjo5NZTzx4IRPXpkWkRsN2oZtS2V6yNiSiLSH1lqbh2x0GBFOX6dzpw?=
 =?us-ascii?Q?PkTGWbIU8+Phfkd71RL9+9C0fbEpLZh0TgOwCTmYdHbRnPLc4lWjWjNCf1kD?=
 =?us-ascii?Q?7GH4oHWlHUnEgVaJyzR3kexTxASiN4HVF4gbgpuJXW5fLgWI1D9wV5p3TAqK?=
 =?us-ascii?Q?tJJUDENj4M52eNGNhhy0vzbRUIuHXVUgPmzqRAw8E1Sz0Yu1lQWnudn7iIMQ?=
 =?us-ascii?Q?8zY8YuJzCaEhUXJTJ/oqI1efCEe9Ls55PUwyTdSE0YI2vtIJDeySD8Q8fvX0?=
 =?us-ascii?Q?p2/ll9xtUY1muD1z3COnc+IhwGZXj8HkLEpE7yUjYLkFwa2Sbx0fsQ8uo4FB?=
 =?us-ascii?Q?wzKYFU0HKNGKrtZZtssomLavXZ9OpPD/MTFErOPtewxw7Jb53t9pcWNe6gHb?=
 =?us-ascii?Q?sl370j05IdlA4ypEExK8xycoBjAXhS1yIN1rNwBMVtwmSj/UwNpn4g5K4ZJ8?=
 =?us-ascii?Q?XL08zQbJ3ivfH2N6zWLNeZeVqMzdJjMG/tgMRMQ3i1Ra3S0vnewCwamRwcY8?=
 =?us-ascii?Q?VvuutJyZTIA6f0no3qJlxtFmwIx9gSo0dcw5/OZqknIrWbpy2atKYkAqQV0F?=
 =?us-ascii?Q?PbeIZt0KCtCUwmo84IJjk+LOm/l04pFcHzcc7KHVy98R76deWFgOQSvHDpHB?=
 =?us-ascii?Q?HFR20KRX+s//MApPr+enkWzxW7/qP55E+CD3LWAq6jwRnSH2M59Oaxct2yCK?=
 =?us-ascii?Q?0EeBeKlgXOUL+0KsYrlB5xU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tPievjGHTjlt7F2f28Psj5sKHkSLJLfmXEto1dYyBmBd0+zr6bMkZt6BIc+t6NixgxQKL71mwIXfsty2e8qwNowbD1Nq6XCcJy0K9aWyQIdTH+bSiRAFHmIjUDID4ayZQpZlBvXA4Pns9GYNEacjenoJcYptNtgw7LfDSPOgth+1d0HToh+M+IVChClqky8grM/c/6VrMVugj5gGOdAryc/km2Ky20HkDo+AVqVAy2uA4u6L7ZDMPwZ3h/MYyctcG0VNNX+7WQBhugtrP7OW0+g2nAOnAym7XSSsyV7BfuaSpL4CnMmmTiHfeiA1KD+kXTXF5b5Kv/PkqybJJ9fZrjvUb6Q03t8U+Pxq+DojZ3V46jmJ6r9INJqEqY73QqB7/lUkZjLH3YTlVNKIzOcpA05DElIlRBXnJivzVgC9mqiXx97ucJF0rAlaqRMg8Pef3ym3FoW78aco/ooROXq2LTzVep6DhJf48SWfJY1XeqP9DXHQ5LNaxi0CzRas+FsqI0VDLLHozq3AnuR6HI/RVu4IcW1yv2hqa5EIhBqbCi/9yPdiWDygTa2HbxOrCIWsRUNK9fgQPenN7JDa9eUJcxyIkHUkp8fFDGex17UR9Ts=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da417c8-2370-4bfd-2d3e-08dc7c4d440e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 23:57:27.6570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTnnCUsA7BCNk+Dn3TQgyF5dxgkEEOpIfl4iVahQP4BFXdQcf1QdGt11+wmeYoxcE/P6E5Qf3hIkVYDekQRlUboVJwxqFU5QKXpu77obHKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405240173
X-Proofpoint-GUID: PVBo7hhnC0mgsLPVLiFTYgAAyV5o7Np8
X-Proofpoint-ORIG-GUID: PVBo7hhnC0mgsLPVLiFTYgAAyV5o7Np8

Newer BPF gcc cross compilers expect assembler instructions in pseudoc
syntax rather than normal syntax by default.  Those versions support
the -masm=normal option, so we test for that and use that option when
mneeded.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile | 2 +-
 Makeconfig  | 1 +
 configure   | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/GNUmakefile b/GNUmakefile
index 7d1af564..360058c6 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -124,7 +124,7 @@ PREPROCESS = $(CC) -E
 export BPFC ?= bpf-unknown-none-gcc
 
 BPFCPPFLAGS += -D$(subst sparc64,__sparc,$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH))))
-BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3)
+BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal)
 export BPFLD ?= bpf-unknown-none-ld
 
 all::
diff --git a/Makeconfig b/Makeconfig
index 87a601c8..f3d47c08 100644
--- a/Makeconfig
+++ b/Makeconfig
@@ -231,6 +231,7 @@ $(eval $(call check-header-rule,DIS4,disassembler(0,0,0,NULL),disasm))
 $(eval $(call check-header-rule,INITDISINFO3,init_disassemble_info(NULL,NULL,NULL),disasm))
 $(eval $(call check-header-rule,INITDISINFO4,init_disassemble_info(NULL,NULL,NULL,NULL),disasm))
 $(eval $(call check-bpfc-option-rule,BPFV3,-mcpu=v3))
+$(eval $(call check-bpfc-option-rule,BPFMASM,-masm=normal))
 
 help-overrides::
 	printf "\n" >&2
diff --git a/configure b/configure
index 40b870f8..c423bc82 100755
--- a/configure
+++ b/configure
@@ -163,6 +163,7 @@ for option in "$@"; do
         HAVE_CLOSE_RANGE=*) write_config_var CLOSE_RANGE "$option";;
         HAVE_GETTID=*) write_config_var GETTID "$option";;
         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
+        HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
 	*) echo "Unknown option $option" >&2
            exit 1;;
     esac
-- 
2.42.0

