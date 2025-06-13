Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726519FA93
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826481; cv=fail; b=CRfgYjdK09B/Fjlo8UktZe+0iD0ltKw7Ob+tVNdvXf2sfkTPBb81rHDhoh5i9GQSErVIe7I6RNplp2KjmY3mQOhM1miJ1yKeHLiXoZ3LnZhaYcPxmTmsqx+MKtgl6dHr/ISvSdDjQ13sXPkUEOIm6KllQkg+p7pBEmWDKgUNpCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826481; c=relaxed/simple;
	bh=fbSFmMtw5obwYFtdsYqGM5D4IWYh6sHKbhQ//GlJQHE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=QZzfH+FTIcVFrwBiJ2X0nZf3RY4Kw9GS6bFcjw+rquLmuBy6D5J7+Ez1zFTIafaA840aWfx50XyuVG89XpINnZKf6aatvwXTlvMaFmu45dCoy6rHDCL3D1nIjyKD5cXM/rs1cAiWtyx79UbcW8Hb7rrWgZ7Wffqppi1IUdXln88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gLzeZp8m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rvtyjQsx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gLzeZp8m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rvtyjQsx"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtdS9005763
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1KtawatavAgeSIExS1
	NOmrkrh1PghTCP1jtBtznD5nY=; b=gLzeZp8m0IPjdB7HuWSG5rq858Yk2mV2Vb
	XbWpnOgiju3TnnpNA0LQoT2/u1yjYv1lDOArL5FeMTW8olYQPQ3Rl2XZAQ6/UEvA
	ssgpXS3mGIbOxlDPwmtn0eUaTGdPXAq0z4XiH1bArH5FYAY/0Bt5TzhVFaAJ3Qi+
	zdafHyVrvtkVP3kvIl5u9GsvVnGGTkS5+zt4guvDYVJMEeAaaSkDNDohb7z4ljG2
	BocyQDMU3fFE3Os3l2dv/WRhESjk06KTb1DYjeEh5SqyBVR26KkE3YZ8xVDZKrNj
	f1mqPKtv8O+4XZH/XOKsVYVcnyXioa5VWpkOhI8bCwVHz8pGpuxA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbekqt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:54:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DE8aWU009143
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:54:37 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdqjse-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:54:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rn2wJiXGDbicI6MgU5ztquEfbnBs8mpLh0LTkkpez2qtlaxh6d8qeQXOp3SHztrSEEPtoeOIIYr4SE5bSqkikN3QF0Cx5PZBhXVl/yK12eHV6jv3T/kY+aRI1xwTt9pjcmfZdyDL5feIOziaqqWlJkx037NhfnUM46vjNHknwUypsXaCTw5fLvAiRDRjc96Dej+wephzIE0MAVR+TN8e/Vus0Bv1w3EwZqMOdPE3qV0YlVc7/GPt6rZp075dO3HvinfUZrw63VpR8Vu2LWx6Y5vNjXq/+XRkBaSfrH7dR2J/dhNFn/vj3U0DQwTls62GV7f0d0WtEafbs/iwyFyC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KtawatavAgeSIExS1NOmrkrh1PghTCP1jtBtznD5nY=;
 b=yi5MMiUOXRsp/z4NTGrm59O7gLsbI851WNkV8RXEAgMGz4bcv2ZqQdgLHiGSHhOzDMXrfVMKkVISbJZkEIAkvUATefxvpwc96tlMhPTqnKmfrqexEU2lXmpM9EslayNoro5M63LkvZ6OukfqQLokNsZGf0HaBdYKmz4NzyQR8ush618N47F4+WhjZW2Iuo2/sGr98Cdty8J4gj/EbD5SmPI+PdomJkrmlk0s1T0N1uj7d7AqjayEGfhAFXMLdTQvuOo/LqE7jig8hzId1Ul1J5+k6GZTqHNrSqPDOLg7F0Hobf4OPzhyYD2EXHBDQeEc0iWd1se866KHL8yXW9Vvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KtawatavAgeSIExS1NOmrkrh1PghTCP1jtBtznD5nY=;
 b=rvtyjQsx3/YqXMMhs01T0N/nsL7y6l9BDfEA7RTWkjX4OKv50p+fVtgtO3xcJGCk+oG8wiJ1BlgVsCOHDinOBjRJ8RoW+Xvo1tDWzzc6dp4zigjXO5MFrcdOI3Xg63qVX+Ecgw96M/ozgrbTercSSD9/LH6fzTQWMys18Qmn+qA=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BY5PR10MB4179.namprd10.prod.outlook.com (2603:10b6:a03:206::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 14:54:34 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:54:34 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 12/14] Test: caller and stackdepth tests
 for rawfbt provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-12-eugene.loh@oracle.com>
