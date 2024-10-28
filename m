Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC331E0B87
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150324; cv=fail; b=kpJ3kSpZD6XiWZthGf4SGW+LwWHu8JsOOX/XF5kpIrb9HJGM3A1MiPobqQNCrzxWb64NginbNlV89uzzUxlQF/WIxDoMsf9S9NyqhazYirSoNLDbCPuyEgmzZAGyrEs09qyFHjyiBvEg0VvRJ5ADoAC9PqAdJBjvhaggpvqWOAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150324; c=relaxed/simple;
	bh=VpcTO8RQFfurq1pWNlczjCPQqcBNFwQIRwsLHH202mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UpNqG8FqtkzdrHKU8wWR32phKT6RoQxHux9uN6e9ILYTCTjcXQ4ykcCabZO3Qz3bn2xg10NrigdhXyBFJqk/YHZZLISVeIHOUvOS/5e1huQbJY2GKL2PQAh8oJt8PX1ciE8MUqYSS3kha7GPBi7SK6L7cnhevCWtg13Bcj0Dnm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IkZB3ZFp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wi2PLnE3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IkZB3ZFp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wi2PLnE3"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtaPF020939;
	Mon, 28 Oct 2024 21:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=zYkyQ2bz0LFAlp2ZkKwPqssAIJeFudajr2oP/Pyi/5k=; b=
	IkZB3ZFprI84AEk/YjuOlBvgXNEQIyAgM4rmsbmPmJBaf9I0JZ1rXN6TgVw3okLS
	EmTx0eVQ5gEZ5HpqdRdOw4sS+f3dzdDhdl4hezsEk3gPSP0/OnTzRFTU6QTnk6sO
	3/VJimUU01ZBofXTX394pTPc8XEdLwmeyw2YGULj1OhuqajvMDMPfERe4yNfT4nv
	kR9a2lY+KY+Ff+E4KU1UrICROoiVpQe1cDEY68lfHZh9uqTLpWa0wFyya9ic8pDz
	NFDa8KALjNZYuvQt6vKa45pSFhgCJmAE9jze/ldVdgnQI+1SnPsBaBq4eSLCuM9q
	OH9v843ew1a5VFqBI9Pnpw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3yxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKwgEg011746;
	Mon, 28 Oct 2024 21:18:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnabe7nw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTgKwDK086jbkV6RdKrjAsPo3oaBx4inuYb/cTbiu03PurlhcSGVIS5bzTTFlePkEhTmDuceZZeY4yrAH+pSNPGxge2tLhMaP/5frxNdMfUpZmYChq6FF7wmb7/pFMtR4NNtmxkIH1MQq7k8uTLspIoEcLyvcAldI/yBAVxTOYinUPX5z/O9HYDILGxVLVDFiBYcXpPQPMMFLAI0GOOs2OEMtXf1Fu9CLJxb+LQ5CTzUB3OwUU4QT0KM/1XaHYWaD5a/glWRyaRbbpcmWUGc3ohjzivWEMonOc23IU+/Whn6zM5hxWm5k8QNoQu7gyUxBkRgmM/uY/S7+/H/4ctXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYkyQ2bz0LFAlp2ZkKwPqssAIJeFudajr2oP/Pyi/5k=;
 b=ZjbZJ5fjANVehjMD21WwvIQSr5vY3bIscmzKJvmdWSpX8dWzNHP8o7ltmMeyro/Ctfy+nRqa0g3id+0jgGOUPjLM6P79FdOorqYp83WjJPkfyS47bYTKWZFYnErOgv9jT8yPpD33XUP+VeKjBnP+k2g15lT16wWxINioE+kyoInzDbvTZjd/gmbw8Dkr1mIeZXjGY9iw3Et3nRgCAXKLqH3ar8uJqMS4xan5V/WY2TB/zDpXfn6uDuBNVZuEZ2Tb07SfQpBqnVA03+XBHPEqDtlFQoMhfP7umTF0ac/uVhSfkeUSBpuF4TIdgXTqGrVhB3JBzpxNen6vctqU9ZoqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYkyQ2bz0LFAlp2ZkKwPqssAIJeFudajr2oP/Pyi/5k=;
 b=Wi2PLnE3VHOpSG5NyI6DGMw3CUO7hedXfPFFiqEiF1WyPZHgTdi7TpQepQKTS1U3esbu9xYXgl0/T4nVcdjwu7B6f3pEG4dd59aMlpYA+hLo3xU4qtaskIYWf52EoMABuM7CXR50TEGAHs2noG+xIiMk7kCXPdALYDBp34HP0wI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:33 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:33 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH v2 12/14] man: add manpage for dtprobed(8)
