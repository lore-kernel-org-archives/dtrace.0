Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA21E0B87
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150310; cv=fail; b=MPZxZkf5YoeMuYYmt8JEwF5dREY3H2anA4VJIRuVxv/qSC+HplsHc5SGLEJqyZmfAFjOeGzdYr6gSmx20yuZH4OM0FltdVxbF6ncpkbxp/By+brV20wovqs0yMs9wabr74L/nv3yBEoNkvkL9LugjGacUWtt0tZfB4gxEt692y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150310; c=relaxed/simple;
	bh=iJlCw6/oE0TTjmI9WiQ80KlrG27OpNQPWo4S3rUHSw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jtqqLAnXGoh5CVtaMidEryMBTlKulS0gHB/g3nafyAGZj3rObS8OQtaoQ26rLw7FUXZ+s32tmD6KVVM8zkwCR/G8quXi6XghHHtYMlsrAeli5Qgurmybg6QnHN6AyqarBVN1VyeRLRJf3F4uK2kFuBiyXPoNMsv6ict4XeXJ9rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IWwuLBFU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=viUyNOkH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IWwuLBFU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="viUyNOkH"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtbGS032558;
	Mon, 28 Oct 2024 21:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=F4nADZ1XQG7X04pqN1jXT4D1fsIn1voE+ohWI0Xpojg=; b=
	IWwuLBFUlbOGDZJPaWKVyFR1qd99zu6R4aExcdda5YiQsdCSpZ2V8hBgXAG6Ij1x
	u9B4r5ZIZB4Fi0wqrpkBcsiIjVL1kAM5nhqplIcmdwFGRY3VH91jIaT34zBRHOkj
	e5tFh1bRclEDoQtxZEhuXkyz4ML73JMIulKinmM3hLXC8MOtL8hcRMRN54FA5iHo
	TTJ4lacCiYPGvaSCUFK7MiGO0ooLGDUnEeLA9JBIPc0YyWzBvg9mdSK0WEQuJ4Aw
	/K89IIUqSiqnBaOD2HogV4q7fIJQAoKFtUBNyCt4nBVhTeEhSMvFGkzL+ugR24vF
	eRHsMrJeL9vISnS9D9odQA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc1uy5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKCwI2010127;
	Mon, 28 Oct 2024 21:18:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8vu56e-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/FULBCO1D4hgcqQFggr8HB2fDzqt/Py5o397keNWkC9xkMb2d1hS3L2A52d2aDe4Dcs8u4RhUkJ0/UrXdeW/miuRAuiYF6WV7LG0NyZ+cim1aciUUhXIcT5eg55ux85lHpficlaSRwBLPX5cW9xBCLz1s6IVKTGhTTzo0rsZr3FubWeqlT61Bbc80zXKea6srgk2P/zSn9HWW9ZlZGtvK5Axm/9fdjqCo49zuEs0pxq3b/3WmlRGcVfpS6ezctKP27XNmxJui8XnuRPRglc6OpVXlnZRgVsbPukzOJDIZzBrdLYN16IMT2MdgbwZLmrNHM16LDaZx/Kbc9bxcjj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4nADZ1XQG7X04pqN1jXT4D1fsIn1voE+ohWI0Xpojg=;
 b=CGg1/zd2qSoQgp8d1jT1PnANpeDM1YHhToeQG1UMpNIkKnrFFn9KX32dhze3oylWLPpaXXSR2A51qjCeLQTDb8ybKinoXSMdMBU+e76o/V+uQ0IqmWLT5WUeVwGzTi7WAEX/KWsj+0UzdefIO8VXchXKG4PWKUUEnDk2Ah0Y8mG/F/VUaq7/oMTDuMzhm9tm2DJwGTOkOjA1cCldsXNJOQrV5UZVvBnS+gzGMsXVPBSecBUpwktPT8cZU9eYeaAflR6zMCEhgcEe3bjalVUwMckPx72uB/hnWbwO/cRSfmPT5r8jIYN0XyHtQYmcVsGP8GasJT1tSpHrxPCuFqKcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4nADZ1XQG7X04pqN1jXT4D1fsIn1voE+ohWI0Xpojg=;
 b=viUyNOkHxGNv03EjeF1c2rjJn2OFTxColYF2wGizWxd+d6/CXMA0H01aZIF+3kacfMZ/tWKLZwYRUuOiSMU1EddhwXR5fGz84fJLWR57PihuDQwGBPpYYe5IOKbsLHTvir9BEluQTuSYFu5RMTkS7/568iHjiRaMGPuc84w6+EY=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:21 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:21 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 07/14] man: the synopsis is ended with .YS, not .SY