Emacs: don't try this at home, kids!
Date: Fri, 13 Jun 2025 15:54:31 +0100
In-Reply-To: <20250522180118.27343-12-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:16 -0400")
Message-ID: <87ecvnbsk8.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0515.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::7) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BY5PR10MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed6a0cd-4d5c-4d19-dbd8-08ddaa8a35b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l9bEKgB65QJXzIZ+yZwoHbiKS+y12omuoWwV1i26g2v51/CBjLsEiDGRbHRc?=
 =?us-ascii?Q?Q2p4zqdrUQ9Q3xjtMeoMx2v6mOEwhfyGq86p4NFc5AZqCfIJhikZatB139pS?=
 =?us-ascii?Q?cmckGtMP3TvH11OP9ZTdjv681tQLxKle9XlNLM2uOi3ifLBDV1hYPN1yHN61?=
 =?us-ascii?Q?bfNyeVKN0GZLvsxJ3CkasyKVfoQG5iijeU+Am6Vu8vlUMJLXWG+8hZ3SF4qm?=
 =?us-ascii?Q?E+4ifeVKPSf5AU5ypgqqNS7ozd/QmYW8o/rjx028px93Z1G+ukaj4M3HI7E3?=
 =?us-ascii?Q?PALXIXncqEuNJpkOELzMGE/c506umqQEcBkM9FrKvEIaNXWjP5XRhcCntPyu?=
 =?us-ascii?Q?WuxeMrE8bbEjOe7r2l+UnD/OE4riWkao0PBdwFKLqNPeSiaTdSvJEjmO2I5E?=
 =?us-ascii?Q?FNkPa65RWJUawxZ+Xj72ZVHsIjTSDS5Z2zuhvGLtsPUySlTL3JTpSooTqsZD?=
 =?us-ascii?Q?lN9Ttq0+0TZ0HUV4BZvvIAAQV3UENbCQfn+PAf+QLDxODSrZYTgPFvYAGUq5?=
 =?us-ascii?Q?gg9h/x8ibbKWIEIBRxNsm5b+rz+3WSvI2fXfuX7bzx5/HF81S7Px/7lqdvNp?=
 =?us-ascii?Q?W8CP372ODNdbzef7J2bvvzFRXwTuoJu76lnT9POcso9m8zEbnSIrUqsoAx2K?=
 =?us-ascii?Q?RufFN6PxWYtZfpH3MSZ9FUgv+LuSs+7OBS1cA92jqjb8bVauM8UP86gQ33io?=
 =?us-ascii?Q?Sy9UZfGm2OUU2qkSeARSG6oifVA1kU0Pak0RG0mqHIJbR15vbimuiRU0d1Te?=
 =?us-ascii?Q?FekjMHHpbSr7VhZv5K6gDD3UuZdQZ/EDsyjVtb6yPLPoonHHbQ0bb8sygmJY?=
 =?us-ascii?Q?VppNXZMZ6qEfD4NQYR+l/wlEMyl/0ReB1wt2qc297zPZJitTBpEWxM/zzDey?=
 =?us-ascii?Q?r9KjFyuJyQ63Xz5f4zLjUxbhfFq6A4jOJ+zrPMBi03nCkuh+ckYa660mYlou?=
 =?us-ascii?Q?LOUGUadyNuRxePsBHvhl1Dp4Q05BtlNw5T57xIoS9p1efymbf/7VwN7/R9Tf?=
 =?us-ascii?Q?2MV0/dydfPOftmF4b2v2Ip77MwnuQpS++RzLEqdbu4rLdrK8l/mJwHyVCaOA?=
 =?us-ascii?Q?kbvzy5djX215b62d8bgnet8528fUjXkpBmELez9U1Eqb6XFjUZmEuZj5sGV3?=
 =?us-ascii?Q?W9xOgjL+jR/pIwH3BnPfTIowbYA311Xwt/C1C40xrdzYB9hTkkPtw4IcSZSJ?=
 =?us-ascii?Q?lBKj9nom/kLxt/w8vHDYQcpSlWlHtCtZwvzLg1BYS5XkVy1RT0bpq1iutYq3?=
 =?us-ascii?Q?qFym6ZcKqdK6KwTEr7vr+8nv1vkcon8TvcfZQqIPxAY3lP0RGeidCSa35Nuz?=
 =?us-ascii?Q?46OlWpE6ZK7IXjpEY1+GJQNe1XXd/WzPq2abQqItTwYlCfeCHG48zUZ7zbrc?=
 =?us-ascii?Q?0s1SHE+BRlHnxUHeSer0oP6A2xMgVBrO5rsGD2WWMPBy1+J4De1r0uDvek34?=
 =?us-ascii?Q?6qoTkMGvq7g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5lkD7W9lrkqKTT9IG4arM2X90+9c5hWdSEAdSxdUFxLVx3jzPEcgC+Pnl8/B?=
 =?us-ascii?Q?jeY2zySjioio3eaDv/G/6QYWmanY46Isv0kmKlnAELkcGzftd0ADr3itEtYH?=
 =?us-ascii?Q?O1Pdy3EQWM4y1M9BOh9L+9uDXNz4JwOGdo0Iy3BIMTnTEVb6izyCOvn99aUJ?=
 =?us-ascii?Q?nkiDjRSXDB3qmLZuOVJrUf7mF5N1NFceF2eDWhApHxDISxOfDgpV0LlyBb9F?=
 =?us-ascii?Q?xMU5+Uq3WDFCms0r3fwuBwIehhQIA9xAIiK9j6x1qBVzvi5CIhv8xfz+AUmV?=
 =?us-ascii?Q?C4Y3MpCQUNLFSjkV3EA+Xzh1VlGV3r9/3r9RfZ+HqFDemvDSbOpbEHxBnAmO?=
 =?us-ascii?Q?f0cyh+mZ3KO6F19Mz/C6NzA4arvgZBoB0Xcn5gvOMHM2iSo5l6rmwefBlSQX?=
 =?us-ascii?Q?WUZLnLv3PKnLuH78P+tb/WAUIk+aEov731B7xnxifpKl7u1qF0yUVlpG/Z/p?=
 =?us-ascii?Q?sUOM0GtcT/FWYdiaRVBeIMXZnWIKU66sJjCgqBagGurw/nqGU7TnZxCKXMnu?=
 =?us-ascii?Q?8GSVort1daaE14tj7dy1mvA8MS4tpkLXAnMWs7hVvogBnIpBNmTfVCUV6fpr?=
 =?us-ascii?Q?/IlJ1ziFcV3tdMO9J2puAY08AbUvbY9PZAfAvgbmVSqpVSX8nLj51k+PK3wG?=
 =?us-ascii?Q?UsncUyI4Wz+BLoLpHLpYQFheaDICz1cxZsCEU+6GDQsPllGSlQLaMD7D/2oQ?=
 =?us-ascii?Q?EpupXKYypSedyKAOBKW4FJ0ybmP1wiCtrTTk3KW/Rnipwr+VcZ+0FpKh13hf?=
 =?us-ascii?Q?WmqVqsxGJmytLYt4NGsqbEdekzmNK0ZMox8sibbYW3VpLTFtBb2lIYkJ7Mj+?=
 =?us-ascii?Q?IleMlcbBdjDIdsaPyFxrnf1yZzVEvQMiwMVmBpIJu9CCOu44utNRQqfJc6oV?=
 =?us-ascii?Q?9Mm/js0aEbvVJmABahVuHHj5WoETlO1IuzZoWCpJOnxYcqRu0r0eWbZQtcaC?=
 =?us-ascii?Q?UMwLUy0HP68gTCPk2InK500G5Jsl1gFghRXmSofuY8dNJXqgE8CC8QpR2jF1?=
 =?us-ascii?Q?PJ/ZS4X4FGkA69+8jIpEEMhW4XNsSmSTOaDsi5YlxPNwNoJ3LORBhi4cN0m5?=
 =?us-ascii?Q?kGi2zuuVs3q5pw2LcIP/jbBFXSMKncsC0ebgIlRhhQ8Io0NJWsZGnc8AqyhJ?=
 =?us-ascii?Q?f0TyNoJa0W9paLHOczpuX4orNXQjxGqTgEO0f6u2VIb7oJYGwszKiIYxnXAu?=
 =?us-ascii?Q?0K8aqnBQYDsyqskiFeA/efIW5impi+jgPTOI6gS3ouk1IcS/P/KBwEiJ7B2L?=
 =?us-ascii?Q?g/Clvge2zVoMUvaQD5Lu0qHJEE6cxKrXPZkQfxmbKv89tw9o2tV7lEoN4iti?=
 =?us-ascii?Q?9qWa7cwE5qvxgu3FvalgSa9lA3Wy83lxNH/HY1iIekJ+mm1jIzx/XZRbTQtz?=
 =?us-ascii?Q?cvXudz58+4UbWsLkgRF0n9tYw7Kf9RA/Lm3ABR4O+niC/iAT8HqyE+8Ye7Pb?=
 =?us-ascii?Q?vDGxVrDmNVLiUvanIVvR4RA/TbuJACWFg+fI4lJDJeQivdNnxsdQ83xTGsB1?=
 =?us-ascii?Q?LEGkWZc5fJgkVovBbYi08BTdhaGcj+UT3ninFtYkHtMo38zosFS57XtFLzpj?=
 =?us-ascii?Q?9ufjRkuZUwf2WIlyH8VKnZPBnPcPnH3N/VODgQ4N9MZDYULyFpWD4svlltKQ?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BgSA/9dhhPa/G51KGd0TJrUyR6+9tG1NfJr5l8qXaOlZS1N79Z7vHdHFprvLWSFchfbKrwuLLlsFmFeS893jO9L/i456Kj3M2x7oxTh2bhl90aLdd01Uk5xGplwx2ZRxTCTwXtkOAa7ITq++sGfOXcMyQphVUA5kSxfH1OCxk1TDa4RqPbr1CQGPbvAPsNGbW78bDOVvhjGqx7ya1VbkkZY/7Ile9LZ36Xvwm//PaehQw34CiQrTDYsZV5zCzzCH3q/wTDWblMfTxDqwZC+6EcLtYrxrDz5Mozt3nBCMeeFsdSpDwT59fR3vfvNWf0dN1kKTqbIZeOFshl+6gfJKjILFXVKxj4a2J1SMKIXBnk18qxhr8jvZ/j4xVlmgPwjR8x/H7qoFGPs8mP3HycstI/RuhRRAMTcKgzjafsr9iUSuYteAk4hkDHujaoDX1/UP8DeqZGoKbLOQc3diJapgDNDV5iahctb4YxfJ+vVFw5y2BAsex2tlGpNHhp5YQzDMwDLsxh80OpmYoJ3XD0EkEDdQn8+iUe947+sgho/bXDrunCX4nrtXUAmSPUgVORo0Pr0IjOkd0MER3Uq9OPoqwQ0TzlK0/69nRxFqU3gPsok=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed6a0cd-4d5c-4d19-dbd8-08ddaa8a35b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:54:34.1753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqMqjBUXi+5vEPbBXe2RXnKiV4kn7mq/0KqMRDDBPYGpc4FO2RmmMGqth8Npb06Pa9jkYa7LpFa94yizhNmbOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130108
