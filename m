Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CCDA55
	for <dtrace@lists.linux.dev>; Sun, 28 Apr 2024 01:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714268125; cv=fail; b=HyjrP7l5LldSFr9bZIZ+HBdfhU8G/jpUq2duY5xKncCcUxspAsPPxPDosDckq7T7THAtZrVl1PymbH8Pm+ShqBWCIEiOxr74pV9qyzCLV+MaN4zrJCbvGpWli1dn3txeY4AJUZYW9ofvJYildCxnS8t25lAuEgnhHadbwj/VTko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714268125; c=relaxed/simple;
	bh=SpEmmQ5GLfXZTvJCwnlvqE7Jkx22s2NVZEiYZZv4Qvg=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=BZRVyCDNi1O3qo8NnTqpT83MaT4hHJ2uLWwHtL0dSOUTJLouW/1GGIXPn8pcNRpfzbxwQMg5JvDlMNO1MFDg7Us/goXQXnpb3RM1sM+Sy9TvfT3PYRU66EtNuHgq274JKr15P7435MkhnL4eDOS/6G1RpGR2Oph25jtCq7zHl64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bnYQk/dR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aPmLrkAG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bnYQk/dR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aPmLrkAG"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43RN0NAl006913
	for <dtrace@lists.linux.dev>; Sun, 28 Apr 2024 01:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2023-11-20;
 bh=uQCmPQ+e6pcPAUlr9vcSHSwnbcq7SGs2Lsicr96nBh0=;
 b=bnYQk/dRSobSHah2prmi3vciE6FmP1BNETJLeOCd8JU6U1qqU/c1mR7DiQn/P4Gntc0h
 l44P7rzfMdlw5hsAheS8hLXMOm+m+4m9VaGqROeObnL5VNUIOjxz0IumuFbFtiBoJJJF
 KYzpDLdJA5qL36M6jjUj9CfartSAeDCLD0qkTpsbwUYSxNjN/cMIK9Rxt168R3SEvDDM
 QZ735Rdaq3lPu8+UxeG1oYrYES7IWUDKKCwDcAksooTWk5tD4+WwxvLRK696M1NnaJxr
 t9qYHQY/yX4fntxL+XI/5DCeGOjgoMCh3SR9Q84x90R7zyu02RwDNnHjRuXKN7QxwYF1 mw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrryv0phm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 28 Apr 2024 01:35:21 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43S03QHj011415
	for <dtrace@lists.linux.dev>; Sun, 28 Apr 2024 01:35:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt4vh59-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 28 Apr 2024 01:35:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhq2Jc1rBv2zW2gXX2WZ8gUh0dUULnbSf4TexfNEYFbKERdw4NdyeikjPsmniD3X8fRsHsxLJ1KRRy+jhcsZgSZbNRNpdWIGNOIRxcvthFTH8JfOWbyT3ey53dJLBlQ1juw+SA6e6NWAN2ZKjMYF/XqOTSpYC6nvXOlvtoT/+9B6ZT4bbabTLkLep8L2lWfPQe+3fOiJoNV7ig7vawaXD1w2KrFUQeoHwnrlUoVB4RmXy6MImIjIPcJSRzgQfSgnTaB7iaXgaD9Rx0vz3GqN1PRf+hbUs1RLpfmp7b4VcxVQivltwfsWqEBeQG8JETfuZHZfxh1IY5NSCXg486cX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQCmPQ+e6pcPAUlr9vcSHSwnbcq7SGs2Lsicr96nBh0=;
 b=fVxAYkfFR01lLVvLQiUq/JfAW8GFukdPZ/iEJRWflB2XWWqzxTpVxIYEW60q7qCeubW/I+90geSzfu/MX+W3nJZgrsRYum2vDE8Ho/gIJijaTK0u2RI77M3eZt9N1qCywARPLUSFAf7Uhet9HOwQgYbV/Fgv/y6nMSOBRr1q9TQBbp9nh20GitdRtizJsf926pIdEFVp0nKh9I6qFg4hddLDfM6DMd+iG4IoKpyKaDHudzbu9zTiI5A8OeGCuHN+oY4/Q0SOf7FZ8ajjkcadaYe0vub+1ZevhvjsQJOrjfzk7Lv43XcIYQKmE3VcLGqE+rBt9H1Q9IizGvtjlk2JSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQCmPQ+e6pcPAUlr9vcSHSwnbcq7SGs2Lsicr96nBh0=;
 b=aPmLrkAGqsbBQ/3Jd+dfFU+i/hlUrzBBwRF/4f9/PUdiaqr9/z886scEGgmBrmKYKtU9K3eUmbDyb3PL7QJkXsGIQ6NdXJOi1nrHBGBTSbpH9e1d8w05jFnmWaweJBoRcArBTCJ0lfii1kov036IAaczZqg6q7fekbvtbsGkYm8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN2PR10MB4397.namprd10.prod.outlook.com (2603:10b6:208:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Sun, 28 Apr
 2024 01:35:17 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 01:35:17 +0000
Date: Sat, 27 Apr 2024 21:35:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
Subject: Possible (long standing) issue in the BPF verifier?
Message-ID: <Zi2n0lpb7Kk15qKE@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN2PR10MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fca325-4ccf-4638-adbf-08dc6723759e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lqplpA2X4Q2B54MDI2W1kxcby38OYaWzDiRCun+zW+J9NHLcRMYOkY+4EBTy?=
 =?us-ascii?Q?a9txNdJqM9+A+RshWZ3taaBNFGBaUQHUDE0L2V/CPpYLgoaS+UdciiEczQuK?=
 =?us-ascii?Q?QtiQA+qLIkAvVPdCLUeZg9sSCI8t/v5xuFtsqUIxyAlruWILDvltnHViZ2Yc?=
 =?us-ascii?Q?V4ELt5TOja9M99lhqX9IW1sejCHzeL1n2MZJJaLSkFsTZnCuAX6x/Dzx6a9w?=
 =?us-ascii?Q?GKW6NIOxpqdjeL8pV6etU+d2tdGL/W2GOwJ7nzXzuCkpnXRkIlHIXUt28hGu?=
 =?us-ascii?Q?m24wY+GSKVK61CY2lcvigIGMxXJSkMLLx5A31jbG2ILCwIl5+4xQCziqQue6?=
 =?us-ascii?Q?xUA1C8y8fz+2Lxn+nZPhuryB+MAcxvQQ5Kw3cyAyC2r1S9eiSQ83Fh3ioqFH?=
 =?us-ascii?Q?HBnlaZ+lOGyRZfrR2wWOku5k20KRlzaotgBdEZcUIFeMetsLLOYUhmOLNF34?=
 =?us-ascii?Q?//R6cAF9Tx9dBkR/LcSjROM6khUdR46bVi8XdyLvfvRqGj6Xxiv0qx38Uuw3?=
 =?us-ascii?Q?qM9gR8Q0njWONxvGD2B/cJXA5x/oi7zWd8rmI/rgUJnddAlQVYSD6vOD5rrS?=
 =?us-ascii?Q?JAUSGvTj9WWYAYbI/MRDbNvBQPztEYJ8+jUpQ8ve9Chrm1TZkPZh3YraiS/m?=
 =?us-ascii?Q?EMgrPG/l0F1xVISryGbq+MjGWBmAa+PbiXHFaFMrAqFmw2sSiEBuT1dkkuYe?=
 =?us-ascii?Q?nES/86tTYOVkPXZyU6MxbnaKQjrEKNo28S2DENM/p9zh4/oicBk7JDAwCsp4?=
 =?us-ascii?Q?WWC9DpGtyT51yLVdZ+ZCBddx3pPXsmCsvOXFWM8HGiaZubdogPn9ludKW0ee?=
 =?us-ascii?Q?CTGNBAqBpHt7GNseiwl6+a7WRhB0OMhu34vKQ3y/QoUL6EE3+DfD8+G9+evu?=
 =?us-ascii?Q?Oh9pWfjg66wiWfTmko/3157z7rnsvzh5ctq2wd6RnLvZMdkeoZWVJvGdB6MF?=
 =?us-ascii?Q?QK9o2dG+cD3rpLsn2IfU9tPa6y1cc084r5Vcr2T/Uia68f18zS7vhvkBr3y3?=
 =?us-ascii?Q?02/IgVdo41Z2vDXsUZEXmuV+5F6NfH08GQvaV+E+uUXHLDW8bJusixFbI1vr?=
 =?us-ascii?Q?FdjK/8KkmD/BC8lhRWwz1455h/c2hpksTgg4cdiWI51nIXlDYPOs6ER5nCho?=
 =?us-ascii?Q?WFufoMO/nXY4KNj5nHBIKjqkCtUP3JYJvbliq9PMs55TjbDZmJ6OFXj2cCu3?=
 =?us-ascii?Q?gJ2e6UeiEKzYXKpE3HDk3ztBs75C3R50JDZ7wn6qTSIO0MJgScmuOzFCGI1j?=
 =?us-ascii?Q?P6uMTxtrsGYjoLCJOmhdkP1t5ncBp9Cs1C5skIIAOQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aYXROSN2SJReR7RxUJQHVDizAuwossVITittDlbpmKbzpwb7NPPB8aSdCA4G?=
 =?us-ascii?Q?PCUKpH3BI2zOgqilSuXMI6rw+Vqk5d4ZLepMRwXg/sfwV1pAshSGoYKMKbwM?=
 =?us-ascii?Q?MVMRy+fxsP9v8qeeWDMhTIcsfkqLXfW2m6ZqWo1tm+fsoS/VV1EV5NRZkJlU?=
 =?us-ascii?Q?shIE50VTCz6r2tsg5KYE1S2/9Yy0ay7sYxmPNSPOJE8P6g2KYtssIfjUz2KZ?=
 =?us-ascii?Q?t/xp0+WqreJehnfMvJMH7ZPtvu6hin7mQ8l1mw/7RCtJTC/M16nMpaXaA9vm?=
 =?us-ascii?Q?XhJ5cJ1War10mbRDia975iNcKmOxsp0tNNmUYNO3k9WrKG6idijHTohLfNF+?=
 =?us-ascii?Q?wk/B4VeH1CPqCNpop8kxpxg42rHfpM7fllqaWTrACxjZLhzQnMFo+cLm8TGY?=
 =?us-ascii?Q?cmj16k2SbEDpLRG//XC+KISsQf2C20676CagZSYcFcnLVopSkDAv9lgl7EMC?=
 =?us-ascii?Q?A7n7nLJ0D3ZGOm+1AS/puD6RVyOkXk7hjpfwZ+2iOHWJAHTwFzIrpUbo/cMD?=
 =?us-ascii?Q?trv72B54QY5BxL9bGQnbrFptT2fZfj5RcQhwRDAIkFqHmJ+ASYdJ/1uFe0Tb?=
 =?us-ascii?Q?49LRqCQr374+fKgxi9jF3WzmRl8up6TPpyIdxur5iYliWPS5kOHfTdsqvF0D?=
 =?us-ascii?Q?d+XEEr0Hn4aN/fm+itDYAGBIc1Nk8GecdQrCOo7I9VO8xXptGsHqiPv0U7vG?=
 =?us-ascii?Q?hNhZ3o8pR4kofmBVJrZGno2815ctscDM1cfO1lLJAyKTJNGOTb6XHsurARYs?=
 =?us-ascii?Q?lJZ7yEqfiXM+TZOjUkIveqpgpBcdGX5+9L3I/28UOjdDjZPP16+pXhRwp9fT?=
 =?us-ascii?Q?AINkcLF7A5lTAebgDBlEXviPnCZXD8ZMtvuP+juHl/6O66oLx7wBdNGClRwq?=
 =?us-ascii?Q?rnENYdlXavtPBjT/QVSIzCSycG2KCjUFaPqgha84KVKi3TdBEbNH9s7TinwI?=
 =?us-ascii?Q?0duwwsldXVrIAvbDjozcIS6eXw3YGxX29FD95tDWD+2AU2bcX+TSAZjE8s0O?=
 =?us-ascii?Q?b47ubEN9bQPZ92R5M2DMTBKYFpSOQvCyL3qYNbNLcs/EZ7/mDHuAagjK1OuL?=
 =?us-ascii?Q?bUNZe16faOvKkK5zd05AzIkDjdZPEyqfQOFxXsgUJ8dP5bby2qKMmUeo0Aw7?=
 =?us-ascii?Q?Yz1M8Vp3y3ArhGl0BDtWr/E42TH/HWwwu1JekgKNErSJFHZ+3ik3VfhwmZzP?=
 =?us-ascii?Q?znKRwXMTfKE/BXF8iLnz0FzHXknQPzS/bZIsMyx9CmUh3xIlYvj26uYahrmR?=
 =?us-ascii?Q?4ZEWo724Dp+aZ3Mq53hZH/Mwn0vwRk/rcsmNFm+VgNDnI7sQ6pVqEZ65Oni+?=
 =?us-ascii?Q?Qshat3/fpqpKUcVpmDBmAAZYm8z8osjqkWd7uVH9i/MHFUl8KLWNkjX1hUsv?=
 =?us-ascii?Q?4b9iQMgpmN0INcxZam7kNfNhyd3Ig3nPk8tHFiAKhoviIVu8NC/u4us83gmo?=
 =?us-ascii?Q?uCRGwkSsEXUbErJzJR0sasvnV+jXsege67psaxUzBqfaYH55TNKKp2CkqNVb?=
 =?us-ascii?Q?ARf6Og95joxnhuSzOCpl3o6l/N5bWGvT9MWqcwr1w/Xj+OdErGRGe98aquIp?=
 =?us-ascii?Q?6Pe/wSARJrmBG2AF69+YCJmP4ORU3wEhWVufGV1FRkbP5FSyy0uMtTdyWcOg?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	N9kVOsTBpq44mcqRMo2DsT0dFEK7loxokSf5favx5dO9mZsT7XgIIXhbf/h4uGhNnD+fao37uKL3uB5dwAWa12kEGoqvlIfSKGCAoMEDteDqPbfNlUfpYvrSc3em5ehSUyNhDPnNnB88pUCEs+tnxnC9pAqyVP2J7mXXgukrN6aJzK4njKN4Xq12TSDijmEQ91lytsnGYlCI0YQLUVUZLXT/8hazdshFeH0qvAy8hLra9F0guYlqPOx3jGZj4qiVWa92czY/16CG7z8QVDR2eJJ14GMaEX/exQwNAX1Sy/iQHuNSW482Koa2xCWiB1E5as7qysuSEw3XjzOy4aktsyWbwlAhn7/PATWXSt6crSlJoV65zAU4KWoXhrNF/s2wOLP0lX/ziRRBkl12vALbgcU2iJG+gFHNtmhpHHbrFRDOqbMSpyOivXEgAp/72MrF6ixmdaVz6LKt4H5WOlpEDN4ACUbrC6d2Hw6HP1nr53XXNRiJdkRDKJhL1f9OvhyEXw62+pAvG7R0L8BSp5FbCWU8xH78FETByJDANBm/X3nw/prhGxPZKpUCTxkeSivij4QeOHw3vwbJ2gCTBkpT5TXtgufRvMovSiYRfdMa/CM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fca325-4ccf-4638-adbf-08dc6723759e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2024 01:35:17.6094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yio2e9kXhFFtDw4HA0/29uDm9B26V+DEp5+ogXBTS7WslmNNDf78hkfYQLgSI/Cu7DWd7EIQgG7xfdkRljwtMVB32+zqDIgulLueB+aADSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-27_24,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=859 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404280008
X-Proofpoint-GUID: IqIB0ZztJrE_AKjaXylfBifLgK1t_G9Q
X-Proofpoint-ORIG-GUID: IqIB0ZztJrE_AKjaXylfBifLgK1t_G9Q

So, I found the following in a BPF log on kernel 6.8.0:

BPF: 799: (bf) r4 = r6                     ; frame2: R4_w=scalar(id=8,smin=smin3
2=0,smax=umax=smax32=umax32=255,var_off=(0x0; 0xff)) R6_w=scalar(id=8,smin=smin3
2=0,smax=umax=smax32=umax32=255,var_off=(0x0; 0xff))
BPF: 800: (07) r4 += 7                     ; frame2: R4_w=scalar(smin=umin=smin32=umin32=7,smax=umax=smax32=umax32=262,var_off=(0x0; 0x1ff))
BPF: 801: (57) r4 &= -8                    ; frame2: R4_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=262,var_off=(0x0; 0x1f8))

And when checking kernel 6.5.0:

BPF: 791: (bf) r4 = r6                     ; frame2: R4_w=scalar(id=8,umax=255,var_off=(0x0; 0xff)) R6_w=scalar(id=8,umax=255,var_off=(0x0; 0xff))
BPF: 792: (07) r4 += 7                     ; frame2: R4_w=scalar(umin=7,umax=262,var_off=(0x0; 0x1ff))
BPF: 793: (57) r4 &= -8                    ; frame2: R4_w=scalar(umax=262,var_off=(0x0; 0x1f8)) 

And kernel 5.15.0:

BPF: 799: (bf) r4 = r6
BPF: 800: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
BPF: 800: (07) r4 += 7
BPF: 801: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=0,umin_value=7,umax_value=262,var_off=(0x0; 0x1ff)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
BPF: 801: (57) r4 &= -8
BPF: 802: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=0,umax_value=262,var_off=(0x0; 0x1f8)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value

This code is supposed to round the value in %r4 up to the nearest multiple of
8.  So, if %r4 is 255, one would expect this to yield 256.  Yet, it does not.