Date: Mon, 28 Oct 2024 21:17:56 +0000
Message-ID: <20241028211803.458685-8-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0357.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::20) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: f3eb275c-ab26-4647-b61f-08dcf7960cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VflI40mXxsHv6bbGQvqMGLjQ6rLlejfMdAUncfWAeQbMHRAdQnFykyzSCHwZ?=
 =?us-ascii?Q?2qeBQykbpLFIH+mVlNzFXa8KdkpKNWx3VkGU0MElbzIkJrGHXrFSUjxL17Tz?=
 =?us-ascii?Q?n3lSEXhJ+l0cM3vUnf9aXeUBixqyKOeP6IR3hzUwSxo/nibM+SG7RSeosFhf?=
 =?us-ascii?Q?wACYGmtGQS5g2dRmm2Cb0pgBPSnYadjoHtODn080vA59ev2dnkZLvYiuWAD7?=
 =?us-ascii?Q?KYRt1hGr1h3paUt+G8mjcteV7kD9Kfaenb1CSHszaYqwMPPHscfcjBoi/2LL?=
 =?us-ascii?Q?s3kxvdW7lLjzaXmq5gFGRH0GQFFH+nno3G2+bAdHqRxh40bfq9iPHV16WS2S?=
 =?us-ascii?Q?vJvP/GuQ9Hyt9lTLWNisBZ7W+NkaxHqp+TGQKg6ZvULZ2K2JuECZ3aBrlPMf?=
 =?us-ascii?Q?SIBM3Y+dp9aXn+frQMDeoERCNwLQBp/p5kchv9ty0PXG4pIaFa9oT7a8f56k?=
 =?us-ascii?Q?O3W5y7uIV/5wzmMqua/N3XLdAjOpmTg58YeXdxRgGn68xcMV3iw3XwFxNhJa?=
 =?us-ascii?Q?YPG6EBM6XnRxLzGpNPobaogCsfSii7GaUxlZW1t1IwyVbYeoYEm3riQwiFkQ?=
 =?us-ascii?Q?gYfqiwCClAcjxfuo1SJyNWMb5RNJbpNN6C7WsJSS+11LZ3ljJFq4385MF9tM?=
 =?us-ascii?Q?rHb4hWMWThOkdWRrOZwLuXpGsjScsb8WlD6IQfiPYuv0y2QaheWrDmkQe8lw?=
 =?us-ascii?Q?Wj5iE0bJ4pwe2qPgoDxdPtJat5+iUW8zSBQykthbSetqhhisHenJORpaEZK3?=
 =?us-ascii?Q?0/4fvz59HSGhKa/rc7UQKp65rNpnQOhKXqKQCf3KYbojYYv1yrzwtj1ZF+Ko?=
 =?us-ascii?Q?a1+xKzv9KYf8cCDMaLta/p0F8ZAYXnCa2+NZWCuB7JXFnWHkRsN0I5+R6MgI?=
 =?us-ascii?Q?oPGmnuK8fbRbG/m1JXcHqSDBTR7fKPZsYK/dbA4UZMdlMjSIUeniunIS3XFE?=
 =?us-ascii?Q?aPF4XDsNGywCmrCi/janR6xCm7YsiJYKcYFLlAWuWtFsmgx16EX7YBE+H4Iq?=
 =?us-ascii?Q?r7QSP61fcbFQwo7xeTLJyuhno4rufNpzbt4JPrKwKcQ2wIbACqm1L42Wgu3F?=
 =?us-ascii?Q?7zLaMR9Xj7vX3YHqHdT3cklFnSG2k79Z9leLyr9QdvFWWnWxnNTahXZSgrbC?=
 =?us-ascii?Q?9rDvqQCsZOK8vCyOwKvTnvbqnm2NG/plfwHA48rVBSH7ivC1BJEizK3yd6RH?=
 =?us-ascii?Q?y7DXPB+ThbdFU45XCi0uuxMc1fmZrLbQtwql1d1V/2piIym8LHwlGEBaMefX?=
 =?us-ascii?Q?shPG2IZokVPiE6IsrBpS8///krk5HKHTiYxdslEXW+fI+Y0T6l1OVg718Hgz?=
 =?us-ascii?Q?FzHvWAGYmkulAEqOFsLudlth?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rNAMnXULsyzCWZSzlzb0tVpH4zsC2VmEVN8P4lb5kQBA7kK10v7R8T+66LVo?=
 =?us-ascii?Q?inBSrtN0i+d8UxPjvjs5vBW5d5ne5LxldL1ncuJjOqFrTQ9RkFAOl8AxLxMw?=
 =?us-ascii?Q?5BQSBF3WByIphPB+uKdd5czzCSKi+PUuSG+dKEO5NJ786CyAr1rNtUHQy66K?=
 =?us-ascii?Q?maHV8aLOdQLMp0WfauDMBANoSjJ45Sts5Q/pgOVc/6/UzJPjWBKiMH27nFuT?=
 =?us-ascii?Q?6efCtgLcFs7MgybwV09cesmBk4vC81JIxxYMCOBJhSZ7eVvNUuWH9HemzYWF?=
 =?us-ascii?Q?ry+BHNW3J4ibaGp0HaP5vhH/r1V13L7Uokp51zHQzsoUEGkyjnSo0mxBZFwa?=
 =?us-ascii?Q?oEyb5xmVaYuYHz3hcg33VuMBMTLA+gAKbuUwL5+S77iIrQ4N45YqtfNhB4GC?=
 =?us-ascii?Q?v3cJvCM8ZrPEabZ25fiPwBFgkDwqKj/9ULOqrlmDo4eZNOx+cFcw8RjZhJQo?=
 =?us-ascii?Q?Hxrf42OsGm5fWjysMUNOUkRyCfl6wORg9SrpR4ibXfAldOlDuQxU7VqSne0x?=
 =?us-ascii?Q?HIaN1djUvPMnLxdzgLwev0KHmZHf5LHustQ257T6FQkesKbKcDAOjLGsLNjV?=
 =?us-ascii?Q?EViXdhaApmEpLs9JGgegynOljj0+TEClSUTJxb1saMj6Liao0DUvpI/M/spG?=
 =?us-ascii?Q?MS41HVicSgsy9bR99j2It6l8llkXmDKWNrtakqlL+q6jhUhIX5CivDgAbTz9?=
 =?us-ascii?Q?BzsA+nFDBwbqdfopGvWcMwwA1/PJBQqdc+6u1TbU037kFaDgjwYKuO5Jw/2+?=
 =?us-ascii?Q?hVnZ/jvN7iwuvOMxeMRM5dzyNkv00achRlPvpeAfyAd2WpwhPCnHqyugVuYn?=
 =?us-ascii?Q?RjmagEuToLwH1TfVTmZSavBE3lihXZwHeZtX20CPt0yhfgE31j0Cd2QY3je0?=
 =?us-ascii?Q?fTGqy+OK5RgKDBPltBM1eIXaCg54XGOW16+i4sc4n9Kq32OaO/M60TZYELtN?=
 =?us-ascii?Q?+77NcXWGO/WlQm9FoUwclGngenE9vBN0uRxFJgDo/Dp363ny6wYENop0kSAA?=
 =?us-ascii?Q?IM7JwCiFhqLtt5HHSym+pCkJpg+TG9cFT22jX5FfhpMO4KABHJ3by8yNOZ+T?=
 =?us-ascii?Q?yYXhGOZGQsa6NqUzaRhTJt7PH6E+T76IwMMcp5lLNiz850pGEu9i5LzVBZ5R?=
 =?us-ascii?Q?/gfvKGdg15U5lFtBXizDfY3T8qjSPdV5H6DWX455yorbEbbpxHbq/awv9mTN?=
 =?us-ascii?Q?tEe5haE6RYRxfQki0F5UIzAksftgP+0d8OWz5fWPPDaz1d3/zvKg9hbvJ5oC?=
 =?us-ascii?Q?Uadr7plGbtKOgPBv9e7JGQUCIQ4Wk9v8BC6TZ0faRYQyptYDXUv0BHqM16hY?=
 =?us-ascii?Q?w6EzRR98570IT7taS5336xfBS6o7JY8qtmtiCkSqvs9A7BITqiElJ2puAN3b?=
 =?us-ascii?Q?7XHv1f+gtNj4zKPUv3hzmZGJCUKyKv45IDquVgMsYKWNUWTv0fVN3l4LYvch?=
 =?us-ascii?Q?wjJcWtuVHy4OZCf6htIQ6OoWxCxery7J7jyqSAaRJPepZHu9H1me1+JReMRJ?=
 =?us-ascii?Q?dZepNUoZu5CmFPrEazJ/gImw2IFSLjPpPTab86r7apVI53DSih8vU1BTtZXq?=
 =?us-ascii?Q?31HfMSbTvuGAArSMX4fUcNVzt6JoE47k1B6wgSyxR1UjjrS3v8xVsiPDMaK/?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cCNy7MIyh+pj2dUrz3lgefLBZJq0/oFRkHlZItQwLlro86lmsn5uGLp9AQP9lwe2Fxm0aNLP82Q5v9dgYnkJ1cFGdLmjVQl5M7P5mX22GltuNgrCAXyHQ8sUUO6od7218ks4motkaIAu8L/SRQKksR4PBmbT1WgQ+qe1gwCSknHr0OmXYuGKAyB7/gRq6z7uULhknmDryPeVSfU/MPyTfhKqgV/g9lGmCCtFhtR0bnVg3gK2/52HjOzzsFEv9fxN6yfVrxngWB0PGczWfnVCrQbQz3PeIQAHQ5vKeBnIGPvxtMrty3n/j/Uuo39Y2Qgc4odfMgfcbabpUTxlVwk2RX/d05Uikckex8C/jXnsCtHs9QxvF7qPHQDbiEpJRn+hAYp+0a4kymqH7F/GBiGqQxP487ZkUtojYpXs+DUH2XgvSMJBx7RSiAZaXBEX5Ho2WXm21h/FsbcdiB/pzzV8viOkovw94UXg01+uQwqA8qww5ZEe+/I2cKBl3DmRQwTKJT5YWZrpCI6322K3LsG4u+YTcNM2hhYPbkKt4gx2Vm3uSc0AcXZj4vz2zCrMVmntjNmgVxdpLw2GZpJnWj9IXpn3JuDR5pYbDiEhDBeRfnk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3eb275c-ab26-4647-b61f-08dcf7960cc1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:21.1752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5vKJIVr3N6mj5fRYVK1skRw7He+FboVeAEWoOago3Y7Hio6w75FimsB6eWxCvlEB5qhBqiT3wQY6yGGC7oQrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: YC96U5WLx1tNc0Axk1lJZ6yi0gGwO7Nm
X-Proofpoint-ORIG-GUID: YC96U5WLx1tNc0Axk1lJZ6yi0gGwO7Nm

.SY *starts* the synopsis.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 0a1a15304aa1..940ddfc65d1a 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -33,8 +33,8 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
 .OP \-n [[[provider:]\ module:]\ function:]name\ [[predicate]\ action]
 .br
 .OP \-i probe-id\ [[predicate]\ action]
-.SY
-
+.YS
+.
 .SH DESCRIPTION
 .LP
 DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
-- 
2.46.0.278.g36e3a12567