Date: Mon, 28 Oct 2024 21:18:01 +0000
Message-ID: <20241028211803.458685-13-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::17) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: cc927d9f-bce5-4c47-45ac-08dcf7961405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HJMdAX/JVtv3/F3hrRq0TV+ioGRJqGkl+bq/qLyZYdelQvBa7BoVnKXVLuXt?=
 =?us-ascii?Q?Tpt4CFwD5tP3MNu6P/a9sDW8X015UX3Wn6fP2ETGMWdXveXmIQ+7C919vaQf?=
 =?us-ascii?Q?+FpTAW8A70i46G4YDFLlxfxCf/YuiIGb2OlhMcVpgBgswOl+vTch1nacT7O6?=
 =?us-ascii?Q?PwJHLcRBN0thcqtWND3Xd2tSpjzDqblTlWMjfYuD52hWbRl11lJjyIFpysva?=
 =?us-ascii?Q?Bn5cq4myk+C/wjQBPHoEgc74FlV9M1hmGB4kdHzYrw/muOYLRb9MPjCpUIrB?=
 =?us-ascii?Q?K/ZYqrIyX+CC9H15EwPeJCJwyt4RhLLSV1TihxtOaar78s8lG4YVvp3+38sh?=
 =?us-ascii?Q?K57nHGEhrI/QTbx65d96lgrRxwhqbkcSzj4BYRhJ/PHyXye+Gzj6mwsMVgVa?=
 =?us-ascii?Q?ttDQ70RFWajzEbnEqblC/QdsU1lh5syFDdtQikAr41U7Hx02jIKdz9FomB+C?=
 =?us-ascii?Q?X1xrEo7WJ8WQ2oSrclj7/1rSRv/XGn6CCCgvZsvXbszvGPItnnidGKUf3xu9?=
 =?us-ascii?Q?A/Z4opNr619DTrBRXD/+32U5/XTLvDul+jeATule8jaf1z93BpBGtf8MIzDe?=
 =?us-ascii?Q?6vEQXL6T4E07XYNGydRwcfGmsxH5jAvIgQWd2flqJG6X2L+3X4i/KutRsxOI?=
 =?us-ascii?Q?oivoO7sSy4LstLQNYBPyaOxHs0XU1yKRgrgfzs4Vfgi6K1nKvuFRi1idfCFd?=
 =?us-ascii?Q?wQFk3c20eYZiuQ00ePHf2qoo8FGnWiEDTPa9YuiF01uQkVKr+ZzO97ZhFp0l?=
 =?us-ascii?Q?2w8bQZI2Rk3AXODPPJ1CVphWBzPpxfAunxhI7I0cz/9bVfKAsMS7UcwNaPg1?=
 =?us-ascii?Q?Khezf+axFUbOCA6zXOgU0CqX2Vum/k6WLjce9bwJ4dmZlPCwfNRaO9Zlwl5G?=
 =?us-ascii?Q?dcSWGwDrpltCzCgG4aPxuz6d99gQyS6jG1HfJXfitGqQ+RoIhoGB0Pv14hBQ?=
 =?us-ascii?Q?XmNQG3zwhu1qCN98GrZ+nWFr7XO4zwxVaAYCmyIrvxXhmCPSYBVGjUmnSINR?=
 =?us-ascii?Q?NdnruQgo3XbrQirmb5SaqH/eZsAlo/yxMqjFohb0DmvCGuxMWr3JzDpMKjs5?=
 =?us-ascii?Q?lYhl3ej0DoAguX81bRkbbWyyWXvsA3+RwLKxG6ngu4ocKeh1URLC2bUYeMP9?=
 =?us-ascii?Q?fJDgxDnsDRpzGbxs3iGOrTj0WJgBRO9udjPvaB2Mv3omXXhMGWhFT86zb1jW?=
 =?us-ascii?Q?hKYdO/N8Rb7zqMhD0tEMeKQVEfnoylUVMa0k99BQ6zG4G6JKtvLxSy9z+rb9?=
 =?us-ascii?Q?Yfdy9rFZt+Sub5xCveYByYV/BWIv1XwL78BeFneEuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EwrH4LElbrvXVhqq6KN2dQ2p91pSQ6PWYGrQvoYBST2iu5xLFyVBOZQb9Dg1?=
 =?us-ascii?Q?PqcHVvaIhKhjtu62MGhiFdrcew9ehsDx042W2Fh4Ma7x+BCIp6M6lYjq7fZ3?=
 =?us-ascii?Q?vGugocB/QMTh5lr/GDfn7NAMDROvL1KZIH9nNhGaG5cXRI9QycmL+Rl2QlXq?=
 =?us-ascii?Q?nMIBZ0pm30TcaAY4esLk+2rvmyr6ztJUVzCivS+MnSYtgc9W2cb+2T/aWibk?=
 =?us-ascii?Q?2LAVyKT8q9JTC2gb9m93U6qd6526ZHR85K6+6iATK2/9jjvISj7884zhL/MH?=
 =?us-ascii?Q?7iFG3IjYMTwoHhviF6xPlBZtJrWhi2QE9q3pNlBPWCYV6L/9XmSaj5qExZ7f?=
 =?us-ascii?Q?Y3M7CkqaZheuFkKRgDdtk9YA4zKlS4vHsr6J1kp/2JQEvuURJFfrOj9vTpto?=
 =?us-ascii?Q?buh4DKxVMf+Hor4Jx3itdDg9Ea6WekOHTik4s+V4ZGx1zBNGDmR/JdqiM5nX?=
 =?us-ascii?Q?6k/IAGoZMY4OOPQuh3MY7meAewth3cab+3uXOmkxo/cNRqXtXytNaSSEnW7G?=
 =?us-ascii?Q?sXYB4cLECybXD/qyIB0+BZ4ZLqrYJLBbjBRfmUqGej+4Xi258eIgh9ydWQaO?=
 =?us-ascii?Q?Ef6wvfuPkHKiM69453GSYLvsHvMl4c7d5FTflHJjZbEZ09X1uGEgkYFocdAi?=
 =?us-ascii?Q?m+lrhuFPdVlkWm+6R9RX2vAUTFiG6F7r/cgB4w3r8k2+V2kkVdA3xseuTvT6?=
 =?us-ascii?Q?zg590AAXqVh+dwmCeiqztqw8d+RLh26/CW9bTWBPmvhiYf7yuChR0IGZG3Oy?=
 =?us-ascii?Q?AQ9Rhp3pDg1cFy9lvjyO6yay8x1wf/XbZpWA2jJaqLmf9huJzN5YHLFmhlpW?=
 =?us-ascii?Q?t3VHUqcQoGdm2ReuY3kNw3SKWHoEGtdZjAmUl5ZMFV/x/Csy/WyCtrwM1QAI?=
 =?us-ascii?Q?kuGn2xKcI+aS0EdcYYkYnNCO+ZZeTGHTf/cFsItOorSsHPFKmB9fpJm57PFz?=
 =?us-ascii?Q?JSKcLZNxbB1s2/IZB+XiPJ5012ONeNedI8BWQTuulAArtQMLyXFhIb/rG5KL?=
 =?us-ascii?Q?4Xtl2+Ubl2NU4syCZklG1prQLPRqJIpZcw/ETgchCI7mB84Lv1wAaug2aUKC?=
 =?us-ascii?Q?+5KHEglq0CaxzMutSW4WESCI0n9uxF2utyQW/hrSxX0h33doIk6iGczEA3u0?=
 =?us-ascii?Q?5oVM8bepn8UAavL28iSVUEalyWPsDxwOPR2XJhj05pZONeslU1y0328k/dE9?=
 =?us-ascii?Q?7nv6SadXjwhN9wWL5CdIPLx7igcg6eZsebrBbAfOcWVkplWn0pJrbyQrIsg1?=
 =?us-ascii?Q?TOmiA0xZUxiydd2Kc7uyGeY+LcneoTI8W6SAtrU6CtOrgVJg7AFvXPyXh7Ex?=
 =?us-ascii?Q?EL2W70hSnBC4jHusUotioCThayfKGiTq6Enoq7gCWgUENxKRyCTRmaJZVx2h?=
 =?us-ascii?Q?1UTLZxsKW4ThQcbdu560iD/mUNg/4acSvrWLfZOgK4yHxO3SSe3kXZ1P9IBO?=
 =?us-ascii?Q?j6EMWuhzbhPOEVVqEBtRDGmdo7Wpm/pn5XdGe3ngFZYMKlp9Df7Dn5LFx4OZ?=
 =?us-ascii?Q?WjU7G7S5pyz4y75HlHH7rBHuTjYjmSK8ZFw+h/2z62hddDiTkniriiRrEauJ?=
 =?us-ascii?Q?kmfpdbvwlBhaFJsWQQrb7Zip5Kw7setVRZVxz0A2rAaR/CcDMfZydzvXRUTB?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m7cUc73puNuiPYmK0RkxKQPk3wCr2rap5tnDrjr84hPgOtbYBdCZzYNnw/xjTHDddU8puBuhlGy7sXEHFsM4x4CZBg9nsYd3BD94aOykctC/aazSpsEEPPYLPwWXcrU6bOPyN2s0+H76YksjW320GMKuryh913RMQfyw46pYRhaJZ6aKdz5em5x/hRnAjJe1ADvevvASuBkNnlO7EXWFVBXS5ycV9TWChFJsvZJUjO0CHJEcHmWI7nGxQmalbUdCcyi3GCNYDTnmPTmQitFmL6qxk/03wjua1BPsEAGw54+qxmMtBASn9YQJ230GTrKEhOW7qd6fPmP+2MG48rsi66fYYOuP6pyO1/OwJ6YnzlF8oKnLr7IpK+QkkymxCRsx2q/gTST1Uj/Xgwronk4td1bssyNp7qtPvY3P9mhrlvDZaj4QczUzQjDALjGe8sp3AOSoDDxrdjgVFRLR0SLuXkTzp6Sh19TJD9qD0E7Jjqm3On1RRGG7OHEjK6zUNg+UbIQYsu3rD0db1RD1NZt+FC0mbRHPkXzvxDsES4IkmXurG5XSxf6j5y7g+sQO4o0a87i4Lau3cUT9Y4SMMwV7CrSVtDUCErqJ7TWSB9/VxOc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc927d9f-bce5-4c47-45ac-08dcf7961405
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:33.4535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imhxaiAqTiDtASyPbdU+2I67LkpS8DqWvd2hyGQXH4njt3YPsQ2Wlgu6XiQYZuXAUIyyTFNXMJKme5b+5Fyt6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: fYs7B-HSXGcpbc3wCKmq8LsIC4WZlv8C
X-Proofpoint-GUID: fYs7B-HSXGcpbc3wCKmq8LsIC4WZlv8C