X-Proofpoint-GUID: SzwqRWZRBep68HVeFJCB_EZzrYzwT4Ij
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=684c3bae b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JJyjzE1rDzTo_sAUMDQA:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: SzwqRWZRBep68HVeFJCB_EZzrYzwT4Ij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwOCBTYWx0ZWRfX/AW1XX92cwD9 5N1zov6ldjG/GW42ZR6Uir8/QODEpG0XdiztElJhwEtV7GqlCsJXsyfSVvbgd91o2f8wBiiRfJc huSsaOjMJDDtrnrDgfcQWzahC3JtrUU0cIwKh8gqq7dz5DQj8aIooONi5QNGGRbgrCTY/bC4psJ
 WFm/K16wEGU+/A/YFFkhRfi7b1vu9uljMDxtHtbDPFTIBf3z8raMtYv77gO9FjDllk2MQwSQ2wh 6OIOHznkkL80WdySw32w5bFz9yMnFxS4c5dGuhCKgddXS2034nbYX410FZM4dZgUypZKIGUvd80 qpuHulFfq2vbn6gihyRfM1L4TBQMO4UaaJHSFgaRxG4I0gI5vhnq8C6TVrSf1VnuDhUwaaKwhUc
 QPKPvV0N/mei81n7d6B2AQkN76O/CiNsuYfvAGGAAYW81l2vFjKGjLnKKzprCQgi6KqNaQDi

On 22 May 2025, eugene loh spake thusly:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

I note the lack of any sort of skipping on older kernels. Do the
concerns about older kernels not apply here?

If not, and this was intentional...

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