Cross-reference it from dtrace(8) and vice versa.

Bug: https://github.com/oracle/dtrace-utils/issues/94
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 cmd/dtrace.8        |  3 ++-
 dtprobed/Build      |  2 ++
 dtprobed/dtprobed.8 | 64 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 dtprobed/dtprobed.8

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index fb9392d29cb2..c299073239eb 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -184,7 +184,8 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
 .
 .SH SEE ALSO
 .BR cpp (1),
-.BR ssh (1)
+.BR ssh (1),
+.BR dtprobed (1)
 .LP
 .I Oracle Linux DTrace Guide
 .
diff --git a/dtprobed/Build b/dtprobed/Build
index 346cd6aee190..7d98ddf836c3 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -57,6 +57,8 @@ install::
 	mkdir -p $(INSTSBINDIR)
 	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
 	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
+	$(call describe-install-target,$(INSTMANDIR),dtprobed.8)
+	install -m 644 $(dtprobed_DIR)/dtprobed.8 $(INSTMANDIR)/man8
 	mkdir -p $(INSTUDEVDIR)
 	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
 	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
diff --git a/dtprobed/dtprobed.8 b/dtprobed/dtprobed.8
new file mode 100644
index 000000000000..2ebe89ccc426
--- /dev/null
+++ b/dtprobed/dtprobed.8
@@ -0,0 +1,64 @@
+'\" te
+.\" Oracle Linux DTrace.
+.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
+.\" Licensed under the Universal Permissive License v 1.0 as shown at
+.\" http://oss.oracle.com/licenses/upl.
+.TH dtrace 8 "22 Oct 2023" "Oracle Linux" "Linux Programmer's Manual"
+.SH NAME
+dtprobed \- USDT-tracking daemon
+.SH SYNOPSIS
+.SY dtprobed
+.OP -Fd
+.OP \-d devname
+.OP \-t timeout
+.YS
+.
+.SH DESCRIPTION
+.LP
+\fBdtprobed\fP is a component of the DTrace system that keeps track of USDT probes within running processes, parsing and storing the DOF they provide for later consumption by \fBdtrace\fP proper.
+.LP
+\fBdtprobed\fP should be started as soon as possible after startup and should always be kept running: processes that start before it may not have usable USDT probes.  On systemd systems this is usually done automatically.  (Restarting on upgrade should also be done for you by the packaging system.)
+.LP
+The following options are supported:
+.TP
+\fB\-F\fP
+Put \fBdtprobed\fP into the foreground: log output to \fIstderr\fP instead of the syslog. (Routinely used by systemd.)
+.TP
+\fB\-d\fP
+Enable debugging: log extra output, and disable sandboxing of the DOF parser.
+.TP
+\fB-n\fP \fIdevname\fP
+Name the CUSE device something other than the default \fIdtrace/helper\fP. DOF-containing processes will not connect to this instance unless pointed at it via the \fIDTRACE_DOF_INIT_DEVNAME\fP environment variable.  Using this option is necessary if for some reason (perhaps debugging) you want to have two dtprobeds running at once.  (They will still share a state directory, so DTrace will know about all probes discovered by all running \fBdtprobed\fPs.)
+.TP
+\fB\-t\fP \fItimeout\fP
+Timeout, in seconds, for DOF reads from the parser child.  DOF that takes longer than this to parse will be discarded.  The default (5 seconds) is probably always reasonable. Setting this too low might cause legitimate DOF to be discarded: setting it too high might cause faulty DOF to block \fBdtprobed\fP, preventing registration of new probes.
+.
+.SH "ENVIRONMENT VARIABLES"
+.LP
+Ignoring internal testing-only variables, \fBdtprobed\fP itself does not accept any environment variables: but programs that talk to it (any program that contains USDT probes) do accept some.
+.TP
+\fIDTRACE_DOF_INIT_DEBUG\fP
+Output debugging messages to standard error if set (to anything).
+.TP
+\fIDTRACE_DOF_INIT_DEVNAME\fP
+The full name of the helper device to send registration requests on: by default, \fI/dev/dtrace/helper\fP. \fBdtprobed\fP is listening on the other end of this device.
+.TP
+\fIDTRACE_DOF_INIT_DISABLE\fP
+Disable DOF registration entirely.
+.
+.SH FILES
+.
+.TP
+\fI/run/dtrace/stash\fP
+Private stash of DOF.
+.TP
+\fI/run/dtrace/probes\fP
+Parsed representations of every probe.  The parsed representation is shared between
+.MR dtrace 8
+and \fBdtprobed\fP, and can change between releases: on upgrade, \fBdtprobed\fP should be restarted, and will regenerate any parsed DOF that is needed, so \fBdtrace\fPs started after the upgrade will still work.  (Still-running \fBdtrace\fPs from before the upgrade may become unable to see newly-added probes.)
+.
+.SH SEE ALSO
+.
+.BR dtrace (8)
+.LP
+.I Oracle Linux DTrace Guide
-- 
2.46.0.278.g36e3a12567

